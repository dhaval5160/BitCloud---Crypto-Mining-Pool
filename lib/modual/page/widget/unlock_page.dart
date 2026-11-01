import 'package:cloud_mining_farm/ad_modual/int_man/Interstitial.dart';
import 'package:cloud_mining_farm/ad_modual/int_man/int_rwd_admanger.dart';
import 'package:cloud_mining_farm/ad_modual/native/native_banner.dart';
import 'package:cloud_mining_farm/modual/ctrl/home_ctrl.dart';
import 'package:cloud_mining_farm/theme/asset.dart';
import 'package:cloud_mining_farm/theme/colors.dart';
import 'package:cloud_mining_farm/theme/config.dart';
import 'package:cloud_mining_farm/theme/textstyles.dart';
import 'package:cloud_mining_farm/utils/app_navigation/navigation.dart';
import 'package:cloud_mining_farm/utils/hive_service.dart';
import 'package:cloud_mining_farm/utils/responsiv.dart';
import 'package:cloud_mining_farm/utils/utils.dart';
import 'package:cloud_mining_farm/widget/app_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:velocity_x/velocity_x.dart';

class UnlockPage extends StatefulWidget {
  const UnlockPage({super.key});

  @override
  State<UnlockPage> createState() => _UnlockPageState();
}

class _UnlockPageState extends State<UnlockPage> {
  final HomeCtrl homeCtrl = Get.find();
  double balance = 0.0;

  @override
  void initState() {
    balance = (homeCtrl.miningBtcValue.value + homeCtrl.inviteBtcBalance.value);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;
        InterstitialAdManager().showInterstitialByBackCount();
        Navigation.pop();
      },
      child: Scaffold(
        backgroundColor: AppColor.background,
        appBar: buildCustomAppBar(context, title: 'ulh'.tr),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            30.heightBox,
            HorizontalPadding(
              child: CardContainer(
                borderRadius: BorderRadius.circular(16),
                child: Column(
                  children: [
                    10.heightBox,
                    Center(
                      child: HorizontalPadding(
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              height: context.responsive.heightPercent(10),
                              decoration: BoxDecoration(
                                color: AppColor.background,
                                shape: BoxShape.circle,
                                border: Border.all(color: Color(0xffFF9F1C)),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0xffFF9F1C).withAlpha(20),
                                    blurRadius: 15,
                                    spreadRadius: 30,
                                  ),
                                ],
                              ),
                              child: Image.asset(
                                AppAsset.unLock,
                                scale: 15,
                                color: Color(0xffFF9F1C),
                              ).p(25),
                            ),
                            Lottie.asset(
                              AppAsset.start,
                              height: context.responsive.heightPercent(20),
                            ),
                          ],
                        ),
                      ),
                    ),
                    10.heightBox,
                    Text(
                      "uvull".tr,
                      style: textMontserrat(context, fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                    30.heightBox,
                    Text(
                      "uslst".trParams({"ulvbalance": balance.toStringAsFixed(12)}),
                      textAlign: TextAlign.center,
                      style: subTextMontserrat(context, fontSize: 13),
                    ).px(10),
                    10.heightBox,
                  ],
                ),
              ),
            ),
            30.heightBox,
            GestureDetector(
              onTap: () {
                showLockUnLockDialog(
                  context,
                  text: 'uvull'.tr,
                  subText: "lUPtl".trParams({"tounlockbtc": balance.toStringAsFixed(12)}),
                  onWatchAd: () {
                    handleLockTap();
                  },
                );
              },
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: AppColor.primaryButton,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: Text(
                    'UNLOCK VAULT',
                    style: textRoboto(
                      context,
                      color: AppColor.text,
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                ),
              ).px(15),
            ),
          ],
        ),
        bottomNavigationBar: SafeArea(child: NativeBanner(radius: 0,)),
      ),
    );
  }

  showWatchLockDialog(
    BuildContext context, {
    required String text,
    required VoidCallback onWatchAd,
    VoidCallback? notNow,
  }) {
    return showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
          backgroundColor: Colors.transparent,
          insetPadding: const EdgeInsets.symmetric(horizontal: 20),
          child: CardContainer(
            borderRadius: BorderRadius.circular(18),
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(AppAsset.watchAd, scale: 10),
                  const SizedBox(height: 10),
                  Text(
                    text,
                    textAlign: TextAlign.center,
                    style: subTextMontserrat(context, fontSize: 13),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: AppButtonSmall(
                          color: AppColor.secondaryButton,
                          textColor: AppColor.secondaryText,
                          onTap: () => Navigation.pop(),
                          text: 'nn'.tr,
                          padding: const EdgeInsets.symmetric(vertical: 5),
                        ),
                      ),
                      10.widthBox,
                      Expanded(
                        child: AppButtonSmall(
                          color: AppColor.secondaryButton,
                          textColor: AppColor.secondaryText,
                          onTap: () {
                            Navigation.pop();
                            onWatchAd();
                          },
                          text: 'wad'.tr,
                          padding: const EdgeInsets.symmetric(vertical: 5),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Future<void> handleLockTap() async {
    IntOrRwdAdManger().showIntORRwdAdOnPlanAd(
      onReward: () async {
        await HiveService().saveData(AppConfig.lockMinedBTC, false);
      },
      onAdClosed: () {
        showSuccessDialog(
          context,
          isEmpty: false,
          massage: "lUPbsm".trParams({"unlockedbtc": balance.toStringAsFixed(12)}),
          onTap: () {
            Navigation.pop();
          },
        );
      },
    );
  }
}
