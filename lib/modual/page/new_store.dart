import 'package:cloud_mining_farm/ad_modual/banner/large_banner.dart';
import 'package:cloud_mining_farm/ad_modual/int_man/Interstitial.dart';
import 'package:cloud_mining_farm/ad_modual/int_man/int_rwd_admanger.dart';
import 'package:cloud_mining_farm/ad_modual/native/small_native.dart';
import 'package:cloud_mining_farm/modual/ctrl/home_ctrl.dart';
import 'package:cloud_mining_farm/modual/model/active_bot_model.dart';
import 'package:cloud_mining_farm/modual/model/sub_details_model.dart';
import 'package:cloud_mining_farm/modual/repository/adreward_time_rp.dart';
import 'package:cloud_mining_farm/theme/asset.dart';
import 'package:cloud_mining_farm/theme/colors.dart';
import 'package:cloud_mining_farm/theme/textstyles.dart';
import 'package:cloud_mining_farm/utils/app_navigation/app_navigation.dart';
import 'package:cloud_mining_farm/utils/app_navigation/navigation.dart';
import 'package:cloud_mining_farm/utils/hive_service.dart';
import 'package:cloud_mining_farm/utils/responsiv.dart';
import 'package:cloud_mining_farm/utils/utils.dart';
import 'package:cloud_mining_farm/widget/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:velocity_x/velocity_x.dart';

class StoreNewPage extends StatefulWidget {
  const StoreNewPage({super.key});

  @override
  State<StoreNewPage> createState() => _StoreNewPageState();
}

class _StoreNewPageState extends State<StoreNewPage> {
  final HomeCtrl homeCtrl = Get.find();

  @override
  void initState() {
    super.initState();
    if (homeCtrl.subscriptionPlanList.isEmpty) {
      return;
    }
    homeCtrl.selectedPlanIndex.value = 0;
    homeCtrl.planDetailsList.value = homeCtrl.subscriptionPlanList[0].plans ?? [];
    homeCtrl.planDetails.value = homeCtrl.subscriptionPlanList[0];
    homeCtrl.planAdsTime.value = homeCtrl.subscriptionPlanList[0].adTime ?? 0;
    homeCtrl.isPlanAds.value = homeCtrl.subscriptionPlanList[0].planads ?? false;
    homeCtrl.bonusSpeed.value = getExtraPowerValue(
      double.parse(homeCtrl.subscriptionPlanList[0].power?.toStringAsFixed(2) ?? "45.50"),
    );
    homeCtrl.planKeys = List.generate(homeCtrl.subscriptionPlanList.length, (_) => GlobalKey());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      appBar: buildCustomAppBar(context, showFullAppBar: false),
      body: SingleChildScrollView(
        child: Column(
          children: [
            15.heightBox,
            HorizontalPadding(
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: AppColor.card),
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: Obx(
                        () => Container(
                          height: context.responsive.heightPercent(15),
                          width: context.responsive.widthPercent(55),
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
            15.heightBox,
            SizedBox(
              height: 33,
              child: ListView.separated(
                padding: EdgeInsets.only(left: 15, right: 15),
                scrollDirection: Axis.horizontal,
                itemCount: homeCtrl.subscriptionPlanList.length,
                itemBuilder: (context, index) {
                  final data = homeCtrl.subscriptionPlanList[index];
                  return GestureDetector(
                    onTap: () {
                      homeCtrl.selectedPlanIndex.value = index;
                      homeCtrl.planDetailsList.value = data.plans ?? [];
                      homeCtrl.planDetails.value = data;
                      homeCtrl.planAdsTime.value = data.adTime ?? 0;
                      homeCtrl.isPlanAds.value = data.planads ?? false;
                      homeCtrl.bonusSpeed.value = getExtraPowerValue(
                        double.parse(data.power?.toStringAsFixed(2) ?? "45.50"),
                      );
                      final context = homeCtrl.planKeys[index].currentContext;

                      if (context != null) {
                        Scrollable.ensureVisible(
                          context,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeOut,
                          alignment: 0.5,
                        );
                      }
                    },
                    child: Obx(
                      () => Container(
                        key: homeCtrl.planKeys[index],
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: homeCtrl.selectedPlanIndex.value == index
                              ? GradientBoxBorder(
                                  gradient: LinearGradient(colors: [Color(0xffFF9800), Color(0xffF44336)]),
                                  width: 1.5,
                                )
                              : Border.all(color: AppColor.divider),
                          gradient: homeCtrl.selectedPlanIndex.value == index
                              ? LinearGradient(colors: [Color(0xffFF9800), Color(0xffF44336)])
                              : LinearGradient(colors: [AppColor.card, AppColor.card]),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                          child: Center(
                            child: Text(
                              '${data.power.toString()} ${data.powerType}',
                              style: textRoboto(
                                context,
                                fontWeight: homeCtrl.selectedPlanIndex.value == index
                                    ? FontWeight.bold
                                    : FontWeight.w600,
                                fontSize: 16,
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
                  return SizedBox(width: 10);
                },
              ),
            ),
            SmallNative(
              padding: const EdgeInsets.symmetric(vertical: 15),
              sPadding: const EdgeInsets.symmetric(vertical: 7.5),
            ).px(15),
            HorizontalPadding(
              child: CardContainer(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('smuo'.tr, style: textPoppins(context, fontWeight: FontWeight.w600)),
                    Divider(color: AppColor.divider),
                    Obx(
                      () => Column(
                        children: [
                          spdRow(
                            text: 'sms'.tr,
                            title:
                                '${homeCtrl.planDetails.value.power?.toStringAsFixed(2)} ${homeCtrl.planDetails.value.powerType}',
                          ),
                          spdRow(
                            text: 'sbms'.tr,
                            title: '${homeCtrl.bonusSpeed.value.toStringAsFixed(2)} TH/s',
                          ),
                          spdRow(text: 'smp'.tr, title: '${homeCtrl.planDetails.value.miningPower}'),
                          spdRow(text: 'smb'.tr, title: '${homeCtrl.planDetails.value.miningBoost}'),
                          spdRow(text: 'sam'.tr, title: '${homeCtrl.planDetails.value.miner?.toString()}'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Obx(
              () => homeCtrl.isPurchase.value
                  ? HorizontalPadding(
                      child: GestureDetector(
                        onTap: () {
                          InterstitialAdManager().showInterstitialByCount();
                          Navigation.pushNamed(Routes.subscribePage);
                        },
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: AppColor.primaryButton,
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 5),
                            child: Text(
                              'sbutton'.tr,
                              textAlign: TextAlign.center,
                              style: textMontserrat(
                                context,
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: AppColor.text,
                              ),
                            ),
                          ),
                        ).pOnly(top: 15),
                      ),
                    )
                  : SizedBox.shrink(),
            ),
            Obx(() {
              final sessionTimer = AdRewardTimeService();
              final time = homeCtrl.planAdsTime.value / 60;

              return homeCtrl.isPlanAds.value
                  ? GestureDetector(
                      onTap: !sessionTimer.isRunning
                          ? () {
                              showWatchAdDialog(
                                context,
                                text: 'hbdht'.tr,
                                subText: "hbdhst".trParams({
                                  "power":
                                      "${homeCtrl.planDetails.value.power} ${homeCtrl.planDetails.value.powerType} for ${time.toStringAsFixed(0)} minutes.",
                                }),
                                image: AppAsset.boost,
                                onWatchAd: () {
                                  handleBoostTap(sessionTimer, homeCtrl.planDetails.value);
                                },
                              );
                            }
                          : () {},
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color(0xFF3C6BC7),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 6),
                          child: sessionTimer.isRunning
                              ? Text(
                                  sessionTimer.isRunning
                                      ? sessionTimer.formatDuration(sessionTimer.adRewardTimeLeft.value)
                                      : 'sob'.tr,
                                  style: textPoppins(
                                    context,
                                    fontSize: 16,
                                    color: AppColor.text.withAlpha(250),
                                  ),
                                )
                              : Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "sob".tr,
                                      style: textPoppins(
                                        context,
                                        fontSize: 15,
                                        color: AppColor.text.withAlpha(250),
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    7.widthBox,
                                    Text(
                                      '(${time.toStringAsFixed(0)} minutes)',
                                      style: subTextRoboto(context, color: AppColor.text),
                                    ),
                                  ],
                                ),
                        ),
                      ).pOnly(top: 15, left: 15, right: 15),
                    )
                  : SizedBox.shrink();
            }),
            20.heightBox,
            LargeBannerS(),
            60.heightBox,
          ],
        ),
      ),
    );
  }

  spdRow({String? title, String? text}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text ?? "", style: subTextPoppins(context, fontSize: 13)),
        Text(title ?? "", style: textMontserrat(context, fontWeight: FontWeight.w600, fontSize: 14)),
      ],
    );
  }

  Future<void> handleBoostTap(AdRewardTimeService timer, ListPlan data) async {
    if (timer.isRunning) return;

    EasyLoading.show(status: 'Loading ad...');

    await Future.delayed(Duration(seconds: 1));

    IntOrRwdAdManger().showIntORRwdAdOnPlanAd(
      onReward: () async {
        timer.start(
          seconds: data.adTime ?? 0,
          bonusPower: (data.power ?? 0).toDouble(),
          bonusType: data.powerType.toString(),
        );

        try {
          final activeMiner = ActiveBotModel(
            productID: '',
            botType: "${data.planName.toString()} Reward",
            type: 'free',
            power: data.power.toString(),
            powerType: data.powerType.toString(),
            durationType: 'fixed',
            durationSeconds: data.adTime ?? 120,
            addTime: DateTime.now().millisecondsSinceEpoch,
            expireTime: data.adTime ?? 120,
          );

          await HiveService().addToBox(activeMiner, boxName: 'cmf_activeBot_box');
        } catch (e) {
          debugPrint('$e');
        }
      },
      onAdClosed: () {},
    );

    EasyLoading.dismiss();
  }

  String getPlanImage(int index) {
    switch (index) {
      case 0:
        return AppAsset.one;
      case 1:
        return AppAsset.two;
      case 2:
        return AppAsset.three;
      case 3:
        return AppAsset.four;
      case 4:
        return AppAsset.five;
      default:
        return AppAsset.six;
    }
  }
}
