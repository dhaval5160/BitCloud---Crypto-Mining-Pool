/*
import 'package:animated_flip_counter/animated_flip_counter.dart';
import 'package:cloud_mining_farm/ad_modual/int_man/Interstitial.dart';
import 'package:cloud_mining_farm/ad_modual/banner.dart';
import 'package:cloud_mining_farm/ad_modual/int_rwd_admanger.dart';
import 'package:cloud_mining_farm/ad_modual/large_banner.dart';
import 'package:cloud_mining_farm/modual/ctrl/home_ctrl.dart';
import 'package:cloud_mining_farm/modual/model/active_bot_model.dart';
import 'package:cloud_mining_farm/modual/repository/daily_reward_2.dart';
import 'package:cloud_mining_farm/modual/repository/daily_reward_rp.dart';
import 'package:cloud_mining_farm/modual/repository/start_time_rp.dart';
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
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:velocity_x/velocity_x.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
            HorizontalPadding(
              child: CardContainer(
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: userImage?.isNotEmpty ?? false
                          ? Image.network(
                              HiveService().getData<String>(AppConfig.userImage) ?? "",
                              scale: 3,
                            )
                          : Icon(FontAwesomeIcons.solidCircleUser, size: 32),
                    ),
                    10.widthBox,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Hi, $userName", style: textPoppins(context, fontSize: 12)),
                        Text(
                          'ID : ${AppConfig.userProfileId}',
                          style: textPoppins(context, fontSize: 13),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            VerticalPadding(child: LargeBanner()),
            HorizontalPadding(
              child: CardContainer(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(AppAsset.btcLogo, scale: 7),
                          15.widthBox,
                          Obx(() {
                            return AnimatedFlipCounter(
                              value: homeCtrl.miningBtcValue.value,
                              fractionDigits: 12,
                              duration: Duration(seconds: 5),
                              curve: Curves.easeOut,
                              textStyle: textMontserrat(
                                context,
                                fontSize: 22,
                                fontWeight: FontWeight.w600,
                              ),
                            );
                          }),
                          15.widthBox,

                          ValueListenableBuilder<bool>(
                            valueListenable: HiveService.lockNotifier,
                            builder: (context, isLocked, _) {
                              return GestureDetector(
                                onTap: () {
                                  InterstitialAdManager().showInterstitialByCount();
                                  Navigation.pushNamed(
                                    isLocked ? Routes.unlockPage : Routes.lockPage,
                                  );
                                },
                                child: Image.asset(
                                  isLocked ? AppAsset.lock : AppAsset.unLock,
                                  scale: 22,
                                  color: AppColor.text,
                                ),
                              );
                            },
                          ),

            */
/*              GestureDetector(
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
                          ),*//*

                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            15.heightBox,
            HorizontalPadding(
              child: CardContainer(
                child: SizedBox(
                  height: context.responsive.heightPercent(20),
                  child: Stack(
                    children: [
                      Center(
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Obx(() {
                              final sessionTimer = StartTimeService();
                              return GestureDetector(
                                onTap: () => handleMiningTap(sessionTimer),
                                child: Container(
                                  height: context.responsive.heightPercent(13),
                                  width: context.responsive.heightPercent(13),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: AppColor.background,
                                    shape: BoxShape.circle,
                                    border: Border.all(color: AppColor.primaryButton),
                                    boxShadow: [
                                      BoxShadow(
                                        color: const Color(0xffFF9F1C).withAlpha(30),
                                        blurRadius: 9,
                                        spreadRadius: 18,
                                      ),
                                    ],
                                  ),
                                  child: Text(
                                    sessionTimer.isRunning
                                        ? sessionTimer.formatDuration(
                                            sessionTimer.startTimeLeft.value,
                                          )
                                        : 'hsb'.tr,
                                    style: textMontserrat(
                                      context,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                      color: AppColor.text,
                                    ),
                                  ),
                                ),
                              );
                            }),
                            IgnorePointer(
                              child: Lottie.asset(
                                "asset/lottie/start.json",
                                height: context.responsive.heightPercent(20),
                                controller: homeCtrl.lottieController,
                              ),
                            ),
                          ],
                        ),
                      ),

                      Positioned(
                        left: 0,
                        bottom: 0,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('hms'.tr, style: subTextRoboto(context)),
                            Obx(
                              () => Row(
                                children: [
                                  AnimatedFlipCounter(
                                    duration: const Duration(seconds: 1),
                                    fractionDigits: 2,
                                    value: getMiningPowerValue(homeCtrl.activeHashRate.value),
                                    textStyle: textMontserrat(
                                      context,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
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

                      Positioned(
                        right: 0,
                        bottom: 0,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text('ham'.tr, style: subTextRoboto(context)),
                            Obx(
                              () => AnimatedFlipCounter(
                                duration: const Duration(seconds: 1),
                                value: homeCtrl.activeMiners.value,
                                textStyle: textMontserrat(context),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
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
                                        Text(
                                          data.botType,
                                          style: textRoboto(
                                            context,
                                            fontSize: 13,
                                            color: AppColor.subText,
                                          ),
                                        ),
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
                                          style: textMontserrat(
                                            context,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600,
                                          ),
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
              child: Row(
                children: [
                  Expanded(
                    child: CardContainer(
                      isPaddingZero: true,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'hdr'.tr,
                            maxLines: 1,
                            textAlign: TextAlign.start,
                            overflow: TextOverflow.ellipsis,
                            style: textPoppins(context),
                          ).px(12),
                          10.heightBox,
                          Divider(color: AppColor.divider, height: 0),
                          7.heightBox,
                          Row(
                            children: [
                              Image.asset(AppAsset.gift, scale: 28),
                              10.widthBox,
                              RichText(
                                text: TextSpan(
                                  text: AppConfig.drHashRate.toString(),
                                  style: textPoppins(context, fontSize: 18),
                                  children: [
                                    TextSpan(text: ' Gh/s', style: subTextRoboto(context)),
                                  ],
                                ),
                              ),
                            ],
                          ).px(12),
                          10.heightBox,
                          Obx(() {
                            final service = DailyRewardService();
                            final isEligible = service.isEligible.value;
                            final rewardTime = service.rewardTimeLeft.value;
                            return GestureDetector(
                              onTap: isEligible
                                  ? () {
                                      */
/*              showWatchAdDialog(
                                        context,
                                        text: '${AppConfig.drHashRate.toString()} Gh/s',
                                        time: AppConfig.drAdTime,
                                        onWatchAd: () => handleBoostTap(service),
                                      );*//*

                                    }
                                  : () {},
                              child: Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: isEligible
                                        ? Color(0xFF2563EB)
                                        : Color(0xFF2563EB).withAlpha(100),
                                    width: 1.5,
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(vertical: 4),
                                  child: Text(
                                    rewardTime != Duration.zero
                                        ? service.formatDuration(rewardTime)
                                        : 'hadr'.tr,
                                    style: textRoboto(
                                      context,
                                      color: isEligible
                                          ? Color(0xFFEAF2FF)
                                          : Color(0xFFEAF2FF).withAlpha(150),
                                    ),
                                  ),
                                ),
                              ).px(12),
                            );
                          }),
                        ],
                      ).pOnly(top: 7, bottom: 10),
                    ),
                  ),
                  12.widthBox,
                  Expanded(
                    child: CardContainer(
                      isPaddingZero: true,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'hdqr'.tr,
                            maxLines: 1,
                            textAlign: TextAlign.start,
                            overflow: TextOverflow.ellipsis,
                            style: textPoppins(context),
                          ).px(10),
                          7.heightBox,
                          Divider(color: AppColor.divider, height: 0),
                          7.heightBox,
                          Row(
                            children: [
                              Image.asset(AppAsset.gift, scale: 28),
                              10.widthBox,
                              RichText(
                                text: TextSpan(
                                  text: AppConfig.drHashRateTwo.toString(),
                                  style: textPoppins(context, fontSize: 18),
                                  children: [
                                    TextSpan(text: ' Gh/s', style: subTextRoboto(context)),
                                  ],
                                ),
                              ),
                            ],
                          ).px(10),
                          10.heightBox,
                          */
/*        Obx(() {
                            final serviceTwo = DailyRewardServiceTwo();
                            final isEligible = serviceTwo.isEligibleTwo.value;
                            final rewardTime = serviceTwo.rewardTimeLeftTwo.value;

                            return AppButtonSmall(
                              padding: EdgeInsets.symmetric(vertical: 4),
                              onTap: isEligible
                                  ? () {
                                      showWatchAdDialog(
                                        context,
                                        text: '${AppConfig.drHashRateTwo.toString()} Gh/s',
                                        time: AppConfig.drAdTimeTwo,
                                        onWatchAd: () => handleBoostTapTwo(serviceTwo),
                                      );
                                    }
                                  : () {},
                              color: isEligible
                                  ? AppColor.secondaryButton
                                  : AppColor.secondaryButton.withAlpha(100),
                              text: rewardTime != Duration.zero
                                  ? serviceTwo.formatDuration(rewardTime)
                                  : 'hadr'.tr,
                              textColor: isEligible ? AppColor.white : Colors.white54,
                            );
                          }),*//*

                          Obx(() {
                            final serviceTwo = DailyRewardServiceTwo();
                            final isEligible = serviceTwo.isEligibleTwo.value;
                            final rewardTime = serviceTwo.rewardTimeLeftTwo.value;
                            return GestureDetector(
                              onTap: isEligible
                                  ? () {
                                      */
/*            showWatchAdDialog(
                                        context,
                                        text: '${AppConfig.drHashRateTwo.toString()} Gh/s',
                                        time: AppConfig.drAdTimeTwo,
                                        onWatchAd: () => handleBoostTapTwo(serviceTwo),
                                      );*//*

                                    }
                                  : () {},
                              child: Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: isEligible
                                        ? Color(0xFF2563EB)
                                        : Color(0xFF2563EB).withAlpha(100),
                                    width: 1.5,
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(vertical: 4),
                                  child: Text(
                                    rewardTime != Duration.zero
                                        ? serviceTwo.formatDuration(rewardTime)
                                        : 'hadr'.tr,
                                    style: textRoboto(
                                      context,
                                      color: isEligible
                                          ? Color(0xFFEAF2FF)
                                          : Color(0xFFEAF2FF).withAlpha(150),
                                    ),
                                  ),
                                ),
                              ).px(12),
                            );
                          }),
                        ],
                      ).pOnly(top: 5, bottom: 8),
                    ),
                  ),
                ],
              ),
            ),
            Obx(
              () => !homeCtrl.isPurchase.value
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
                                          Text(
                                            'smb'.tr,
                                            style: subTextRoboto(
                                              context,
                                              fontSize: 13,
                                            ).copyWith(height: 1),
                                          ),
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
                                        homeCtrl.planDetails.value = homeCtrl.randomPlan.value;
                                        homeCtrl.planDetailsList.value =
                                            homeCtrl.randomPlan.value.plans ?? [];
                                        InterstitialAdManager().showInterstitialByCount();
                                        Navigation.pushNamed(Routes.subscribePage);
                                      },
                                      color: AppColor.secondaryButton,
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
            15.heightBox,
            HorizontalPadding(
              child: ExpansionTile(
                backgroundColor: AppColor.card,
                collapsedBackgroundColor: AppColor.card,
                iconColor: AppColor.white,
                collapsedIconColor: AppColor.white,
                dense: true,
                minTileHeight: 30,
                tilePadding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                expansionAnimationStyle: AnimationStyle(
                  duration: const Duration(milliseconds: 800),
                  curve: Curves.easeInOut,
                ),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                collapsedShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                childrenPadding: EdgeInsets.only(left: 10, right: 10, bottom: 15, top: 0),
                title: Row(
                  children: [
                    Image.asset(AppAsset.question, scale: 25),
                    10.widthBox,
                    Text(
                      'FAQs',
                      style: textMontserrat(context, fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                children: [
                  ListView.separated(
                    padding: EdgeInsets.zero,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: faqList.length,
                    itemBuilder: (context, index) {
                      final data = faqList[index];
                      return ExpansionTile(
                        backgroundColor: AppColor.card,
                        collapsedBackgroundColor: AppColor.card,
                        iconColor: AppColor.text,
                        collapsedIconColor: AppColor.text,
                        expansionAnimationStyle: AnimationStyle(
                          duration: const Duration(milliseconds: 800),
                          curve: Curves.easeInOut,
                        ),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                        collapsedShape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        childrenPadding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                        title: Text(
                          data['qus'].toString(),
                          style: textRoboto(context, fontSize: 15),
                        ),
                        children: [
                          Text(
                            data['ans'].toString(),
                            style: subTextPoppins(context, fontSize: 13),
                          ),
                        ],
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(height: 12);
                    },
                  ),
                ],
              ),
            ),
            20.heightBox,
          ],
        ),
      ),
      bottomNavigationBar: ShowBanner(),
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

  Future<void> handleBoostTap(DailyRewardService service) async {
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
            power: AppConfig.drHashRate.toString(),
            powerType: 'GH/s',
            durationType: 'fixed',
            durationSeconds: AppConfig.drAdTime,
            addTime: DateTime.now().millisecondsSinceEpoch,
            expireTime: AppConfig.drAdTime,
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
            power: AppConfig.drHashRateTwo.toString(),
            powerType: 'GH/s',
            durationType: 'fixed',
            durationSeconds: AppConfig.drAdTimeTwo,
            addTime: DateTime.now().millisecondsSinceEpoch,
            expireTime: AppConfig.drAdTimeTwo,
          );

          await HiveService().addToBox(activeMiner, boxName: 'cmf_activeBot_box').whenComplete(() {
            homeCtrl.getActiveBooster();
          });
        } catch (e) {
          debugPrint('$e');
        }

        final double minutes = AppConfig.drAdTimeTwo / 60;
        final adTime = minutes % 1 == 0 ? minutes.toStringAsFixed(0) : minutes.toStringAsFixed(2);

        EasyLoading.showToast(
          "Daily Reward Unlocked! 🎁 ${AppConfig.drHashRateTwo} GH/s mining power boost for $adTime minutes!",
        );
      },
      onAdClosed: () {},
    );

    EasyLoading.dismiss();
  }

  minerInfo(
    BuildContext context, {
    final String? text,
    final String? image,
    required final Widget subChild,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text ?? '', style: subTextRoboto(context)),
        subChild,
      ],
    );
  }
}
*/
