import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class RewardInterstitialAdManager {
  static final RewardInterstitialAdManager _instance = RewardInterstitialAdManager._internal();

  factory RewardInterstitialAdManager() => _instance;

  RewardInterstitialAdManager._internal();

  RewardedInterstitialAd? _rewardInterstitialAd;
  bool _isShowingAd = false;

  bool get isShowingAd => _isShowingAd;

  int _index = 0;

  final List<String> _adUnitIds = [
    "ca-app-pub-3940256099942544/5354046379","/21775744923/example/rewarded-interstitial"
    // AppConfig.appDataSet?.googleRewardedIntrestialId ?? '',
    // AppConfig.appDataSet?.adxRewardedIntrestialId ?? '',
  ];

  bool _isAdX(String id) {
    return id.trim().startsWith('/');
  }

  void loadAd() {
    if (_rewardInterstitialAd != null) return;

    final adUnitId = _adUnitIds[_index].trim();
    if (adUnitId.isEmpty) return;

    final isAdXId = _isAdX(adUnitId);

    RewardedInterstitialAd.load(
      adUnitId: adUnitId,
      request: isAdXId ? const AdManagerAdRequest() : const AdRequest(),
      rewardedInterstitialAdLoadCallback: RewardedInterstitialAdLoadCallback(
        onAdLoaded: (ad) {
          _rewardInterstitialAd = ad;
          _index = 0;
        },
        onAdFailedToLoad: (error) {
          _rewardInterstitialAd = null;
          if (_index == 0 && _adUnitIds.length > 1) {
            _index = 1;
            loadAd();
            return;
          }
        },
      ),
    );
  }

  void showAd({required VoidCallback onUserEarnedReward, required VoidCallback onAdClosed}) {
    if (_rewardInterstitialAd == null) {
      onAdClosed();
      loadAd();
      return;
    }
    _isShowingAd = true;

    _rewardInterstitialAd!.fullScreenContentCallback = FullScreenContentCallback(
      onAdShowedFullScreenContent: (ad) {
        _isShowingAd = true;
      },
      onAdDismissedFullScreenContent: (ad) {
        _isShowingAd = false;
        ad.dispose();
        _rewardInterstitialAd = null;
        loadAd();
        onAdClosed();
      },
      onAdFailedToShowFullScreenContent: (ad, error) {
        _isShowingAd = false;
        ad.dispose();
        _rewardInterstitialAd = null;
        loadAd();
        onAdClosed();
      },
    );

    _rewardInterstitialAd!.show(
      onUserEarnedReward: (AdWithoutView ad, RewardItem reward) {
        onUserEarnedReward();
      },
    );
  }
}
