import 'package:cloud_mining_farm/theme/colors.dart';
import 'package:cloud_mining_farm/theme/config.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:shimmer/shimmer.dart';

class NativeBanner extends StatefulWidget {
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? sPadding;
  final double? radius;

  const NativeBanner({super.key, this.padding, this.radius, this.sPadding});

  @override
  State<NativeBanner> createState() => _NativeBannerState();
}

class _NativeBannerState extends State<NativeBanner> {
  NativeAd? _nativeAd;
  bool isLoading = true;
  bool _hasLoaded = false;
  int index = 0;

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
      isLoading = false;
    }
  }

  void loadAd() {
    if (_hasLoaded) return;

    final validIds = _adUnitIds;
    if (index >= validIds.length) {
      _handleFailAll();
      return;
    }

    final adUnitId = validIds[index].trim();
    isLoading = true;
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

    // 2. Fire ad load request
    if (isAdXId) {
      NativeAd.fromAdManagerRequest(
        adUnitId: adUnitId,
        factoryId: 'native_banner',
        customOptions: customOptionsMap,
        adManagerRequest: const AdManagerAdRequest(),
        listener: listener,
      ).load();
    } else {
      NativeAd(
        adUnitId: adUnitId,
        factoryId: 'native_banner',
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
    isLoading = false;
    setState(() {});
  }

  void _handleFailNext() {
    if (!mounted) return;
    index++;
    loadAd();
  }

  void _handleFailAll() {
    if (!mounted) return;
    isLoading = false;
    setState(() {});
  }

  @override
  void dispose() {
    _nativeAd?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 250),
      child: isLoading
          ? Padding(padding: widget.padding ?? EdgeInsets.zero, child: NativeBannerShimmer(radius: widget.radius,))
          : _nativeAd != null
          ? Padding(
              padding: widget.padding ?? EdgeInsets.zero,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(widget.radius ?? 12),
                child: SizedBox(
                  key: const ValueKey('ad'),
                  height: 135,
                  width: double.infinity,
                  child: AdWidget(ad: _nativeAd!),
                ),
              ),
            )
          : Padding(padding: widget.sPadding ?? EdgeInsets.zero, child: const SizedBox.shrink()),
    );
  }
}

class NativeBannerShimmer extends StatelessWidget {
  final double? radius;

  const NativeBannerShimmer({super.key, this.radius});

  @override
  Widget build(BuildContext context) {
    const baseColor = Color(0xFF38353B);
    const highlightColor = Color(0xFF4C4852);
    final double borderRadius = radius ?? 12.0;
    return Container(
      width: double.infinity,
      height: 135,
      decoration: BoxDecoration(color: AppColor.card, borderRadius: BorderRadius.circular(borderRadius)),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Shimmer.fromColors(
              baseColor: baseColor,
              highlightColor: highlightColor,
              child: Container(
                width: 120,
                height: 120,
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
                      height: 30,
                      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8)),
                    ),
                    const SizedBox(height: 5),
                    Container(
                      height: 30,
                      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8)),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      height: 40,
                      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8)),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
