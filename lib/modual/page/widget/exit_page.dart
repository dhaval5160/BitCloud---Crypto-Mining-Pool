import 'package:cloud_mining_farm/ad_modual/int_man/Interstitial.dart';
import 'package:cloud_mining_farm/ad_modual/native/big_native.dart';
import 'package:cloud_mining_farm/theme/asset.dart';
import 'package:cloud_mining_farm/theme/colors.dart';
import 'package:cloud_mining_farm/theme/textstyles.dart';
import 'package:cloud_mining_farm/utils/app_navigation/navigation.dart';
import 'package:cloud_mining_farm/utils/utils.dart';
import 'package:cloud_mining_farm/widget/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class ExitPage extends StatelessWidget {
  const ExitPage({super.key});

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
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            20.heightBox,
            Image.asset(AppAsset.icLauncher, scale: 3),
            15.heightBox,
            buildBitCloudText(context),
            30.heightBox,
            HorizontalPadding(
              child: AppButtonSmall(
                color: Color(0xff3C6BC7),
                padding: EdgeInsets.symmetric(vertical: 6),
                onTap: () {
                  Navigation.pop();
                },
                child: Text(
                  'nn'.tr,
                  style: textMontserrat(
                    context,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: AppColor.white,
                  ),
                ),
              ),
            ),
            30.heightBox,
            BigNative().px(10),
          ],
        ),
        bottomNavigationBar: SafeArea(
          child: SizedBox(
            height: 40,
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () => SystemNavigator.pop(),
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(color: AppColor.primaryButton),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 6),
                  child: Text(
                    'Tap to Exit',
                    textAlign: TextAlign.center,
                    style: textMontserrat(
                      context,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppColor.white,
                    ),
                  ),
                ),
              ),
            ),
          ),

        ),
      ),
    );
  }
  Widget buildBitCloudText(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'Bit',
                  style: textMontserrat(context, fontSize: 24, fontWeight: FontWeight.w900, color: AppColor.text),
                ),
                TextSpan(
                  text: 'Cloud',
                  style: textMontserrat(context, fontSize: 24, fontWeight: FontWeight.w900, color: AppColor.primaryButton),
                ),
              ],
            ),
          ),

          const SizedBox(height: 5),

          Text(
            'est'.tr,
            textAlign: TextAlign.center,
            style: textMontserrat(
              context,
              fontSize: 12,
              fontWeight: FontWeight.w700,
              color: AppColor.subText,
            ),
          ),
        ],
      ).px(20),
    );
  }

}
