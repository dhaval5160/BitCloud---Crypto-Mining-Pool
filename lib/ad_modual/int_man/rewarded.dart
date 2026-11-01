import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class RewardedAdManager {
  static final RewardedAdManager _instance = RewardedAdManager._internal();

  factory RewardedAdManager() => _instance;

  RewardedAdManager._internal();

  RewardedAd? _rewardedAd;

  bool _isShowingAd = false;

  bool get isShowingAd => _isShowingAd;

  int _index = 0;

  final List<String> _adUnitIds = [
    "ca-app-pub-3940256099942544/5224354917","/21775744923/example/rewarded"
    // AppConfig.appDataSet?.googleRewardedId ?? '', AppConfig.appDataSet?.adxRewardedId ?? ''
  ];

  bool _isAdX(String id) {
    return id.trim().startsWith('/');
  }

  void loadAd() {
    if (_rewardedAd != null) return;

    final adUnitId = _adUnitIds[_index].trim();
    if (adUnitId.isEmpty) return;

    final isAdXId = _isAdX(adUnitId);

    RewardedAd.load(
      adUnitId: adUnitId,
      request: isAdXId ? const AdManagerAdRequest() : const AdRequest(),
      rewardedAdLoadCallback: RewardedAdLoadCallback(
        onAdLoaded: (ad) {
          _rewardedAd = ad;
          _index = 0;
        },
        onAdFailedToLoad: (error) {
          _rewardedAd = null;
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
    if (_rewardedAd == null) {
      onAdClosed();
      loadAd();
      return;
    }

    _isShowingAd = true;

    _rewardedAd!.fullScreenContentCallback = FullScreenContentCallback(
      onAdShowedFullScreenContent: (ad) {
        _isShowingAd = true;
      },
      onAdDismissedFullScreenContent: (ad) {
        _isShowingAd = false;
        ad.dispose();
        _rewardedAd = null;
        loadAd();
        onAdClosed();
      },
      onAdFailedToShowFullScreenContent: (ad, error) {
        _isShowingAd = false;
        ad.dispose();
        _rewardedAd = null;
        loadAd();
        onAdClosed();
      },
    );

    _rewardedAd!.show(
      onUserEarnedReward: (ad, reward) {
        onUserEarnedReward();
      },
    );
  }
}
