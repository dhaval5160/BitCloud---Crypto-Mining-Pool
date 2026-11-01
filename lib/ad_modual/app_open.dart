import 'dart:async';
import 'dart:ui';

import 'package:cloud_mining_farm/theme/config.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

/// Resume-only App Open manager. Its inventory is never shared with splash.
class BGOpenAd {
  BGOpenAd._internal();

  static final BGOpenAd _instance = BGOpenAd._internal();

  factory BGOpenAd() => _instance;

  AppOpenAd? _appOpenAd;
  DateTime? _loadedAt;
  Future<bool>? _loadingFuture;
  int _generation = 0;
  static bool isShowingAd = false;

  static const Duration _maxAge = Duration(hours: 4);
  static const Duration _requestTimeout = Duration(seconds: 15);

  bool get _isEnabled => AppConfig.appDataSet?.googleAppOpenAdStatus ?? false;

  List<String> get _adUnitIds {
    return [
      "ca-app-pub-3940256099942544/9257395921",
      "/21775744923/example/app-open",
      // AppConfig.appDataSet?.bgAppOpenId ?? '',
      // AppConfig.appDataSet?.bgAdxAppOpenId ?? '',
    ].map((e) => e.trim()).where((e) => e.isNotEmpty).toSet().toList();
  }

  bool get isAdAvailable {
    if (!_isEnabled) return false;
    if (_appOpenAd == null) return false;
    if (_loadedAt == null || DateTime.now().difference(_loadedAt!) >= _maxAge) {
      _clearAd();
      return false;
    }
    return true;
  }

  void _clearAd() {
    final ad = _appOpenAd;
    _appOpenAd = null;
    _loadedAt = null;
    if (ad != null) unawaited(ad.dispose());
  }

  Future<bool> loadAd() {
    if (!_isEnabled) return Future.value(false);
    if (isAdAvailable) return Future.value(true);
    if (_loadingFuture != null) return _loadingFuture!;

    final generation = _generation;
    final future = _loadCycle(generation);
    _loadingFuture = future;
    unawaited(
      future.then((_) {
        if (identical(_loadingFuture, future)) _loadingFuture = null;
      }),
    );
    return future;
  }

  Future<bool> _loadCycle(int generation) async {
    // Try each distinct configured source once, rather than randomly
    // selecting the same failing ID twice.
    final ids = _adUnitIds;
    for (final id in ids) {
      if (generation != _generation || !_isEnabled) return false;
      if (await _loadSingleAd(id, generation)) return true;
    }
    return false;
  }

  Future<bool> _loadSingleAd(String id, int generation) async {
    final result = Completer<bool>();
    late final Timer timeout;
    timeout = Timer(_requestTimeout, () {
      if (!result.isCompleted) {
        result.complete(false);
      }
    });

    final callback = AppOpenAdLoadCallback(
      onAdLoaded: (ad) {
        if (result.isCompleted || generation != _generation || !_isEnabled) {
          unawaited(ad.dispose());
          if (!result.isCompleted) result.complete(false);
          return;
        }
        _clearAd();
        _appOpenAd = ad;
        _loadedAt = DateTime.now();
        result.complete(true);
      },
      onAdFailedToLoad: (error) {
        if (!result.isCompleted) result.complete(false);
      },
    );

    try {
      if (id.startsWith('/')) {
        await AppOpenAd.loadWithAdManagerAdRequest(
          adUnitId: id,
          adManagerAdRequest: const AdManagerAdRequest(),
          adLoadCallback: callback,
        );
      } else {
        await AppOpenAd.load(adUnitId: id, request: const AdRequest(), adLoadCallback: callback);
      }
    } catch (error) {
      if (!result.isCompleted) result.complete(false);
    }

    try {
      return await result.future;
    } finally {
      timeout.cancel();
    }
  }

  /// Never waits for a new request on foreground. Only shows cached inventory.
  Future<void> showAdIfAvailable() async {
    if (!_isEnabled || isShowingAd || !isAdAvailable) {
      return;
    }

    final ad = _appOpenAd!;
    _appOpenAd = null;
    _loadedAt = null;
    isShowingAd = true; // reserve before awaiting ad.show()
    bool finished = false;

    void finish(AppOpenAd shownAd) {
      if (finished) return;
      finished = true;
      isShowingAd = false;
      unawaited(shownAd.dispose());
      // Don't initiate another request during the foreground transition.
      // The next background event / initial preload handles it.
    }

    ad.fullScreenContentCallback = FullScreenContentCallback<AppOpenAd>(
      onAdShowedFullScreenContent: (_) {},
      onAdDismissedFullScreenContent: finish,
      onAdFailedToShowFullScreenContent: (ad, error) {
        finish(ad);
      },
    );

    try {
      await ad.show();
    } catch (error) {
      finish(ad);
    }
  }

  void disposeAd() {
    _generation++;
    _clearAd();
  }
}

/// Splash-only App Open manager. Uses its own distinct IDs and ad cache.
class AppOpenAdManager {
  AppOpenAdManager._internal();

  static final AppOpenAdManager _instance = AppOpenAdManager._internal();

  factory AppOpenAdManager() => _instance;

  AppOpenAd? _appOpenAd;
  DateTime? _loadedAt;
  Future<bool>? _loadingFuture;
  int _generation = 0;
  static bool isShowingAd = false;

  static const Duration _maxAge = Duration(hours: 4);
  static const Duration _requestTimeout = Duration(seconds: 7);

  List<String> get _adUnitIds {
    return [
      "ca-app-pub-3940256099942544/9257395921",
      "/21775744923/example/app-open",
      // AppConfig.appDataSet?.googleAppOpenId ?? '',
      // AppConfig.appDataSet?.adxAppOpenId ?? '',
    ].map((e) => e.trim()).where((e) => e.isNotEmpty).toSet().toList();
  }

  bool get isAdAvailable {
    if (_appOpenAd == null) return false;
    if (_loadedAt == null || DateTime.now().difference(_loadedAt!) >= _maxAge) {
      _clearAd();
      return false;
    }
    return true;
  }

  void _clearAd() {
    final ad = _appOpenAd;
    _appOpenAd = null;
    _loadedAt = null;
    if (ad != null) unawaited(ad.dispose());
  }

  Future<bool> loadAd() {
    if (isAdAvailable) return Future.value(true);
    if (_loadingFuture != null) return _loadingFuture!;
    final generation = _generation;
    final future = _loadCycle(generation);
    _loadingFuture = future;
    unawaited(
      future.then((_) {
        if (identical(_loadingFuture, future)) _loadingFuture = null;
      }),
    );
    return future;
  }

  Future<bool> _loadCycle(int generation) async {
    for (final id in _adUnitIds) {
      if (generation != _generation) return false;
      if (await _loadSingleAd(id, generation)) return true;
    }
    return false;
  }

  Future<bool> _loadSingleAd(String id, int generation) async {
    final result = Completer<bool>();
    late final Timer timeout;
    timeout = Timer(_requestTimeout, () {
      if (!result.isCompleted) {
        result.complete(false);
      }
    });
    final callback = AppOpenAdLoadCallback(
      onAdLoaded: (ad) {
        if (result.isCompleted || generation != _generation) {
          unawaited(ad.dispose());
          if (!result.isCompleted) result.complete(false);
          return;
        }
        _clearAd();
        _appOpenAd = ad;
        _loadedAt = DateTime.now();
        result.complete(true);
      },
      onAdFailedToLoad: (error) {
        if (!result.isCompleted) result.complete(false);
      },
    );
    try {
      if (id.startsWith('/')) {
        await AppOpenAd.loadWithAdManagerAdRequest(
          adUnitId: id,
          adManagerAdRequest: const AdManagerAdRequest(),
          adLoadCallback: callback,
        );
      } else {
        await AppOpenAd.load(adUnitId: id, request: const AdRequest(), adLoadCallback: callback);
      }
    } catch (error) {
      if (!result.isCompleted) result.complete(false);
    }
    try {
      return await result.future;
    } finally {
      timeout.cancel();
    }
  }

  /// Splash can briefly wait for inventory, but never indefinitely.
  Future<void> showAdIfAvailable({VoidCallback? onAdClosed}) async {
    if (isShowingAd) return;
    isShowingAd = true;
    bool handedToSdk = false;
    bool finished = false;

    void complete() {
      if (finished) return;
      finished = true;
      isShowingAd = false;
      onAdClosed?.call();
    }

    try {
      if (!isAdAvailable) {
        // Timeout and fallback are handled inside loadAd().
        if (!await loadAd()) {
          complete();
          return;
        }
      }
      if (!isAdAvailable) {
        complete();
        return;
      }

      final ad = _appOpenAd!;
      _appOpenAd = null;
      _loadedAt = null;
      handedToSdk = true;

      void finish(AppOpenAd shownAd) {
        if (finished) return;
        unawaited(shownAd.dispose());
        complete();
      }

      ad.fullScreenContentCallback = FullScreenContentCallback<AppOpenAd>(
        onAdShowedFullScreenContent: (_) {},
        onAdDismissedFullScreenContent: finish,
        onAdFailedToShowFullScreenContent: (ad, error) {
          finish(ad);
        },
      );
      try {
        await ad.show();
      } catch (error) {
        finish(ad);
      }
    } catch (error) {
      if (!handedToSdk) complete();
    }
  }

  void disposeAd() {
    _generation++;
    _clearAd();
  }
}
