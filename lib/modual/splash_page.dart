import 'package:cloud_mining_farm/ad_modual/app_open.dart';
import 'package:cloud_mining_farm/ad_modual/int_man/Interstitial.dart';
import 'package:cloud_mining_farm/modual/ctrl/home_ctrl.dart';
import 'package:cloud_mining_farm/modual/repository/start_time_rp.dart';
import 'package:cloud_mining_farm/modual/service/connection_service.dart';
import 'package:cloud_mining_farm/modual/service/subscription_service.dart';
import 'package:cloud_mining_farm/theme/colors.dart';
import 'package:cloud_mining_farm/theme/config.dart';
import 'package:cloud_mining_farm/utils/app_navigation/app_navigation.dart';
import 'package:cloud_mining_farm/utils/app_navigation/navigation.dart';
import 'package:cloud_mining_farm/utils/hive_service.dart';
import 'package:cloud_mining_farm/utils/utils.dart';
import 'package:cloud_mining_farm/widget/app_text.dart';
import 'package:cloud_mining_farm/widget/blinking_dot.dart';
import 'package:cloud_mining_farm/widget/no_internet_popup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:in_app_update/in_app_update.dart';
import 'package:velocity_x/velocity_x.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final HomeCtrl homeCtrl = Get.find();

  AppUpdateInfo? _updateInfo;
  bool showStartButton = false;

  NativeAd? _nativeAd;
  bool isAdLoaded = true;

  int index = 0;

  final List<String> _adUnitIds = [
    'ca-app-pub-1460059050916891/8242376467',
    '/21753324030,22779084639/bitcloud.crypto.cloud.mining.android_Native',
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      loadNative();
      checkInternet(context);
      checkForUpdate();
      callWait();
    });
  }

  Future<void> callWait() async {
    await SubscriptionService().init();
    await Future.delayed(const Duration(seconds: 4), () {
      if (!mounted) return;
      setState(() {
        showStartButton = true;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _nativeAd?.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      appBar: buildCustomAppBar(context, showFullAppBar: false),
      body: SafeArea(
        child: Column(
          children: [
            50.heightBox,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35),
              child: AppText(
                'Cloud-Based Bitcoin Mining, Made Easy',
                textAlign: TextAlign.center,
                fontSize: 22,
                color: AppColor.text,
                fontFamily: AppConfig.montserrat,
                fontWeight: FontWeight.w600,
              ),
            ),
            15.heightBox,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35),
              child: AppText(
                'One tap to begin. Real-time performance and earnings tracking.',
                textAlign: TextAlign.center,
                fontSize: 14,
                color: AppColor.subText,
                fontFamily: AppConfig.roboto,
              ),
            ),
            80.heightBox,
            showStartButton
                ? CustomSlideButton(
                    onSlideComplete: () async {
                      final bool? isLoggedIn = HiveService().getData<bool>(AppConfig.isLogin);

                      if (isLoggedIn == true) {
                        StartTimeService().resumeMiningFromStorage();
                        if (isProfileComplete()) {
                          homeCtrl.getWithdrawDetails();
                        }
                        showAdsTwice(() {
                          Navigation.pushNamed(Routes.systemInitializationScreen);
                        });
                      } else {
                        showAdsTwice(() {
                          Navigation.pushNamed(Routes.introPage);
                        });
                      }
                    },
                  )
                : CircularProgressIndicator(color: AppColor.white, strokeWidth: 2),

            Spacer(),
            AppText(
              "Ads may appear during this action.",
              textAlign: TextAlign.center,
              fontSize: 14,
              color: AppColor.subText,
              fontFamily: AppConfig.roboto,
            ),
            15.heightBox,
            AnimatedSize(
              duration: const Duration(milliseconds: 650),
              reverseDuration: const Duration(milliseconds: 300),
              curve: Curves.easeOutCubic,
              alignment: Alignment.bottomCenter,
              child: _nativeAd == null
                  ? SizedBox(height: 40, width: 30, child: CupertinoActivityIndicator(color: AppColor.white))
                  : TweenAnimationBuilder<double>(
                      key: const ValueKey('loaded_big_native_splash'),
                      tween: Tween<double>(begin: 0, end: 1),
                      duration: const Duration(milliseconds: 600),
                      curve: Curves.easeOutCubic,
                      builder: (BuildContext context, double value, Widget? child) {
                        return Opacity(
                          opacity: value,
                          child: Transform.translate(
                            offset: Offset(0, 18.0 * (1 - value)),
                            child: Transform.scale(scale: 0.97 + (0.03 * value), alignment: Alignment.bottomCenter, child: child),
                          ),
                        );
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: SizedBox(
                          height: 285,
                          width: double.infinity,
                          child: Center(child: AdWidget(ad: _nativeAd!)),
                        ),
                      ),
                    ),
            ).px(10),
            20.heightBox,
          ],
        ),
      ),
    );
  }

  /*  startingHandle() async {
    final bool? isLoggedIn = HiveService().getData<bool>(AppConfig.isLogin);

    if (isLoggedIn == true) {
      homeCtrl.userActiveSubList.clear();
      final UserProfileModel userProfileModel = await ApiRepo.userLogin(
        email: HiveService().getData<String>(AppConfig.userEmail),
        reference: '',
        firstTime: '',
      );

      homeCtrl.btcBalance.value = double.parse(userProfileModel.totalBtcDirect.toString());
      homeCtrl.miningBtcValue.value = double.parse(userProfileModel.totalBtcDirect.toString());
      homeCtrl.inviteBtcBalance.value = double.parse(userProfileModel.totalBtcRefrence.toString());
      homeCtrl.userActiveSubList.addAll(userProfileModel.subscription ?? []);
      AppConfig.mingTimer = userProfileModel.mingTimer ?? 1800;
      AppConfig.factorFast = userProfileModel.factorFast ?? 0.00000000001;
      AppConfig.factorRegular = userProfileModel.factorRegular ?? 0.000000000001;
      AppConfig.factorMedium = userProfileModel.factorMedium ?? 0.0000000000001;
      AppConfig.factorSlow = userProfileModel.factorSlow ?? 0.00000000000001;
      AppConfig.factorUltraSlow = userProfileModel.factorUltraSlow ?? 0.000000000000001;
      AppConfig.miningIntervals = userProfileModel.miningIntervals ?? 60;
      AppConfig.userProfileId = userProfileModel.profileId ?? "";
      AppConfig.referralCode = userProfileModel.profileRefrenceCode ?? "";
    }
  }*/

  void showAdsTwice(VoidCallback onAdClosed) {
    if (AppConfig.appDataSet?.appOpen == true) {
      AppOpenAdManager().showAdIfAvailable(
        onAdClosed: () {
          InterstitialAdManager().showInterstitial(onAdClosed: onAdClosed);
        },
      );
    } else {

      InterstitialAdManager().showInterstitial(onAdClosed: onAdClosed);
    }
  }

  Future<void> checkInternet(BuildContext context) async {
    final hasConnection = await ConnectionService.instance.checkConnection();

    if (!context.mounted) return;

    if (!hasConnection) {
      NoInternetPopup.show(
        context,
        onTryAgain: () async {
          if (!context.mounted) return;
          loadNative();
          checkInternet(context);
        },
      );
    }
  }

  Future<void> checkForUpdate() async {
    try {
      AppUpdateInfo updateInfo = await InAppUpdate.checkForUpdate();
      setState(() {
        _updateInfo = updateInfo;
      });

      if (_updateInfo?.updateAvailability == UpdateAvailability.updateAvailable) {
        if (_updateInfo!.immediateUpdateAllowed) {
          InAppUpdate.performImmediateUpdate();
        } else if (_updateInfo!.flexibleUpdateAllowed) {
          // Flexible update
          InAppUpdate.startFlexibleUpdate().then((_) {
            InAppUpdate.completeFlexibleUpdate();
          });
        }
      }
    } catch (e) {
      return;
    }
  }

  Future<void> loadNative() async {
    // 1. Filter out empty IDs upfront in local memory
    final validIds = _adUnitIds.where((id) => id.trim().isNotEmpty).toList();
    if (index >= validIds.length) {
      if (mounted) {
        setState(() => isAdLoaded = false);
      }
      return;
    }

    final adUnitId = validIds[index].trim();

    isAdLoaded = true;
    if (mounted) setState(() {});

    final customOptions = {
      'backgroundColor': "#2E2C30",
      'textColor': '#F3F4F6',
      'subTextColor': '#9CA3AF',
      'buttonColor': '#F35383',
      'startColor': '#FF9A12',
    };

    final listener = NativeAdListener(
      onAdLoaded: (ad) {
        if (!mounted) {
          ad.dispose();
          return;
        }
        _nativeAd?.dispose();
        _nativeAd = ad as NativeAd;
        isAdLoaded = false;
        setState(() {});
      },
      onAdFailedToLoad: (ad, error) {
        ad.dispose();
        if (!mounted) return;

        index++;
        loadNative();
      },
    );

    final isAdX = adUnitId.startsWith('/');

    if (isAdX) {
      NativeAd.fromAdManagerRequest(
        adUnitId: adUnitId,
        factoryId: 'big_native',
        customOptions: customOptions,
        adManagerRequest: const AdManagerAdRequest(),
        listener: listener,
      ).load();
    } else {
      NativeAd(
        adUnitId: adUnitId,
        factoryId: 'big_native',
        customOptions: customOptions,
        request: const AdRequest(),
        listener: listener,
      ).load();
    }
  }
}
