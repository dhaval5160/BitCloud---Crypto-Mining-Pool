import 'package:cloud_mining_farm/theme/colors.dart';
import 'package:cloud_mining_farm/theme/config.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:shimmer/shimmer.dart';
import 'package:visibility_detector/visibility_detector.dart';

class SmallNative extends StatefulWidget {
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? sPadding;
  final double? radius;

  const SmallNative({super.key, this.padding, this.radius, this.sPadding});

  @override
  State<SmallNative> createState() => _SmallNativeState();
}

class _SmallNativeState extends State<SmallNative> {
  NativeAd? nativeAd;
  bool isLoading = true;
  bool _hasLoaded = false;
  int index = 0;

  late final List<String> _validAdUnitIds = [
    "ca-app-pub-3940256099942544/2247696110","/21775744923/example/native"
    // AppConfig.appDataSet?.googleNativeId?.trim() ?? '',
    // AppConfig.appDataSet?.adxNativeId?.trim() ?? '',
  ].where((id) => id.isNotEmpty).toList();

  bool _isAdX(String id) => id.startsWith('/');

  @override
  void initState() {
    super.initState();
    if (AppConfig.appDataSet?.googleNativeAdStatus == true && _validAdUnitIds.isNotEmpty) {
      _loadAd();
    } else {
      isLoading = false;
    }
  }

  void _loadAd() {
    if (_hasLoaded || index >= _validAdUnitIds.length) {
      if (mounted) setState(() => isLoading = false);
      return;
    }

    final String adUnitId = _validAdUnitIds[index];
    final bool isAdXId = _isAdX(adUnitId);

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
        _handleFail();
      },
    );

    if (isAdXId) {
      NativeAd.fromAdManagerRequest(
        adUnitId: adUnitId,
        factoryId: 'small_native',
        customOptions: customOptionsMap,
        adManagerRequest: const AdManagerAdRequest(),
        listener: listener,
      ).load();
    } else {
      NativeAd(
        adUnitId: adUnitId,
        factoryId: 'small_native',
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
    setState(() {
      nativeAd = ad;
      isLoading = false;
    });
  }

  void _handleFail() {
    if (!mounted) return;
    index++;
    _loadAd(); // Try next fallback unit ID
  }

  @override
  void dispose() {
    nativeAd?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double borderRadius = widget.radius ?? 12.0;

    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      child: isLoading
          ? Padding(
              key: const ValueKey('shimmer'),
              padding: widget.padding ?? EdgeInsets.zero,
              child: NativeAdShimmer(radius: widget.radius),
            )
          : nativeAd != null
          ? Padding(
              key: const ValueKey('ad_container'),
              padding: widget.padding ?? EdgeInsets.zero,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(borderRadius),
                child: SizedBox(
                  height: 110,
                  width: double.infinity,
                  child: AdWidget(ad: nativeAd!),
                ),
              ),
            )
          : Padding(
              key: const ValueKey('empty_space'),
              padding: widget.sPadding ?? EdgeInsets.zero,
              child: const SizedBox.shrink(),
            ),
    );
  }
}

// -----------------------------------------------------------------------------------------------------

class SmallNativeS extends StatefulWidget {
  final EdgeInsetsGeometry? padding;
  final double? radius;

  const SmallNativeS({super.key, this.padding, this.radius});

  @override
  State<SmallNativeS> createState() => _SmallNativeSState();
}

class _SmallNativeSState extends State<SmallNativeS> with SingleTickerProviderStateMixin {
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
        factoryId: 'small_native',
        customOptions: customOptionsMap,
        adManagerRequest: const AdManagerAdRequest(),
        listener: listener,
      ).load();
    } else {
      NativeAd(
        adUnitId: adUnitId,
        factoryId: 'small_native',
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
      key: Key('sml-native-ad-${identityHashCode(this)}'),
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
              height: 110,
              width: double.infinity,
              child: isReady
                  ? OverflowBox(
                      minHeight: 110,
                      maxHeight: 110,
                      alignment: Alignment.topCenter,
                      child: AdWidget(ad: _nativeAd!),
                    )
                  : isFetching
                  ? const NativeAdShimmer()
                  : const SizedBox.shrink(),
            ),
          ),
        ),
      ),
    );
  }
}

class NativeAdShimmer extends StatelessWidget {
  final double? radius;

  const NativeAdShimmer({super.key, this.radius});

  @override
  Widget build(BuildContext context) {
    const baseColor = Color(0xFF38353B);
    const highlightColor = Color(0xFF4C4852);
    final double borderRadius = radius ?? 12.0;

    return Container(
      height: 110,
      width: double.infinity,
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(color: AppColor.card, borderRadius: BorderRadius.circular(borderRadius)),
      child: Shimmer.fromColors(
        baseColor: baseColor,
        highlightColor: highlightColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8)),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 18,
                        width: double.infinity,
                        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(4)),
                      ),
                      const SizedBox(height: 6),
                      Container(
                        height: 18,
                        width: double.infinity,
                        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(4)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            // CTA Button Placeholder
            Container(
              height: 33,
              width: double.infinity,
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8)),
            ),
          ],
        ),
      ),
    );
  }
}
