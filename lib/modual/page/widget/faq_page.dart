import 'package:cloud_mining_farm/ad_modual/banner/banner.dart';
import 'package:cloud_mining_farm/ad_modual/int_man/Interstitial.dart';
import 'package:cloud_mining_farm/ad_modual/native/big_native.dart';
import 'package:cloud_mining_farm/theme/colors.dart';
import 'package:cloud_mining_farm/theme/textstyles.dart';
import 'package:cloud_mining_farm/utils/app_navigation/navigation.dart';
import 'package:cloud_mining_farm/utils/responsiv.dart';
import 'package:cloud_mining_farm/widget/app_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class FaqPage extends StatelessWidget {
  const FaqPage({super.key});

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
        appBar: buildCustomAppBar(context, title: 'Help Center'.tr),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                20.heightBox,
                Text(
                  "Hey there! Look lick you are facing some problems. Find your answers here.".tr,
                  textAlign: TextAlign.center,
                  style: subTextMontserrat(context, fontSize: 12),
                ).px(15),
                15.heightBox,
                Text("General".tr, style: textPoppins(context)).px(15),
                10.heightBox,
                CommonExpansionTile(titleKey: 'q1'.tr, contentKey: 'a1'.tr),
                10.heightBox,
                CommonExpansionTile(titleKey: 'q2'.tr, contentKey: 'a2'.tr),
                10.heightBox,
                CommonExpansionTile(titleKey: 'q3'.tr, contentKey: 'a3'.tr),
                10.heightBox,
                CommonExpansionTile(titleKey: 'q4'.tr, contentKey: 'a4'.tr),
                ShowBanner(padding: EdgeInsets.symmetric(vertical: 15), nPadding: EdgeInsets.symmetric(vertical: 7.5)),
                Text("Reward".tr, style: textPoppins(context)).px(15),
                10.heightBox,
                CommonExpansionTile(titleKey: 'q5'.tr, contentKey: 'a5'.tr),
                10.heightBox,
                CommonExpansionTile(titleKey: 'q6'.tr, contentKey: 'a6'.tr),
                10.heightBox,
                CommonExpansionTile(titleKey: 'q7'.tr, contentKey: 'a7'.tr),
                15.heightBox,
                Text("Upgrade".tr, style: textPoppins(context)).px(15),
                10.heightBox,
                CommonExpansionTile(titleKey: 'q8'.tr, contentKey: 'a8'.tr),
                10.heightBox,
                CommonExpansionTile(titleKey: 'q9'.tr, contentKey: 'a9'.tr),
                10.heightBox,
                CommonExpansionTile(titleKey: 'q10'.tr, contentKey: 'a10'.tr),
                20.heightBox,
                BigNativeS().px(10),
                40.heightBox,
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CommonExpansionTile extends StatelessWidget {
  final String titleKey;
  final String contentKey;

  const CommonExpansionTile({super.key, required this.titleKey, required this.contentKey});

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      backgroundColor: Colors.transparent,
      collapsedBackgroundColor: Colors.transparent,
      iconColor: AppColor.text,
      collapsedIconColor: AppColor.text,
      enabled: true,
      minTileHeight: context.responsive.heightPercent(5.5),
      expansionAnimationStyle: AnimationStyle(
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInOut,
      ),
      shape: RoundedRectangleBorder(
        side: BorderSide(color: AppColor.divider, width: 1),
        borderRadius: BorderRadius.circular(8),
      ),
      collapsedShape: RoundedRectangleBorder(
        side: BorderSide(color: AppColor.divider, width: 1),
        borderRadius: BorderRadius.circular(8),
      ),
      childrenPadding: const EdgeInsets.only(left: 15, right: 15, bottom: 12),
      title: Text(titleKey.tr, style: textRoboto(context, fontSize: 13)),
      children: [Text(contentKey.tr, style: subTextPoppins(context, fontSize: 12))],
    ).px(15);
  }
}
