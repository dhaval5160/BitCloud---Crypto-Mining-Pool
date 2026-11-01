import 'package:cloud_mining_farm/theme/colors.dart';
import 'package:cloud_mining_farm/theme/config.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:shimmer/shimmer.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:visibility_detector/visibility_detector.dart';

class LargeBannerS extends StatefulWidget {
  const LargeBannerS({super.key});

  @override
  State<LargeBannerS> createState() => _LargeBannerSState();
}

class _LargeBannerSState extends State<LargeBannerS> {
  AdWithView? bannerAd;
  bool isFetching = false;
  bool isFailed = false;
  int index = 0;

  List<String> get _adUnitIds => [
    "ca-app-pub-3940256099942544/9214589741", "/21775744923/example/adaptive-banner",
    // AppConfig.appDataSet?.googleBannerId ?? '',
    // AppConfig.appDataSet?.adxBannerId ?? '',
  ].where((id) => id.trim().isNotEmpty).toList();

  bool _isAdX(String id) => id.trim().startsWith('/');

  @override
  void initState() {
    super.initState();
    if (AppConfig.appDataSet?.googleBannerAdStatus == false) {
      isFailed = true;
    }
  }

  void _checkAndLoad() {
    if (bannerAd != null || isFetching || isFailed) return;
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
    final int width = MediaQuery.sizeOf(context).width.truncate();

    final targetSize = AdSize.getInlineAdaptiveBannerAdSize(width, 300);

    if (isAdXId) {
      AdManagerBannerAd(
        adUnitId: adUnitId,
        sizes: [targetSize],
        request: const AdManagerAdRequest(),
        listener: AdManagerBannerAdListener(
          onAdLoaded: (ad) => _handleSuccess(ad as AdWithView),
          onAdFailedToLoad: (ad, error) {
            ad.dispose();
            _handleFailNext();
          },
        ),
      ).load();
    } else {
      BannerAd(
        adUnitId: adUnitId,
        size: targetSize,
        request: const AdRequest(),
        listener: BannerAdListener(
          onAdLoaded: (ad) => _handleSuccess(ad as AdWithView),
          onAdFailedToLoad: (ad, error) {
            ad.dispose();
            _handleFailNext();
          },
        ),
      ).load();
    }
  }

  void _handleSuccess(AdWithView ad) {
    if (!mounted) {
      ad.dispose();
      return;
    }
    bannerAd?.dispose();
    setState(() {
      bannerAd = ad;
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
      isFetching = false;
      isFailed = true;
    });
  }

  @override
  void dispose() {
    bannerAd?.dispose();
    super.dispose();
  }

  double _getAdHeight() {
    if (bannerAd is BannerAd) {
      final h = (bannerAd as BannerAd).size.height.toDouble();
      return h > 0 ? h : 300.0;
    } else if (bannerAd is AdManagerBannerAd) {
      final h = (bannerAd as AdManagerBannerAd).sizes.first.height.toDouble();
      return h > 0 ? h : 300.0;
    }
    return 300.0;
  }

  /// Helper to safely retrieve non-zero width from loaded ad instance
  double _getAdWidth(BuildContext context) {
    if (bannerAd is BannerAd) {
      final w = (bannerAd as BannerAd).size.width.toDouble();
      return w > 0 ? w : MediaQuery.sizeOf(context).width;
    } else if (bannerAd is AdManagerBannerAd) {
      final w = (bannerAd as AdManagerBannerAd).sizes.first.width.toDouble();
      return w > 0 ? w : MediaQuery.sizeOf(context).width;
    }
    return MediaQuery.sizeOf(context).width;
  }

  @override
  Widget build(BuildContext context) {
    if (AppConfig.appDataSet?.googleBannerAdStatus == false || isFailed) {
      return const SizedBox.shrink();
    }

    final bool isReady = bannerAd != null;
    final double currentAdHeight = _getAdHeight();
    final double currentAdWidth = _getAdWidth(context);

    return VisibilityDetector(
      key: Key('large-banner-ad-${identityHashCode(this)}'),
      onVisibilityChanged: (info) {
        if (info.visibleFraction > 0.05 && AppConfig.appDataSet?.googleBannerAdStatus == true) {
          _checkAndLoad();
        }
      },
      child: Container(
        height: isReady ? currentAdHeight : 300.0,
        width: double.infinity,
        alignment: Alignment.center,
        child: isReady
            ? SizedBox(
                width: currentAdWidth,
                height: currentAdHeight,
                child: AdWidget(ad: bannerAd!),
              )
            : isFetching
            ? const SizedBox(height: 300, width: double.infinity, child: BannerShimmer())
            : const SizedBox.shrink(),
      ),
    );
  }
}

class BannerShimmer extends StatelessWidget {
  final double? radius;

  const BannerShimmer({super.key, this.radius});

  @override
  Widget build(BuildContext context) {
    const baseColor = Color(0xFF38353B);
    const highlightColor = Color(0xFF4C4852);

    return Container(
      height: 300,
      width: double.infinity,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(color: AppColor.card, borderRadius: BorderRadius.circular(12)),
      child: Shimmer.fromColors(
        baseColor: baseColor,
        highlightColor: highlightColor,
        child: Column(
          children: [
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8)),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8)),
            ),
          ],
        ),
      ),
    ).px(10);
  }
}
