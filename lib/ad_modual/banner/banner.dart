import 'package:cloud_mining_farm/theme/colors.dart';
import 'package:cloud_mining_farm/theme/config.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:shimmer/shimmer.dart';

class ShowBanner extends StatefulWidget {
  final EdgeInsets? padding;
  final EdgeInsets? nPadding;

  const ShowBanner({super.key, this.padding, this.nPadding});

  @override
  State<ShowBanner> createState() => _ShowBannerState();
}

class _ShowBannerState extends State<ShowBanner> {
  AdWithView? bannerAd;

  bool _isAdLoaded = false;
  bool _isLoading = false;

  int _index = 0;

  AdSize? _adSize;

  List<String> get _adUnitIds => [
    'ca-app-pub-3940256099942544/6300978111',
    '/21775744923/example/fixed-size-banner',
    // AppConfig.appDataSet?.googleBannerId ?? '',
    // AppConfig.appDataSet?.adxBannerId ?? '',
  ].where((id) => id.trim().isNotEmpty).toList();

  bool _isAdX(String id) => id.trim().startsWith('/');

  @override
  void initState() {
    super.initState();
    if (AppConfig.appDataSet?.googleBannerAdStatus == true) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        loadAd();
      });
    }
  }

  Future<void> loadAd() async {
    if (_isAdLoaded || _isLoading) return;

    final validIds = _adUnitIds;

    if (_index >= validIds.length) {
      _handleFailAll();
      return;
    }

    final adUnitId = validIds[_index].trim();

    _isLoading = true;

    if (mounted) {
      setState(() {});
    }

    final screenWidth = MediaQuery.of(context).size.width.toInt();

    _adSize = AdSize(width: screenWidth, height: 50);

    final isAdXId = _isAdX(adUnitId);

    if (isAdXId) {
      final ad = AdManagerBannerAd(
        adUnitId: adUnitId,
        sizes: [_adSize!],
        request: const AdManagerAdRequest(),
        listener: AdManagerBannerAdListener(
          onAdLoaded: (ad) {
            _handleSuccess(ad as AdWithView);
          },
          onAdFailedToLoad: (ad, error) {
            ad.dispose();
            _handleFailNext();
          },
        ),
      );

      ad.load();
    } else {
      final ad = BannerAd(
        adUnitId: adUnitId,
        size: _adSize!,
        request: const AdRequest(),
        listener: BannerAdListener(
          onAdLoaded: (ad) {
            _handleSuccess(ad as AdWithView);
          },
          onAdFailedToLoad: (ad, error) {
            ad.dispose();
            _handleFailNext();
          },
        ),
      );

      ad.load();
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
      _isAdLoaded = true;
      _isLoading = false;
    });
  }

  void _handleFailNext() {
    if (!mounted) return;

    _index++;

    setState(() {
      _isLoading = false;
    });

    loadAd();
  }

  void _handleFailAll() {
    if (!mounted) return;

    setState(() {
      _isLoading = false;
      _isAdLoaded = false;
    });
  }

  @override
  void dispose() {
    bannerAd?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading && !_isAdLoaded) {
      return Padding(padding: widget.padding ?? EdgeInsets.zero, child: const BannerShimmer());
    }

    if (!_isAdLoaded || bannerAd == null || _adSize == null) {
      return Padding(padding: widget.nPadding ?? EdgeInsets.zero, child: const SizedBox.shrink());
    }

    return Padding(
      padding: widget.padding ?? EdgeInsets.zero,
      child: SizedBox(
        width: _adSize!.width.toDouble(),
        height: _adSize!.height.toDouble(),
        child: Center(child: AdWidget(ad: bannerAd!)),
      ),
    );
  }
}

class BannerShimmer extends StatelessWidget {
  const BannerShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    const baseColor = Color(0xFF38353B);
    const highlightColor = Color(0xFF4C4852);

    return SizedBox(
      height: 50,
      width: double.infinity,
      child: Shimmer.fromColors(
        baseColor: baseColor,
        highlightColor: highlightColor,
        child: Container(decoration: BoxDecoration(color: AppColor.card)),
      ),
    );
  }
}
