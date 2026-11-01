import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class RewardedOnTapAdManager {
  RewardedOnTapAdManager._internal();

  static final RewardedOnTapAdManager _instance = RewardedOnTapAdManager._internal();

  factory RewardedOnTapAdManager() => _instance;

  bool _isLoading = false;
  bool _isShowingAd = false;
  bool _isProcessingTap = false;

  Timer? _loadingTimer;
  int _requestGeneration = 0;

  static const Duration _maxUserWait = Duration(seconds: 35);

  bool get isLoading => _isLoading;

  bool get isShowingAd => _isShowingAd;

  bool get isProcessingTap => _isProcessingTap;

  List<String> get _adUnitIds => [
    "ca-app-pub-3940256099942544/5224354917", "/21775744923/example/rewarded",
    // AppConfig.appDataSet?.googleRewardedId ?? '', AppConfig.appDataSet?.adxRewardedId ?? ''
  ].map((id) => id.trim()).where((id) => id.isNotEmpty).toSet().toList();

/*  void _showLoader() {
    // Theme-based colors
    final backgroundColor = AppColor.card;

    final textColor = AppColor.primaryText;

    final accentColor = AppColor.primaryButton;
    final iconColor = AppColor.iconColor;

    EasyLoading.instance
      ..loadingStyle = EasyLoadingStyle.custom
      ..backgroundColor = backgroundColor
      ..textColor = textColor
      ..indicatorColor = accentColor
      ..fontSize = 15
      ..radius = 18
      ..contentPadding = const EdgeInsets.symmetric(horizontal: 45, vertical: 20)
      ..textPadding = const EdgeInsets.only(top: 5)
      ..boxShadow = [BoxShadow(color: accentColor.withValues(alpha: 0.18), blurRadius: 25, spreadRadius: 2)];

    EasyLoading.show(
      status: 'Please wait...\nGetting things ready',
      maskType: EasyLoadingMaskType.black,
      indicator: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: SizedBox(
          width: 64,
          height: 64,
          child: Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                width: 64,
                height: 64,
                child: CircularProgressIndicator(
                  strokeWidth: 2.5,
                  backgroundColor: accentColor.withValues(alpha: 0.15),
                  valueColor: AlwaysStoppedAnimation<Color>(accentColor),
                ),
              ),
              Container(
                width: 54,
                height: 54,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: iconColor.withValues(alpha: 0.10),
                  border: Border.all(color: iconColor.withValues(alpha: 0.60), width: 1.5),
                  boxShadow: [BoxShadow(color: iconColor.withValues(alpha: 0.20), blurRadius: 16)],
                ),
                child: Icon(Icons.videocam_rounded, color: AppColor.iconColor, size: 33),
              ),
            ],
          ),
        ),
      ),
    );
  }*/

  // void _hideLoader() {
  //   EasyLoading.dismiss();
  // }

  // --------------------------------------------------
  // SHOW REWARDED AD ON USER TAP
  // --------------------------------------------------

  void showAd({required VoidCallback onUserEarnedReward, required VoidCallback onAdClosed}) {
    // Prevent duplicate requests.
    if (_isProcessingTap || _isLoading || _isShowingAd) {
      return;
    }

    final ids = _adUnitIds;

    if (ids.isEmpty) {
      EasyLoading.showToast('No ad available right now.');

      onAdClosed();
      return;
    }

    _isProcessingTap = true;
    _isLoading = true;

    final generation = ++_requestGeneration;
    bool requestFinished = false;

    // _showLoader();

    // --------------------------------------------------
    // COMPLETE REQUEST WITHOUT AN AD
    // --------------------------------------------------

    void completeWithoutAd({bool showError = true}) {
      if (requestFinished) return;

      requestFinished = true;

      // Critical: reset every request state.
      _isProcessingTap = false;
      _isLoading = false;
      _isShowingAd = false;

      _loadingTimer?.cancel();
      _loadingTimer = null;

      // _hideLoader();

      if (showError) {
        EasyLoading.showToast('Ad is not available.\nPlease try again shortly.');
      }

      onAdClosed();
    }

    // --------------------------------------------------
    // USER WAIT TIMEOUT
    // --------------------------------------------------

    _loadingTimer = Timer(_maxUserWait, () {
      if (generation != _requestGeneration || requestFinished) {
        return;
      }

      // Reject any late load callbacks.
      ++_requestGeneration;

      completeWithoutAd();
    });

    // --------------------------------------------------
    // DISPLAY LOADED AD
    // --------------------------------------------------

    void showLoadedAd(RewardedAd ad) {
      if (generation != _requestGeneration || requestFinished) {
        unawaited(ad.dispose());
        return;
      }

      requestFinished = true;

      _loadingTimer?.cancel();
      _loadingTimer = null;

      _isLoading = false;
      _isShowingAd = true;

      // _hideLoader();

      bool completed = false;
      bool rewardEarned = false;

      void finish(RewardedAd shownAd) {
        if (completed) return;

        completed = true;

        _isShowingAd = false;
        _isProcessingTap = false;
        _isLoading = false;

        unawaited(shownAd.dispose());

        onAdClosed();
      }

      ad.fullScreenContentCallback = FullScreenContentCallback<RewardedAd>(
        onAdShowedFullScreenContent: (ad) {},
        onAdImpression: (ad) {},
        onAdDismissedFullScreenContent: (ad) {
          finish(ad);
        },
        onAdFailedToShowFullScreenContent: (ad, error) {
          finish(ad);
        },
      );

      try {
        unawaited(
          ad
              .show(
                onUserEarnedReward: (AdWithoutView rewardedAd, RewardItem reward) {
                  if (completed || rewardEarned) return;

                  rewardEarned = true;

                  // This callback does not itself verify
                  // a BTC reward with your backend.
                  onUserEarnedReward();
                },
              )
              .catchError((Object error) {
                finish(ad);
              }),
        );
      } catch (error) {
        finish(ad);
      }
    }

    // --------------------------------------------------
    // LOAD AD WITH FALLBACK
    // --------------------------------------------------

    void tryLoad(int index) {
      if (generation != _requestGeneration || requestFinished) {
        return;
      }

      if (index >= ids.length) {
        completeWithoutAd();
        return;
      }

      final adUnitId = ids[index];
      final isAdManager = adUnitId.startsWith('/');

      bool attemptFinished = false;

      void loaded(RewardedAd ad) {
        if (attemptFinished || generation != _requestGeneration || requestFinished) {
          unawaited(ad.dispose());
          return;
        }

        attemptFinished = true;

        showLoadedAd(ad);
      }

      void failed(Object error) {
        if (attemptFinished || generation != _requestGeneration || requestFinished) {
          return;
        }

        attemptFinished = true;

        tryLoad(index + 1);
      }

      try {
        final Future<void> request;

        if (isAdManager) {
          request = RewardedAd.load(
            adUnitId: adUnitId,
            request: const AdManagerAdRequest(),
            rewardedAdLoadCallback: RewardedAdLoadCallback(onAdLoaded: loaded, onAdFailedToLoad: failed),
          );
        } else {
          request = RewardedAd.load(
            adUnitId: adUnitId,
            request: const AdRequest(),
            rewardedAdLoadCallback: RewardedAdLoadCallback(onAdLoaded: loaded, onAdFailedToLoad: failed),
          );
        }

        unawaited(
          request.catchError((Object error) {
            failed(error);
          }),
        );
      } catch (error) {
        failed(error);
      }
    }

    tryLoad(0);
  }
}
