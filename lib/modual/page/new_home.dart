import 'package:animated_flip_counter/animated_flip_counter.dart';
import 'package:cloud_mining_farm/ad_modual/banner/large_banner.dart';
import 'package:cloud_mining_farm/ad_modual/int_man/Interstitial.dart';
import 'package:cloud_mining_farm/ad_modual/int_man/int_rwd_admanger.dart';
import 'package:cloud_mining_farm/ad_modual/native/small_native.dart';
import 'package:cloud_mining_farm/modual/ctrl/home_ctrl.dart';
import 'package:cloud_mining_farm/modual/model/active_bot_model.dart';
import 'package:cloud_mining_farm/modual/repository/daily_reward_2.dart';
import 'package:cloud_mining_farm/modual/repository/start_time_rp.dart';
import 'package:cloud_mining_farm/modual/repository/time_boost_ser.dart';
import 'package:cloud_mining_farm/theme/asset.dart';
import 'package:cloud_mining_farm/theme/colors.dart';
import 'package:cloud_mining_farm/theme/config.dart';
import 'package:cloud_mining_farm/theme/textstyles.dart';
import 'package:cloud_mining_farm/utils/app_navigation/app_navigation.dart';
import 'package:cloud_mining_farm/utils/app_navigation/navigation.dart';
import 'package:cloud_mining_farm/utils/hive_service.dart';
import 'package:cloud_mining_farm/utils/responsiv.dart';
import 'package:cloud_mining_farm/utils/utils.dart';
import 'package:cloud_mining_farm/widget/app_text.dart';
import 'package:cloud_mining_farm/widget/blinking_dot.dart';
import 'package:cloud_mining_farm/widget/timerfill_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:velocity_x/velocity_x.dart';

class NewHome extends StatefulWidget {
  const NewHome({super.key});

  @override
  State<NewHome> createState() => _NewHomeState();
}

class _NewHomeState extends State<NewHome> {
  final HomeCtrl homeCtrl = Get.find();
  String? userImage = "";
  String? userName = "";

  @override
  void initState() {
    super.initState();
    userImage = HiveService().getData<String>(AppConfig.userImage);
    userName = HiveService().getData<String>(AppConfig.userName);
    homeCtrl.getActiveBooster();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      appBar: buildCustomAppBar(context, showFullAppBar: false),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            15.heightBox,
            Row(
              children: [
                Text(
                  "Hi, $userName",
                  style: textPoppins(context, fontSize: 15, color: AppColor.text, fontWeight: FontWeight.w600),
                ),
                Spacer(),
                GestureDetector(
                  onTap: () {
                    InterstitialAdManager().showInterstitialByCount();
                    Navigation.pushNamed(Routes.faqPage);
                  },
                  child: Container(
                    height: 31,
                    width: 31,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(shape: BoxShape.circle, color: AppColor.text),
                    child: FaIcon(FontAwesomeIcons.question, size: 18, color: AppColor.background),
                  ),
                ),
                7.widthBox,
                GestureDetector(
                  onTap: () {
                    InterstitialAdManager().showInterstitialByCount();
                    Navigation.pushNamed(Routes.profilePage);
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: userImage?.isNotEmpty ?? false
                        ? Image.network(HiveService().getData<String>(AppConfig.userImage) ?? "", scale: 3)
                        : FaIcon(FontAwesomeIcons.solidCircleUser, size: 32, color: AppColor.text),
                  ),
                ),
              ],
            ).px(18),
            15.heightBox,
            HorizontalPadding(
              child: CardContainer(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                      child: Row(
                        children: [
                          Image.asset(AppAsset.btcLogo, scale: 4.5),
                          10.widthBox,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("hcb".tr, style: textMontserrat(context, height: 1, fontWeight: FontWeight.w600)),
                              Obx(() {
                                return AnimatedFlipCounter(
                                  value: homeCtrl.miningBtcValue.value,
                                  fractionDigits: 12,
                                  duration: Duration(seconds: 5),
                                  curve: Curves.easeOut,
                                  textStyle: textMontserrat(context, fontSize: 20, fontWeight: FontWeight.w600),
                                );
                              }),
                            ],
                          ),
                          Spacer(),
                          ValueListenableBuilder(
                            valueListenable: HiveService().getListenable(keys: [AppConfig.lockMinedBTC]),
                            builder: (context, Box box, _) {
                              bool isLocked = box.get(AppConfig.lockMinedBTC, defaultValue: false);

                              return GestureDetector(
                                onTap: () {
                                  InterstitialAdManager().showInterstitialByCount();
                                  if (isLocked) {
                                    Navigation.pushNamed(Routes.unlockPage);
                                  } else {
                                    Navigation.pushNamed(Routes.lockPage);
                                  }
                                },
                                child: Image.asset(isLocked ? AppAsset.lock : AppAsset.unLock, scale: 22, color: AppColor.text),
                              );
                            },
                          ),
                          /*       GestureDetector(
                            onTap: () {
                              InterstitialAdManager().showInterstitialByCount();
                              if (HiveService().getData<bool>(AppConfig.lockMinedBTC) == true) {
                                Navigation.pushNamed(Routes.unlockPage);
                              } else {
                                Navigation.pushNamed(Routes.lockPage);
                              }
                            },
                            child: HiveService().getData<bool>(AppConfig.lockMinedBTC) == true
                                ? Image.asset(AppAsset.lock, scale: 22, color: AppColor.text)
                                : Image.asset(AppAsset.unLock, scale: 22, color: AppColor.text),
                          ),*/
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SmallNative(
              padding: const EdgeInsets.symmetric(vertical: 15),
              sPadding: const EdgeInsets.symmetric(vertical: 7.5),
            ).px(15),
            HorizontalPadding(
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        InterstitialAdManager().showInterstitialByCount();
                        Navigation.pushNamed(Routes.superCoinPage);
                      },
                      child: CardContainer(
                        child: Column(
                          children: [
                            Text('hsc'.tr, style: subTextRoboto(context)),
                            Text(
                              HiveService().getData<String>(AppConfig.superCoin) != null
                                  ? "${HiveService().getData<String>(AppConfig.superCoin)}"
                                  : "0.00",
                              style: textMontserrat(context, fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  12.widthBox,

                  Expanded(
                    child: CardContainer(
                      child: Column(
                        children: [
                          Text('hms'.tr, style: subTextRoboto(context)),
                          Obx(
                            () => Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                AnimatedFlipCounter(
                                  duration: const Duration(seconds: 1),
                                  fractionDigits: 2,
                                  value: getMiningPowerValue(homeCtrl.activeHashRate.value),
                                  textStyle: textMontserrat(context, fontSize: 16, fontWeight: FontWeight.bold),
                                ),
                                4.widthBox,
                                Text(
                                  getMiningPowerUnit(homeCtrl.activeHashRate.value),
                                  style: subTextRoboto(context, fontSize: 14),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            15.heightBox,
            HorizontalPadding(
              child: CardContainer(
                child: Column(
                  children: [
                    SizedBox(
                      height: context.responsive.heightPercent(21),
                      child: Stack(
                        children: [
                          Center(
                            child: Obx(() {
                              final timer = StartTimeService();

                              final total = AppConfig.mingTimer;
                              final remaining = timer.startTimeLeft.value.inSeconds;

                              double calProgress = 0.0;
                              if (timer.isRunning && total > 0) {
                                calProgress = 1 - (remaining / total);
                              }

                              final progress = calProgress < 0.09 ? 0.09 : calProgress;

                              return LiquidMiningButton(
                                timer: timer,
                                progress: progress,
                                text: timer.isRunning ? timer.formatDuration(timer.startTimeLeft.value) : 'hsb'.tr,
                                onTap: () {
                                  showStartMingDialog(
                                    context,
                                    subText: 'hsmt'.trParams({
                                      "ch":
                                          "${getMiningPowerValue(homeCtrl.activeHashRate.value)} ${getMiningPowerUnit(homeCtrl.activeHashRate.value)}",
                                    }),
                                    image: AppAsset.timer,
                                    onWatchAd: () {
                                      handleMiningTap(timer);
                                    },
                                  );
                                },
                              );
                            }),
                          ),

                          Positioned(
                            left: 1,
                            top: 0,
                            child: GestureDetector(
                              onTap: () {
                                if (StartTimeService().isRunning) {
                                  final service = TimeBoostUsageService();
                                  showWatchAdDialog(
                                    context,
                                    text: 'htdht'.tr,
                                    subText: "htdhst".trParams({"time": "${AppConfig.appDataSet?.timeBoost}"}),
                                    muteText: "htdhat".trParams({"attempt": "${service.remainingUses}"}),
                                    image: AppAsset.timer,
                                    onWatchAd: () {
                                      timeBoost(service);
                                    },
                                  );
                                } else {
                                  showSnackBar(
                                    context,
                                    text: "Action Required",
                                    massage: "Mining is not active. Start mining to increase time.",
                                  );
                                }
                              },

                              child: Container(
                                height: 50,
                                width: 50,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(color: AppColor.background, shape: BoxShape.circle),
                                child: FaIcon(FontAwesomeIcons.solidHourglassHalf, color: AppColor.white, size: 25),
                              ),
                            ),
                          ),
                          Positioned(
                            right: 1,
                            top: 0,
                            child: Obx(() {
                              final serviceTwo = DailyRewardServiceTwo();
                              final isEligible = serviceTwo.isEligibleTwo.value;
                              return GestureDetector(
                                onTap: isEligible
                                    ? () {
                                        showWatchAdDialog(
                                          context,
                                          text: 'hbdht'.tr,
                                          subText: "hbdhst".trParams({
                                            "power": "${AppConfig.appDataSet?.dailyRewardHashRateTwo.toString()} Gh/s",
                                          }),
                                          image: AppAsset.boost,
                                          onWatchAd: () => handleBoostTapTwo(serviceTwo),
                                        );
                                      }
                                    : () {
                                        showLimitDialog(context, text: "wadlt".tr, image: AppAsset.boost);
                                      },
                                child: Container(
                                  height: 50,
                                  width: 50,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(color: AppColor.background, shape: BoxShape.circle),
                                  child: FaIcon(FontAwesomeIcons.rocket, color: AppColor.white, size: 25),
                                ),
                              );
                            }),
                          ),

                          Positioned(bottom: 0, left: 0, child: Text('ham'.tr, style: subTextRoboto(context))),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: Row(
                              children: [
                                BlinkingGreenDot(),
                                5.widthBox,
                                Obx(
                                  () => AnimatedFlipCounter(
                                    duration: const Duration(seconds: 1),
                                    value: homeCtrl.activeMiners.value,
                                    textStyle: textMontserrat(context, fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Obx(() {
              return homeCtrl.activeBoosterList.isEmpty
                  ? SizedBox.shrink()
                  : HorizontalPadding(
                      child: CardContainer(
                        isPaddingZero: true,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('hab'.tr, style: textRoboto(context, fontWeight: FontWeight.bold)),
                            7.heightBox,
                            Divider(color: AppColor.divider, height: 0),
                            10.heightBox,
                            ListView.separated(
                              shrinkWrap: true,
                              itemCount: homeCtrl.activeBoosterList.length,
                              itemBuilder: (context, index) {
                                final data = homeCtrl.activeBoosterList[index];
                                return Row(
                                  children: [
                                    Image.asset(AppAsset.ads, scale: 7),
                                    10.widthBox,
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(data.botType, style: textRoboto(context, fontSize: 13, color: AppColor.subText)),
                                        Text(
                                          "${data.power} ${data.powerType}",
                                          style: textMontserrat(
                                            context,
                                            fontSize: 13,
                                            color: AppColor.subText,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Spacer(),
                                    StreamBuilder<Duration>(
                                      stream: Stream.periodic(const Duration(seconds: 1), (_) {
                                        return homeCtrl.remainingTime(data);
                                      }),
                                      builder: (context, snapshot) {
                                        final remaining = snapshot.data ?? Duration.zero;
                                        return Text(
                                          formatDuration(remaining),
                                          style: textMontserrat(context, fontSize: 15, fontWeight: FontWeight.w600),
                                        );
                                      },
                                    ),
                                  ],
                                );
                              },
                              separatorBuilder: (BuildContext context, int index) {
                                return 7.heightBox;
                              },
                            ),
                          ],
                        ).pOnly(bottom: 10, top: 7).px(10),
                      ).pOnly(top: 15),
                    );
            }),
            15.heightBox,
            HorizontalPadding(
              child: SizedBox(
                height: context.responsive.heightPercent(11.5),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  physics: BouncingScrollPhysics(),
                  children: [
                    GestureDetector(
                      onTap: () {
                        if (StartTimeService().isRunning) {
                          final service = TimeBoostUsageService();
                          showWatchAdDialog(
                            context,
                            text: 'htdht'.tr,
                            subText: "htdhst".trParams({"time": formatTime(AppConfig.appDataSet?.timeBoost ?? 600)}),
                            muteText: "htdhat".trParams({"attempt": "${service.remainingUses}"}),
                            image: AppAsset.timer,
                            onWatchAd: () {
                              timeBoost(service);
                            },
                          );
                        } else {
                          showSnackBar(context, text: "htbar".tr, massage: "htbarst".tr);
                        }
                      },
                      child: Container(
                        width: context.responsive.widthPercent(65),
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: AppColor.card),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 42,
                              width: 42,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(color: AppColor.background, shape: BoxShape.circle),
                              child: FaIcon(FontAwesomeIcons.solidHourglassHalf, color: AppColor.text, size: 20),
                            ),
                            10.widthBox,
                            Flexible(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'hdr'.tr,
                                    maxLines: 1,
                                    textAlign: TextAlign.start,
                                    overflow: TextOverflow.ellipsis,
                                    style: textPoppins(context),
                                  ),
                                  Text(
                                    'hdrst'.trParams({"inTime": formatTime(AppConfig.appDataSet?.timeBoost ?? 600)}),
                                    style: subTextPoppins(context, fontSize: 12),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ).px(12).py(10),
                      ),
                    ),
                    12.widthBox,
                    Obx(() {
                      final serviceTwo = DailyRewardServiceTwo();
                      final isEligible = serviceTwo.isEligibleTwo.value;
                      return GestureDetector(
                        onTap: isEligible
                            ? () {
                                showWatchAdDialog(
                                  context,
                                  text: 'hbdht'.tr,
                                  subText: "hbdhst".trParams({
                                    "power": "${AppConfig.appDataSet?.dailyRewardHashRateTwo.toString()} Gh/s",
                                  }),
                                  image: AppAsset.boost,
                                  onWatchAd: () => handleBoostTapTwo(serviceTwo),
                                );
                              }
                            : () {
                                showLimitDialog(context, text: "wadlt".tr, image: AppAsset.boost);
                              },
                        child: Container(
                          width: context.responsive.widthPercent(65),
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: AppColor.card),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 42,
                                width: 42,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(color: AppColor.background, shape: BoxShape.circle),
                                child: FaIcon(FontAwesomeIcons.rocket, color: AppColor.text, size: 20),
                              ),
                              10.widthBox,
                              Flexible(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'hdqr'.tr,
                                      maxLines: 1,
                                      textAlign: TextAlign.start,
                                      overflow: TextOverflow.ellipsis,
                                      style: textPoppins(context),
                                    ),
                                    Text(
                                      'hdqrst'.trParams({
                                        "spBooster": "${AppConfig.appDataSet?.dailyRewardHashRateTwo.toString()} Gh/s",
                                      }),
                                      style: subTextPoppins(context, fontSize: 12),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ).px(12).py(10),
                        ),
                      );
                    }),
                  ],
                ),
              ),
            ),
            Obx(
              () => homeCtrl.isPurchase.value
                  ? Column(
                      children: [
                        15.heightBox,
                        HorizontalPadding(
                          child: CardContainer(
                            child: Obx(
                              () => Row(
                                children: [
                                  Image.asset(AppAsset.heat, scale: 8),
                                  15.widthBox,
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            homeCtrl.randomPlan.value.power.toString(),
                                            style: textPoppins(
                                              context,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 20,
                                            ).copyWith(height: 1),
                                          ),
                                          3.widthBox,
                                          Text(
                                            homeCtrl.randomPlan.value.powerType.toString(),
                                            style: subTextRoboto(
                                              context,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 15,
                                            ).copyWith(height: 1),
                                          ),
                                        ],
                                      ),
                                      2.heightBox,
                                      Row(
                                        children: [
                                          Text('smb'.tr, style: subTextRoboto(context, fontSize: 13).copyWith(height: 1)),
                                          3.widthBox,
                                          Text(
                                            homeCtrl.randomPlan.value.miningBoost.toString(),
                                            style: subTextRoboto(
                                              context,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 13,
                                            ).copyWith(height: 1),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Spacer(),
                                  SizedBox(
                                    width: 110,
                                    child: AppButtonSmall(
                                      padding: EdgeInsets.symmetric(vertical: 5),
                                      onTap: () {
                                        InterstitialAdManager().showInterstitialByCount();
                                        homeCtrl.planDetails.value = homeCtrl.randomPlan.value;
                                        homeCtrl.planDetailsList.value = homeCtrl.randomPlan.value.plans ?? [];
                                        Navigation.pushNamed(Routes.subscribePage);
                                      },
                                      color: AppColor.primaryButton,
                                      textColor: AppColor.secondaryText,
                                      text: 'hpub'.tr,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  : SizedBox.shrink(),
            ),
            20.heightBox,
            LargeBannerS(),
            60.heightBox,
          ],
        ),
      ),
    );
  }

  Future<void> handleMiningTap(StartTimeService timer) async {
    if (timer.isRunning) return;
    EasyLoading.show(status: 'Loading ad...');
    await Future.delayed(Duration(seconds: 1));
    IntOrRwdAdManger().showIntORRwdAdOnStart(onReward: () {}, onAdClosed: () {});
    timer.start(seconds: AppConfig.mingTimer);
    EasyLoading.dismiss();
  }

  Future<void> handleBoostTapTwo(DailyRewardServiceTwo service) async {
    EasyLoading.show(status: 'Loading ad...');

    await Future.delayed(Duration(seconds: 1));

    IntOrRwdAdManger().showIntORRwdAdOnGift(
      onReward: () async {
        service.collectReward();

        try {
          final activeMiner = ActiveBotModel(
            productID: '',
            botType: 'Daily Reward',
            type: 'free',
            power: AppConfig.appDataSet?.dailyRewardHashRateTwo.toString() ?? "",
            powerType: 'GH/s',
            durationType: 'fixed',
            durationSeconds: AppConfig.appDataSet?.dailyRewardTimeTwo ?? 300,
            addTime: DateTime.now().millisecondsSinceEpoch,
            expireTime: AppConfig.appDataSet?.dailyRewardTimeTwo ?? 300,
          );

          await HiveService().addToBox(activeMiner, boxName: 'cmf_activeBot_box').whenComplete(() {
            homeCtrl.getActiveBooster();
          });
        } catch (e) {
          debugPrint('$e');
        }
      },
      onAdClosed: () {},
    );

    EasyLoading.dismiss();
  }

  Future<void> timeBoost(TimeBoostUsageService service) async {
    EasyLoading.show(status: 'Loading ad...');

    await Future.delayed(Duration(seconds: 1));

    IntOrRwdAdManger().showIntORRwdAdOnGift(
      onReward: () async {
        if (service.canUseBoost) {
          StartTimeService().startTimeLeft.value += Duration(seconds: AppConfig.appDataSet?.timeBoost ?? 600);
          service.useBoost();
        }
      },
      onAdClosed: () {},
    );

    EasyLoading.dismiss();
  }

  minerInfo(BuildContext context, {final String? text, final String? image, required final Widget subChild}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text ?? '', style: subTextRoboto(context)),
        subChild,
      ],
    );
  }
}
