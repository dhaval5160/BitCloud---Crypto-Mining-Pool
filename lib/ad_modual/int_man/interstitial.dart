import 'package:cloud_mining_farm/theme/config.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

const int maxFailedLoadAttempts = 3;

class InterstitialAdManager {
  static final InterstitialAdManager _instance = InterstitialAdManager._internal();

  factory InterstitialAdManager() => _instance;

  InterstitialAdManager._internal();

  InterstitialAd? _interstitialAd;

  int loadAttempts = 0;
  int interstitialAdShow = 0;
  int interstitialAdBackShow = 0;
  bool _isLoading = false;

  bool _isShowingAd = false;

  bool get isShowingAd => _isShowingAd;

  int _index = 0;

  final List<String> _adUnitIds = [
    "ca-app-pub-3940256099942544/1033173712", "/21775744923/example/interstitial",
    // AppConfig.appDataSet?.googleInterstitialId ?? '',
    // AppConfig.appDataSet?.adxInterstitialId ?? '',
  ];

  bool _isAdX(String id) {
    return id.trim().startsWith('/');
  }

  void loadAdMobAd() {
    if (_interstitialAd != null || _isLoading) return;

    if (_adUnitIds.isEmpty) return;

    final adUnitId = _adUnitIds[_index].trim();
    if (adUnitId.isEmpty) return;

    _isLoading = true;

    InterstitialAd.load(
      adUnitId: adUnitId,
      request: _isAdX(adUnitId)
          ? const AdManagerAdRequest()
          : const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) {
          _isLoading = false;
          _interstitialAd = ad;
          loadAttempts = 0;
          _index = 0;

        },
        onAdFailedToLoad: (error) {
          _isLoading = false;
          loadAttempts++;


          if (_index == 0 && _adUnitIds.length > 1) {
            _index = 1;
            loadAdMobAd();
            return;
          }

          if (loadAttempts < maxFailedLoadAttempts) {
            loadAdMobAd();
          }
        },
      ),
    );
  }

  void showInterstitialAds() {
    if (AppConfig.appDataSet?.showInterstitial == true) {
      if (_interstitialAd != null) {
        _isShowingAd = true;

        _interstitialAd?.fullScreenContentCallback = FullScreenContentCallback(
          onAdDismissedFullScreenContent: (InterstitialAd ad) {
            _isShowingAd = false;
            ad.dispose();
            loadAdMobAd();
          },
          onAdFailedToShowFullScreenContent: (InterstitialAd ad, AdError error) {
            _isShowingAd = false;
            ad.dispose();
            loadAdMobAd();
          },
        );

        _interstitialAd?.show();
        _interstitialAd = null;
      } else {
        loadAdMobAd();
      }
    }
  }

  void showInterstitialByCount() {
    if (AppConfig.appDataSet?.showInterstitial == true) {
      if (interstitialAdShow == AppConfig.appDataSet?.interstitialAdCount) {
        interstitialAdShow = 0;

        if (_interstitialAd != null) {
          _isShowingAd = true;

          _interstitialAd?.fullScreenContentCallback = FullScreenContentCallback(
            onAdDismissedFullScreenContent: (InterstitialAd ad) {
              _isShowingAd = false;
              ad.dispose();
              loadAdMobAd();
            },
            onAdFailedToShowFullScreenContent: (InterstitialAd ad, AdError error) {
              _isShowingAd = false;
              ad.dispose();
              loadAdMobAd();
            },
          );

          _interstitialAd?.show();
          _interstitialAd = null;
        } else {
          loadAdMobAd();
        }
      } else {
        interstitialAdShow++;
      }
    }
  }

  void showInterstitialByBackCount() {
    if (AppConfig.appDataSet?.showInterstitial == true) {
      if (interstitialAdBackShow == AppConfig.appDataSet?.interstitialBackAdCount) {
        interstitialAdBackShow = 0;

        if (_interstitialAd != null) {
          _isShowingAd = true;

          _interstitialAd?.fullScreenContentCallback = FullScreenContentCallback(
            onAdDismissedFullScreenContent: (InterstitialAd ad) {
              _isShowingAd = false;
              ad.dispose();
              loadAdMobAd();
            },
            onAdFailedToShowFullScreenContent: (InterstitialAd ad, AdError error) {
              _isShowingAd = false;
              ad.dispose();
              loadAdMobAd();
            },
          );

          _interstitialAd?.show();
          _interstitialAd = null;
        } else {
          loadAdMobAd();
        }
      } else {
        interstitialAdBackShow++;
      }
    }
  }

  void showInterstitial({required VoidCallback onAdClosed}) {
    if (AppConfig.appDataSet?.showInterstitial != true) {
      onAdClosed();
      return;
    }

    if (_isShowingAd) {
      onAdClosed();
      return;
    }

    final ad = _interstitialAd;

    if (ad == null) {

      loadAdMobAd();
      onAdClosed();
      return;
    }

    _interstitialAd = null;
    _isShowingAd = true;

    bool completed = false;

    void finish(InterstitialAd shownAd) {
      if (completed) return;
      completed = true;

      _isShowingAd = false;
      shownAd.dispose();

      loadAdMobAd();
      onAdClosed();
    }

    ad.fullScreenContentCallback = FullScreenContentCallback<InterstitialAd>(
      onAdDismissedFullScreenContent: finish,
      onAdFailedToShowFullScreenContent: (ad, error) {
        finish(ad);
      },
    );

    try {
      ad.show();
    } catch (error) {
      finish(ad);
    }
  }
}
