import 'dart:async';

import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:cloud_mining_farm/ad_modual/app_open.dart';
import 'package:cloud_mining_farm/ad_modual/int_man/Interstitial.dart';
import 'package:cloud_mining_farm/ad_modual/int_man/rewarded.dart';
import 'package:cloud_mining_farm/ad_modual/int_man/rewarded_interstitial.dart';
import 'package:cloud_mining_farm/ad_modual/int_man/rewarded_on_tap.dart';
import 'package:cloud_mining_farm/modual/ctrl/home_ctrl.dart';
import 'package:cloud_mining_farm/modual/ctrl/rcd_ctrl.dart';
import 'package:cloud_mining_farm/modual/page/new_home.dart';
import 'package:cloud_mining_farm/modual/page/new_store.dart';
import 'package:cloud_mining_farm/modual/page/setting_page.dart';
import 'package:cloud_mining_farm/modual/page/wallet_page.dart';
import 'package:cloud_mining_farm/modual/page/widget/reward_zone.dart';
import 'package:cloud_mining_farm/modual/repository/daily_reward_2.dart';
import 'package:cloud_mining_farm/modual/repository/start_time_rp.dart';
import 'package:cloud_mining_farm/modual/service/connection_service.dart';
import 'package:cloud_mining_farm/theme/asset.dart';
import 'package:cloud_mining_farm/theme/colors.dart';
import 'package:cloud_mining_farm/theme/config.dart';
import 'package:cloud_mining_farm/utils/app_navigation/app_navigation.dart';
import 'package:cloud_mining_farm/utils/app_navigation/navigation.dart';
import 'package:cloud_mining_farm/utils/responsiv.dart';
import 'package:cloud_mining_farm/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fgbg/flutter_fgbg.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:wakelock_plus/wakelock_plus.dart';

class BottomBarPage extends StatefulWidget {
  const BottomBarPage({super.key});

  @override
  State<BottomBarPage> createState() => _BottomBarPageState();
}

class _BottomBarPageState extends State<BottomBarPage> with WidgetsBindingObserver {
  final pages = [const RewardZonePage(), const StoreNewPage(), const WalletPage(), const SettingPage(), const NewHome()];

  final HomeCtrl homeCtrl = Get.find();
  late StreamSubscription<FGBGType> subscription;
  final rewardCooldownCtrl = Get.put(RewardCooldownController());

  @override
  void initState() {
    super.initState();
    loadVersion();
    ConnectionService.instance.listenForStatusChange(context);
    WidgetsBinding.instance.addObserver(this);
    loadActiveMiners();
    appInForGroundOrBackGround();
  }

  bool _wasInBackground = false;

  bool get _isAnyFullscreenAdShowing {
    return BGOpenAd.isShowingAd ||
        AppOpenAdManager.isShowingAd ||
        InterstitialAdManager().isShowingAd ||
        RewardedAdManager().isShowingAd ||
        RewardInterstitialAdManager().isShowingAd ||
        RewardedOnTapAdManager().isShowingAd;
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (_isAnyFullscreenAdShowing) {
      return;
    }

    if (state == AppLifecycleState.paused) {
      _wasInBackground = true;
      StartTimeService().saveMiningState();
    } else if (state == AppLifecycleState.resumed) {
      if (_wasInBackground) {
        _wasInBackground = false;
        StartTimeService().resumeMiningFromStorage();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;
        if ([1, 2].contains(AppConfig.bottomBarValue.value)) {
          AppConfig.bottomBarValue.value = 0;
        } else {
          Navigation.pushNamed(Routes.exitPage);
        }
      },
      child: Scaffold(
        backgroundColor: AppColor.background,
        body: ValueListenableBuilder(
          valueListenable: AppConfig.bottomBarValue,
          builder: (BuildContext context, int value, Widget? child) {
            return pages[value];
          },
        ),
        floatingActionButton: ValueListenableBuilder<int>(
          valueListenable: AppConfig.bottomBarValue,
          builder: (context, value, _) {
            return GestureDetector(
              onTap: () {
                AppConfig.bottomBarValue.value = 4;
                InterstitialAdManager().showInterstitialByCount();
              },
              child: Container(
                height: context.responsive.heightPercent(6),
                width: context.responsive.widthPercent(12),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(colors: [Color(0xffFF9800), Color(0xffF44336)]),
                  image: DecorationImage(
                    image: const AssetImage(AppAsset.hammer),
                    scale: 3.3,
                    colorFilter: ColorFilter.mode(AppColor.text, BlendMode.srcIn),
                  ),
                ),
              ),
            );
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: SafeArea(
          top: false,
          child: ValueListenableBuilder(
            valueListenable: AppConfig.bottomBarValue,
            builder: (BuildContext context, int bValue, _) {
              return ValueListenableBuilder<int>(
                valueListenable: AppConfig.bottomBarValue,
                builder: (context, bValue, _) {
                  return AnimatedBottomNavigationBar.builder(
                    itemCount: 4,
                    height: context.responsive.heightPercent(7.5),
                    activeIndex: bValue,
                    gapLocation: GapLocation.center,
                    notchSmoothness: NotchSmoothness.smoothEdge,
                    backgroundColor: AppColor.card,
                    leftCornerRadius: 24,
                    rightCornerRadius: 24,
                    borderColor: AppColor.warning,
                    borderWidth: 3,
                    splashColor: Colors.transparent,
                    splashRadius: 0,
                    tabBuilder: (index, isActive) {
                      final List<String> outlineIcons = [AppAsset.home, AppAsset.store, AppAsset.wallet, AppAsset.more];

                      final List<String> filledIcons = [AppAsset.homeS, AppAsset.storeS, AppAsset.walletS, AppAsset.moreS];
                      final bool showBadge = index == 0;

                      return Stack(
                        clipBehavior: Clip.none,
                        alignment: Alignment.center,
                        children: [
                          Image.asset(
                            isActive ? filledIcons[index] : outlineIcons[index],
                            height: 25,
                            width: 25,
                            color: isActive ? AppColor.text : AppColor.text.withAlpha(120),
                            fit: BoxFit.contain,
                          ),

                          if (showBadge)
                            Positioned(
                              top: context.responsive.heightPercent(1.5),
                              left: context.responsive.widthPercent(14),
                              child: Container(
                                height: 5,
                                width: 5,
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  shape: BoxShape.circle,
                                  boxShadow: [BoxShadow(color: Colors.red.withAlpha(50), blurRadius: 3, spreadRadius: 2)],
                                ),
                              ),
                            ),
                        ],
                      );
                    },

                    onTap: (index) {
                      AppConfig.bottomBarValue.value = index;
                      InterstitialAdManager().showInterstitialByCount();
                    },
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }

  @override
  Future<void> dispose() async {
    super.dispose();
    ConnectionService.instance.cancelConnectionListener();
    WidgetsBinding.instance.removeObserver(this);
    await WakelockPlus.disable();
  }

  void loadVersion() async {
    final packageInfo = await PackageInfo.fromPlatform();
    AppConfig.appVersion = packageInfo.version;
    AppConfig.appName = packageInfo.appName;
    DailyRewardServiceTwo().init();
    homeCtrl.getSubDetails();
    await WakelockPlus.enable();
  }

  Future<void> loadActiveMiners() async {
    try {
      final userSubs = homeCtrl.userActiveSubList;
      double totalPower = 0.0;
      if (userSubs.isNotEmpty) {
        for (var miner in userSubs) {
          totalPower += parseMiningPowerToGh("${miner.power} ${miner.powerType}");
        }
        homeCtrl.activeHashRate.value += totalPower;
      }
    } catch (e) {
      debugPrint('$e');
    }
  }

  void appInForGroundOrBackGround() {
    subscription = FGBGEvents.instance.stream.listen((event) {
      if (event == FGBGType.background) {
        if (_isAnyFullscreenAdShowing) {
          return;
        }
        unawaited(BGOpenAd().loadAd().then((loaded) {}).catchError((Object error) {}));
      }

      if (event == FGBGType.foreground) {
        if (!mounted || _isAnyFullscreenAdShowing) {
          return;
        }

        if (!BGOpenAd().isAdAvailable) {
          return;
        }

        unawaited(BGOpenAd().showAdIfAvailable());
      }
    });

    unawaited(BGOpenAd().loadAd());
  }
}
