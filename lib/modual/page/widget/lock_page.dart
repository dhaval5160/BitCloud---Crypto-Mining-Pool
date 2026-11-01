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

class LockPage extends StatefulWidget {
  const LockPage({super.key});

  @override
  State<LockPage> createState() => _LockPageState();
}

class _LockPageState extends State<LockPage> {
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
        appBar: buildCustomAppBar(context, title: 'lh'.tr),
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
                                AppAsset.lock,
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
                      "lvl".tr,
                      style: textMontserrat(context, fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                    30.heightBox,
                    Text(
                      "lclst".trParams({"lvbalance": balance.toStringAsFixed(12)}),
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
                  text: 'lvl'.tr,
                  subText: "lptl".trParams({"tolockbtc": balance.toStringAsFixed(12)}),
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
                    'lel'.tr,
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



  Future<void> handleLockTap() async {
    IntOrRwdAdManger().showIntORRwdAdOnPlanAd(
      onReward: () async {
        await HiveService().saveData(AppConfig.lockMinedBTC, true);
      },
      onAdClosed: () {
        showSuccessDialog(
          context,
          isEmpty: false,
          massage: "lPbsm".trParams({"lockedbtc": balance.toStringAsFixed(12)}),
          onTap: () {
            Navigation.pop();
          },
        );
      },
    );
  }
}
