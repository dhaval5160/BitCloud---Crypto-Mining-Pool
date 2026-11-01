
import 'package:cloud_mining_farm/ad_modual/int_man/interstitial.dart';
import 'package:cloud_mining_farm/ad_modual/int_man/rewarded.dart';
import 'package:cloud_mining_farm/ad_modual/int_man/rewarded_interstitial.dart';
import 'package:cloud_mining_farm/ad_modual/int_man/rewarded_on_tap.dart';
import 'package:cloud_mining_farm/theme/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class IntOrRwdAdManger {
  IntOrRwdAdManger._internal();

  static final IntOrRwdAdManger _instance = IntOrRwdAdManger._internal();

  factory IntOrRwdAdManger() => _instance;

  final InterstitialAdManager interstitial = InterstitialAdManager();

  final RewardInterstitialAdManager rewardInterstitial = RewardInterstitialAdManager();

  final RewardedAdManager rewarded = RewardedAdManager();

  final RewardedOnTapAdManager rewardedOnTap = RewardedOnTapAdManager();

  bool get _rewardPreload => AppConfig.appDataSet?.rewardPreload ?? true;

  void initAds() {
    if (AppConfig.appDataSet?.showInterstitial == true) {
      interstitial.loadAdMobAd();
    }

    if (AppConfig.appDataSet?.googleRewardedIntrestialStatus == true) {
      rewardInterstitial.loadAd();
    }

    if (_rewardPreload && AppConfig.appDataSet?.googleRewardedStatus == true) {
      rewarded.loadAd();
    }
  }

  void _showRewarded({required VoidCallback onReward, required VoidCallback onAdClosed}) {
    if (AppConfig.appDataSet?.googleRewardedStatus != true) {
      EasyLoading.showToast('No ad available right now.');
      onAdClosed();
      return;
    }

    if (_rewardPreload) {
      rewarded.showAd(onUserEarnedReward: onReward, onAdClosed: onAdClosed);
    } else {
      rewardedOnTap.showAd(onUserEarnedReward: onReward, onAdClosed: onAdClosed);
    }
  }

  void showIntORRwdAdOnGift({required VoidCallback onReward, required VoidCallback onAdClosed}) {
    final type = AppConfig.appDataSet?.gift;
    if (type == 0) {
      rewardInterstitial.showAd(onUserEarnedReward: onReward, onAdClosed: onAdClosed);
    } else if (type == 1) {
      interstitial.showInterstitial(
        onAdClosed: () {
          onReward();
          onAdClosed();
        },
      );
    } else if (type == 2) {
      _showRewarded(onReward: onReward, onAdClosed: onAdClosed);
    } else {
      onReward();
      onAdClosed();
    }
  }

  void showIntORRwdAdOnStart({required VoidCallback onReward, required VoidCallback onAdClosed}) {
    final type = AppConfig.appDataSet?.start;

    if (type == 0) {
      rewardInterstitial.showAd(onUserEarnedReward: onReward, onAdClosed: onAdClosed);
    } else if (type == 1) {
      interstitial.showInterstitial(
        onAdClosed: () {
          onReward();
          onAdClosed();
        },
      );
    } else if (type == 2) {
      _showRewarded(onReward: onReward, onAdClosed: onAdClosed);
    } else {
      onReward();
      onAdClosed();
    }
  }

  void showIntORRwdAdOnPlanAd({required VoidCallback onReward, required VoidCallback onAdClosed}) {
    final type = AppConfig.appDataSet?.planads;

    if (type == 0) {
      rewardInterstitial.showAd(onUserEarnedReward: onReward, onAdClosed: onAdClosed);
    } else if (type == 1) {
      interstitial.showInterstitial(
        onAdClosed: () {
          onReward();
          onAdClosed();
        },
      );
    } else if (type == 2) {
      _showRewarded(onReward: onReward, onAdClosed: onAdClosed);
    } else {
      EasyLoading.showToast('No ad available right now.');
      onAdClosed();
    }
  }
}

/*class IntOrRwdAdManger {
  static final IntOrRwdAdManger _instance = IntOrRwdAdManger._internal();

  factory IntOrRwdAdManger() => _instance;

  IntOrRwdAdManger._internal();

  final interstitial = InterstitialAdManager();
  final rewardInterstitial = RewardInterstitialAdManager();
  final rewarded = RewardedAdManager();

  void initAds() {
    if (AppConfig.appDataSet?.showInterstitial == true) {
      interstitial.loadAdMobAd();
    }
    if (AppConfig.appDataSet?.googleRewardedIntrestialStatus == true) {
      rewardInterstitial.loadAd();
    }
    if (AppConfig.appDataSet?.googleRewardedStatus == true) {
      rewarded.loadAd();
    }
  }

  void showIntORRwdAdOnGift({required VoidCallback onReward, required VoidCallback onAdClosed}) {
    if (AppConfig.appDataSet?.gift == 0) {
      rewardInterstitial.showAd(
        onUserEarnedReward: onReward,
        onAdClosed: () {
          onAdClosed();
        },
      );
      return;
    } else if (AppConfig.appDataSet?.gift == 1 ) {
      interstitial.showInterstitial(
        onAdClosed: () {
          onReward();
          onAdClosed();
        },
      );
      return;
    } else if (AppConfig.appDataSet?.gift == 2) {
      rewarded.showAd(
        onUserEarnedReward: onReward,
        onAdClosed: () {
          onAdClosed();
        },
      );
      return;
    } else {
      onReward();
      onAdClosed();
    }
  }

  void showIntORRwdAdOnPlanAd({required VoidCallback onReward, required VoidCallback onAdClosed}) {
    if (AppConfig.appDataSet?.planads == 0 ) {
      rewardInterstitial.showAd(
        onUserEarnedReward: onReward,
        onAdClosed: () {
          onAdClosed();
        },
      );
      return;
    } else if (AppConfig.appDataSet?.planads == 1) {
      interstitial.showInterstitial(
        onAdClosed: () {
          onReward();
          onAdClosed();
        },
      );
      return;
    } else if (AppConfig.appDataSet?.planads == 2) {
      rewarded.showAd(
        onUserEarnedReward: onReward,
        onAdClosed: () {
          onAdClosed();
        },
      );
      return;
    } else {
      EasyLoading.showToast("🎬 No ad available right now. Try again shortly!");
    }
  }

  void showIntORRwdAdOnStart({required VoidCallback onReward, required VoidCallback onAdClosed}) {
    if (AppConfig.appDataSet?.start == 0) {
      rewardInterstitial.showAd(
        onUserEarnedReward: onReward,
        onAdClosed: () {
          onAdClosed();
        },
      );
      return;
    } else if (AppConfig.appDataSet?.start == 1) {
      interstitial.showInterstitial(
        onAdClosed: () {
          onReward();
          onAdClosed();
        },
      );
      return;
    } else if (AppConfig.appDataSet?.start == 2) {
      rewarded.showAd(
        onUserEarnedReward: onReward,
        onAdClosed: () {
          onAdClosed();
        },
      );
      return;
    } else {
      onReward();
      onAdClosed();
    }
  }
}*/
