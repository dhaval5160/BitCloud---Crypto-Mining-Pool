import 'package:cloud_mining_farm/theme/colors.dart';
import 'package:cloud_mining_farm/theme/config.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:shimmer/shimmer.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:visibility_detector/visibility_detector.dart';

class BigNative extends StatefulWidget {
  final EdgeInsetsGeometry? padding;
  final double? radius;

  const BigNative({super.key, this.padding, this.radius});

  @override
  State<BigNative> createState() => _BigNativeState();
}

class _BigNativeState extends State<BigNative> {
  NativeAd? _nativeAd;
  bool _isLoading = true;
  bool _hasLoaded = false;
  int _index = 0;

  List<String> get _adUnitIds => [
    "ca-app-pub-3940256099942544/2247696110","/21775744923/example/native"
    // AppConfig.appDataSet?.googleNativeId ?? '',
    // AppConfig.appDataSet?.adxNativeId ?? '',
  ].where((id) => id.trim().isNotEmpty).toList();

  bool _isAdX(String id) => id.trim().startsWith('/');

  @override
  void initState() {
    super.initState();
    if (AppConfig.appDataSet?.googleNativeAdStatus == true) {
      loadAd();
    } else {
      _isLoading = false;
    }
  }

  void loadAd() {
    if (_hasLoaded) return;

    final validIds = _adUnitIds;
    if (_index >= validIds.length) {
      _handleFailAll();
      return;
    }

    final adUnitId = validIds[_index].trim();
    _isLoading = true;
    if (mounted) setState(() {});

    final isAdXId = _isAdX(adUnitId);
    String buttonColor = AppConfig.appDataSet?.nblColor ?? '#F35383';

    final customOptionsMap = {
      'backgroundColor': "#2E2C30",
      'textColor': '#F3F4F6',
      'subTextColor': '#9CA3AF',
      'buttonColor': buttonColor,
      'startColor': '#FF9A12',
    };

    final listener = NativeAdListener(
      onAdLoaded: (ad) => _handleSuccess(ad as NativeAd),
      onAdFailedToLoad: (ad, err) {
        ad.dispose();
        _handleFailNext();
      },
    );

    if (isAdXId) {
      NativeAd.fromAdManagerRequest(
        adUnitId: adUnitId,
        factoryId: 'big_native',
        customOptions: customOptionsMap,
        adManagerRequest: const AdManagerAdRequest(),
        listener: listener,
      ).load();
    } else {
      NativeAd(
        adUnitId: adUnitId,
        factoryId: 'big_native',
        customOptions: customOptionsMap,
        request: const AdRequest(),
        listener: listener,
      ).load();
    }
  }

  void _handleSuccess(NativeAd ad) {
    if (!mounted) {
      ad.dispose();
      return;
    }
    _hasLoaded = true;
    _nativeAd?.dispose();
    _nativeAd = ad;
    _isLoading = false;
    setState(() {});
  }

  void _handleFailNext() {
    if (!mounted) return;
    _index++;
    loadAd();
  }

  void _handleFailAll() {
    if (!mounted) return;
    _isLoading = false;
    setState(() {});
  }

  @override
  void dispose() {
    _nativeAd?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding ?? EdgeInsets.zero,
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 250),
        child: _isLoading
            ? NativeBigShimmer(radius: widget.radius)
            : _nativeAd != null
            ? ClipRRect(
                borderRadius: BorderRadius.circular(widget.radius ?? 12),
                child: SizedBox(
                  key: const ValueKey('ad'),
                  height: 285,
                  width: double.infinity,
                  child: Center(child: AdWidget(ad: _nativeAd!)),
                ),
              )
            : const SizedBox.shrink(),
      ),
    );
  }
}

// ------------------------------------------------------------------------------------------------------

class BigNativeS extends StatefulWidget {
  final EdgeInsetsGeometry? padding;
  final double? radius;

  const BigNativeS({super.key, this.padding, this.radius});

  @override
  State<BigNativeS> createState() => _BigNativeSState();
}

class _BigNativeSState extends State<BigNativeS> with SingleTickerProviderStateMixin {
  NativeAd? _nativeAd;
  bool isFetching = false;
  bool isFailed = false;
  int index = 0;

  List<String> get _adUnitIds => [
    "ca-app-pub-3940256099942544/2247696110","/21775744923/example/native"
    // AppConfig.appDataSet?.googleNativeId ?? '',
    // AppConfig.appDataSet?.adxNativeId ?? '',
  ].where((id) => id.trim().isNotEmpty).toList();

  bool _isAdX(String id) => id.trim().startsWith('/');

  void _checkAndLoad() {
    if (_nativeAd != null || isFetching || isFailed) return;
    loadAd();
  }

  Future<void> loadAd() async {
    final validIds = _adUnitIds;
    if (index >= validIds.length) {
      _handleFailAll();
      return;
    }

    final adUnitId = validIds[index].trim();
    isFetching = true;
    if (mounted) setState(() {});

    final isAdXId = _isAdX(adUnitId);

    String buttonColor = AppConfig.appDataSet?.nblColor ?? '#F35383';

    final customOptionsMap = {
      'backgroundColor': "#2E2C30",
      'textColor': '#F3F4F6',
      'subTextColor': '#9CA3AF',
      'buttonColor': buttonColor,
      'startColor': '#FF9A12',
    };

    final listener = NativeAdListener(
      onAdLoaded: (ad) => _handleSuccess(ad as NativeAd),
      onAdFailedToLoad: (ad, error) {
        ad.dispose();
        _handleFailNext();
      },
    );

    if (isAdXId) {
      NativeAd.fromAdManagerRequest(
        adUnitId: adUnitId,
        factoryId: 'big_native',
        customOptions: customOptionsMap,
        adManagerRequest: const AdManagerAdRequest(),
        listener: listener,
      ).load();
    } else {
      NativeAd(
        adUnitId: adUnitId,
        factoryId: 'big_native',
        customOptions: customOptionsMap,
        request: const AdRequest(),
        listener: listener,
      ).load();
    }
  }

  void _handleSuccess(NativeAd ad) {
    if (!mounted) {
      ad.dispose();
      return;
    }
    setState(() {
      _nativeAd?.dispose();
      _nativeAd = ad;
      isFetching = false;
      isFailed = false;
    });
  }

  void _handleFailNext() {
    if (!mounted) return;
    index++;
    loadAd();
  }

  void _handleFailAll() {
    if (!mounted) return;
    setState(() {
      _nativeAd?.dispose();
      _nativeAd = null;
      isFetching = false;
      isFailed = true;
    });
  }

  @override
  void dispose() {
    _nativeAd?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isFailed) {
      return Padding(padding: widget.padding ?? EdgeInsets.zero, child: const SizedBox.shrink());
    }

    final bool isReady = _nativeAd != null;

    return VisibilityDetector(
      key: Key('big-native-ad-${identityHashCode(this)}'),
      onVisibilityChanged: (info) {
        if (info.visibleFraction > 0.05) {
          _checkAndLoad();
        }
      },
      child: Padding(
        padding: widget.padding ?? EdgeInsets.zero,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(widget.radius ?? 12),
          child: AnimatedSize(
            duration: const Duration(milliseconds: 250),
            curve: Curves.easeOut,
            child: SizedBox(
              height: 285,
              width: double.infinity,
              child: isReady
                  ? OverflowBox(
                      minHeight: 285,
                      maxHeight: 285,
                      alignment: Alignment.topCenter,
                      child: AdWidget(ad: _nativeAd!),
                    )
                  : isFetching
                  ? const NativeBigShimmer()
                  : const SizedBox.shrink(),
            ),
          ),
        ),
      ),
    );
  }
}

class NativeBigShimmer extends StatelessWidget {
  final double? radius;

  const NativeBigShimmer({super.key, this.radius});

  @override
  Widget build(BuildContext context) {
    const baseColor = Color(0xFF38353B);
    const highlightColor = Color(0xFF4C4852);
    final double borderRadius = radius ?? 12.0;
    return Container(
      height: 285,
      width: double.infinity,
      decoration: BoxDecoration(color: AppColor.card, borderRadius: BorderRadius.circular(borderRadius)),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Shimmer.fromColors(
              baseColor: baseColor,
              highlightColor: highlightColor,
              child: Container(
                height: 150,
                width: double.infinity,
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8)),
              ),
            ),
            Spacer(),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Shimmer.fromColors(
                  baseColor: baseColor,
                  highlightColor: highlightColor,
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8)),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Shimmer.fromColors(
                    baseColor: baseColor,
                    highlightColor: highlightColor,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 18,
                          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8)),
                        ),
                        const SizedBox(height: 4),
                        Container(
                          height: 25,
                          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8)),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            6.heightBox,
            Shimmer.fromColors(
              baseColor: baseColor,
              highlightColor: highlightColor,
              child: Container(
                height: 40,
                width: double.infinity,
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
