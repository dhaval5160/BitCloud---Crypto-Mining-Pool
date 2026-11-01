/*
import 'package:cloud_mining_farm/ad_modual/int_man/Interstitial.dart';
import 'package:cloud_mining_farm/ad_modual/banner.dart';
import 'package:cloud_mining_farm/ad_modual/int_rwd_admanger.dart';
import 'package:cloud_mining_farm/modual/ctrl/home_ctrl.dart';
import 'package:cloud_mining_farm/modual/model/active_bot_model.dart';
import 'package:cloud_mining_farm/modual/repository/adreward_time_rp.dart';
import 'package:cloud_mining_farm/theme/asset.dart';
import 'package:cloud_mining_farm/theme/colors.dart';
import 'package:cloud_mining_farm/theme/textstyles.dart';
import 'package:cloud_mining_farm/utils/app_navigation/app_navigation.dart';
import 'package:cloud_mining_farm/utils/app_navigation/navigation.dart';
import 'package:cloud_mining_farm/utils/hive_service.dart';
import 'package:cloud_mining_farm/utils/utils.dart';
import 'package:cloud_mining_farm/widget/app_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class StorePage extends StatefulWidget {
  const StorePage({super.key});

  @override
  State<StorePage> createState() => _StorePageState();
}

class _StorePageState extends State<StorePage> {
  final HomeCtrl homeCtrl = Get.find();
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    setData();
  }

  setData() {
    homeCtrl.selectedPlanIndex.value = 0;
    homeCtrl.planName.value = homeCtrl.subscriptionPlanList[0].planName.toString();
    homeCtrl.planDetailsList.value = homeCtrl.subscriptionPlanList[0].plans ?? [];
    homeCtrl.planAdsTime.value = homeCtrl.subscriptionPlanList[0].adTime ?? 0;
    homeCtrl.isPlanAds.value = homeCtrl.subscriptionPlanList[0].planads ?? false;
    homeCtrl.planDetails.value = homeCtrl.subscriptionPlanList[0];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      appBar: buildCustomAppBar(context, showFullAppBar: false),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          15.heightBox,
          HorizontalPadding(
            child: CardContainer(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('sh'.tr, style: textPoppins(context)),
                      2.heightBox,
                      Obx(
                        () => Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              getMiningPowerValue(homeCtrl.activeHashRate.value).toStringAsFixed(2),
                              style: textRoboto(context, fontSize: 15),
                            ),
                            Text(
                              getMiningPowerUnit(homeCtrl.activeHashRate.value),
                              style: subTextRoboto(context, fontSize: 13),
                            ),
                            Text(
                              ' + ${homeCtrl.planDetails.value.power} ',
                              style: textRoboto(context, fontSize: 15),
                            ),
                            Text(
                              homeCtrl.planDetails.value.powerType.toString(),
                              style: subTextRoboto(context, fontSize: 13),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      InterstitialAdManager().showInterstitialByCount();
                      Navigation.pushNamed(Routes.activeMinerPage);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: AppColor.divider),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 3),
                        child: Text('sav'.tr, style: textRoboto(context, fontSize: 14)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          13.heightBox,
          HorizontalPadding(
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xFF243447).withAlpha(50),
                  ),
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Obx(
                      () => Container(
                        height: 150,
                        width: 200,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(getPlanImage(homeCtrl.selectedPlanIndex.value)),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Obx(
                  () => Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 15, top: 10),
                      child: homeCtrl.selectedPlanIndex.value == 3
                          ? Image.asset(AppAsset.popularTag, scale: 5)
                          : homeCtrl.selectedPlanIndex.value == 4
                          ? Image.asset(AppAsset.vip, scale: 9)
                          : SizedBox.shrink(),
                    ),
                  ),
                ),
              ],
            ),
          ),
          10.heightBox,
          HorizontalPadding(
            child: Text('suyh'.tr, style: textPoppins(context, color: AppColor.subText)),
          ),
          10.heightBox,
          SizedBox(
            height: 35,
            child: ListView.separated(
              controller: scrollController,
              padding: EdgeInsets.only(left: 15, right: 15),
              scrollDirection: Axis.horizontal,
              itemCount: homeCtrl.subscriptionPlanList.length,
              itemBuilder: (context, index) {
                final data = homeCtrl.subscriptionPlanList[index];
                return Obx(
                  () => GestureDetector(
                    onTap: () {
                      homeCtrl.selectedPlanIndex.value = index;
                      homeCtrl.planName.value = data.planName.toString();
                      homeCtrl.planAdsTime.value = data.adTime ?? 0;
                      homeCtrl.isPlanAds.value = data.planads ?? false;
                      homeCtrl.planDetailsList.value = data.plans ?? [];
                      homeCtrl.planDetails.value = data;
                      scrollToCenter(index);
                    },
                    child: CardContainer(
                      isPaddingZero: true,
                      color: homeCtrl.selectedPlanIndex.value == index
                          ? AppColor.primaryButton
                          : AppColor.card,
                      border: Border.all(
                        color: homeCtrl.selectedPlanIndex.value == index
                            ? AppColor.primaryButton
                            : AppColor.divider,
                      ),
                      margin: EdgeInsets.only(right: 10),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Center(
                          child: Text(
                            '${data.power.toString()} ${data.powerType}',
                            style: textMontserrat(
                              context,
                              fontWeight: FontWeight.w600,
                              fontSize: homeCtrl.selectedPlanIndex.value == index ? 16 : 15,
                              color: homeCtrl.selectedPlanIndex.value == index
                                  ? AppColor.text
                                  : AppColor.subText,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(height: 10);
              },
            ),
          ),
          Obx(
            () => !homeCtrl.isPurchase.value
                ? HorizontalPadding(
                    child: AppButton(
                      color: AppColor.secondaryButton,
                      textColor: AppColor.text,
                      onTap: () {
                        InterstitialAdManager().showInterstitialByCount();
                        Navigation.pushNamed(Routes.subscribePage);
                      },
                      text: 'sas'.tr,
                    ).pOnly(top: 18),
                  )
                : SizedBox.shrink(),
          ),
          Obx(() {
            final sessionTimer = AdRewardTimeService();
            final showTime = homeCtrl.planAdsTime.value / 60;
            return homeCtrl.isPlanAds.value
                ? Padding(
                    padding: const EdgeInsets.only(right: 15, left: 15, top: 15),
                    child: AppButtonSmall(
                      color: Color(0xFF364552),
                      textColor: AppColor.primaryText,
                      padding: EdgeInsets.symmetric(vertical: 6),
                      onTap: !sessionTimer.isRunning
                          ? () {
                              showWatchAdDialog(
                                context,
                                text: 'hbdht'.tr,
                                subText: "hbdhst".trParams({
                                  "power": "${homeCtrl.planDetails.value.power} ${homeCtrl.planDetails.value.powerType}",
                                }),
                                image: AppAsset.boost,
                                onWatchAd: () =>
                                    handleBoostTap(sessionTimer, homeCtrl.planAdsTime.value),
                              );
                            }
                          : () {},
                      child: sessionTimer.isRunning
                          ? Text(
                              sessionTimer.isRunning
                                  ? sessionTimer.formatDuration(sessionTimer.adRewardTimeLeft.value)
                                  : 'sob'.tr,
                              style: textPoppins(
                                context,
                                fontWeight: FontWeight.w600,
                                color: AppColor.white,
                              ),
                            )
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(AppAsset.drIcon, scale: 20),
                                10.widthBox,
                                Text(
                                  'sob'.tr,
                                  style: textPoppins(
                                    context,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15,
                                    color: AppColor.white,
                                  ),
                                ),
                                5.widthBox,
                                Text(
                                  '(${showTime.toStringAsFixed(0)} minutes)',
                                  style: subTextRoboto(
                                    context,
                                    color: AppColor.white.withAlpha(200),
                                  ),
                                ),
                              ],
                            ),
                    ),
                  )
                : SizedBox.shrink();
          }),

          15.heightBox,
          HorizontalPadding(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 3),
                  child: FaIcon(FontAwesomeIcons.circleCheck, size: 10, color: AppColor.subText),
                ),
                10.widthBox,
                Flexible(child: Text('s1'.tr, style: subTextRoboto(context, fontSize: 12))),
              ],
            ),
          ),
          3.heightBox,
          HorizontalPadding(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FaIcon(FontAwesomeIcons.circleCheck, size: 10, color: AppColor.subText),
                10.widthBox,
                Flexible(
                  child: RichText(
                    text: TextSpan(
                      text: 's2'.tr,
                      style: subTextRoboto(context, fontSize: 12),
                      children: [
                        TextSpan(
                          text: "Privacy Policy",
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigation.pushNamed(Routes.privacyPolicyPage);
                            },
                          style: TextStyle(
                            fontSize: 12,
                            color: Color(0xFF4D9EFF),
                            fontWeight: FontWeight.w500,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: ShowBanner(),
    );
  }

  Future<void> handleBoostTap(AdRewardTimeService timer, int time) async {
    if (timer.isRunning) return;
    final details = homeCtrl.planDetails.value;

    EasyLoading.show(status: 'Loading ad...');

    await Future.delayed(Duration(seconds: 1));

    IntOrRwdAdManger().showIntORRwdAdOnPlanAd(
      onReward: () async {
        timer.start(
          seconds: time,
          bonusPower: (details.power ?? 0).toDouble(),
          bonusType: details.powerType.toString(),
        );

        try {
          final activeMiner = ActiveBotModel(
            productID: '',
            botType: 'Ad Reward',
            type: 'free',
            power: details.power.toString(),
            powerType: details.powerType.toString(),
            durationType: 'fixed',
            durationSeconds: time,
            addTime: DateTime.now().millisecondsSinceEpoch,
            expireTime: time,
          );
          await HiveService().addToBox(activeMiner, boxName: 'cmf_activeBot_box');
        } catch (e) {
          debugPrint("$e");
        }

        final double minutes = time / 60;
        final adTime = minutes % 1 == 0 ? minutes.toStringAsFixed(0) : minutes.toStringAsFixed(2);
        EasyLoading.showToast(
          "Awesome! 🎉 You got ${details.power} ${details.powerType} mining power boost for $adTime minutes!",
        );
      },
      onAdClosed: () {},
    );

    EasyLoading.dismiss();
  }

  String getPlanImage(int index) {
    switch (index) {
      case 0:
        return AppAsset.zeroP1;
      case 1:
        return AppAsset.zeroP2;
      case 2:
        return AppAsset.zeroP3;
      case 3:
        return AppAsset.zeroP4;
      case 4:
        return AppAsset.zeroP5;
      default:
        return AppAsset.zeroP4;
    }
  }

  void scrollToCenter(int index) {
    Future.delayed(Duration.zero, () {
      if (!scrollController.hasClients) return;

      final itemWidth = 90.0;
      final screenWidth = MediaQuery.of(context).size.width;

      final target = (index * itemWidth) - (screenWidth / 2) + (itemWidth / 2);

      scrollController.animateTo(
        target.clamp(0.0, scrollController.position.maxScrollExtent),
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    });
  }
}
*/
