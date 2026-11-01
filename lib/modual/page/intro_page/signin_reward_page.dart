import 'package:cloud_mining_farm/ad_modual/int_man/int_rwd_admanger.dart';
import 'package:cloud_mining_farm/ad_modual/native/native_banner.dart';
import 'package:cloud_mining_farm/theme/asset.dart';
import 'package:cloud_mining_farm/theme/colors.dart';
import 'package:cloud_mining_farm/theme/config.dart';
import 'package:cloud_mining_farm/theme/textstyles.dart';
import 'package:cloud_mining_farm/utils/app_navigation/app_navigation.dart';
import 'package:cloud_mining_farm/utils/app_navigation/navigation.dart';
import 'package:cloud_mining_farm/utils/utils.dart';
import 'package:cloud_mining_farm/widget/app_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:velocity_x/velocity_x.dart';

class SignInRewardPage extends StatefulWidget {
  const SignInRewardPage({super.key});

  @override
  State<SignInRewardPage> createState() => _SignInRewardPageState();
}

class _SignInRewardPageState extends State<SignInRewardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset(AppAsset.done, width: 200, height: 200, fit: BoxFit.fill, repeat: false),
              Text(
                'src'.tr,
                style: textMontserrat(context, fontSize: 24, fontWeight: FontWeight.w600),
              ),
              15.heightBox,
              HorizontalPadding(
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: 'srsubone'.tr,
                    style: subTextMontserrat(context, fontSize: 13),
                    children: [
                      TextSpan(
                        text: '${AppConfig.appDataSet?.startHashRate} Gh/s',
                        style: subTextMontserrat(
                          context,
                          fontWeight: FontWeight.w600,
                        ).copyWith(height: 1.5),
                      ),
                      TextSpan(
                        text: 'srsubtwo'.tr,
                        style: subTextMontserrat(context, fontSize: 13).copyWith(height: 1.5),
                      ),
                    ],
                  ),
                ),
              ),

              25.heightBox,
              HorizontalPadding(
                child: AppButton(
                  onTap: () {
                    if (AppConfig.appDataSet?.startRewardadsFirstime == true) {
                      showSFRDialog(context);
                    } else {
                      Navigation.pushNamed(Routes.bottomPage);
                    }
                  },
                  child: Text(
                    "srls".tr,
                    style: textMontserrat(
                      context,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: AppColor.primaryText,
                    ),
                  ),
                ),
              ),

              20.heightBox,
            ],
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(child: NativeBanner(radius: 0,)),
    );
  }

  void showSFRDialog(BuildContext context) {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: 'SFR',
      barrierColor: Colors.black38,
      transitionDuration: const Duration(milliseconds: 500),
      pageBuilder: (_, __, ___) => const SizedBox(),
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        final curvedAnimation = CurvedAnimation(
          parent: animation,
          curve: Curves.easeOutCubic,
          reverseCurve: Curves.easeInCubic,
        );

        return ScaleTransition(
          scale: curvedAnimation,
          child: FadeTransition(
            opacity: animation,
            child: Dialog(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              backgroundColor: Colors.transparent,
              insetPadding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                margin: const EdgeInsets.only(top: 60),
                decoration: BoxDecoration(
                  color: AppColor.card,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    15.heightBox,
                    Image.asset(AppAsset.watchAd, scale: 6),
                    15.heightBox,
                    Text(
                      'srdh'.trParams({
                        "value": AppConfig.endpoint?.startingReward?.toStringAsFixed(12) ?? "",
                      }),
                      textAlign: TextAlign.center,
                      style: subTextMontserrat(context, fontSize: 13),
                    ).px(20),
                    25.heightBox,
                    Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              Navigation.pushNamed(Routes.bottomPage);
                            },
                            child: Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: AppColor.secondaryButton,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 7),
                                child: Text(
                                  'nn'.tr,
                                  style: textMontserrat(
                                    context,
                                    color: AppColor.text.withAlpha(250),
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        13.widthBox,
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              IntOrRwdAdManger().showIntORRwdAdOnStart(
                                onReward: () {},
                                onAdClosed: () {},
                              );
                              Navigation.pushNamed(Routes.bottomPage);
                            },
                            child: Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: AppColor.secondaryButton,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 7),
                                child: Text(
                                  'wad'.tr,
                                  style: textMontserrat(
                                    context,
                                    color: AppColor.text.withAlpha(250),
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ).px(20),
                    20.heightBox,
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
