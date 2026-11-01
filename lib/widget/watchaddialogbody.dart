import 'package:cloud_mining_farm/ad_modual/int_man/Interstitial.dart';
import 'package:cloud_mining_farm/theme/asset.dart';
import 'package:cloud_mining_farm/theme/colors.dart';
import 'package:cloud_mining_farm/theme/textstyles.dart';
import 'package:cloud_mining_farm/utils/app_navigation/navigation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class WatchAdDialogBody extends StatelessWidget {
  final String text;
  final String subText;
  final String? image;
  final VoidCallback onWatchAd;
  final String? muteText;
  final String? subHeader;

  const WatchAdDialogBody({
    super.key,
    required this.text,
    required this.subText,
    required this.onWatchAd,
    this.image,
    this.muteText = "",
    this.subHeader = "",
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.topCenter,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 50),
          decoration: BoxDecoration(color: AppColor.card, borderRadius: BorderRadius.circular(16)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              85.heightBox,
              Text(
                text,
                textAlign: TextAlign.center,
                style: textRoboto(context, fontSize: 16, fontWeight: FontWeight.w600),
              ).px(20),
              if (subHeader != null && subHeader!.isNotEmpty) ...[
                7.heightBox,
                Text(
                  subHeader!,
                  textAlign: TextAlign.center,
                  style: textMontserrat(context, fontWeight: FontWeight.w600),
                ).px(20),
              ],
              12.heightBox,
              Text(subText, textAlign: TextAlign.center, style: subTextMontserrat(context, fontSize: 13)).px(20),
              20.heightBox,
              GestureDetector(
                onTap: () {
                  Navigation.pop();
                  onWatchAd();
                },
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: AppColor.secondaryButton),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 9),
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
              ).px(20),
              12.heightBox,
              GestureDetector(
                onTap: () {
                  Navigation.pop();
                },
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: AppColor.secondaryButton),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 9),
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
              ).px(20),
              if (muteText?.trim().isNotEmpty == true) ...[
                15.heightBox,
                Text(muteText!.trim(), textAlign: TextAlign.center, style: subTextRoboto(context, fontSize: 13)).px(20),
              ],
              20.heightBox,
            ],
          ),
        ),

        /// Floating Image
        Positioned(top: -15, child: SizedBox(height: 130, width: 130, child: Image.asset(image ?? AppAsset.watchAd))),
      ],
    );
  }
}

class WatchLimitDialogBody extends StatelessWidget {
  final String text;
  final String? image;

  const WatchLimitDialogBody({super.key, required this.text, this.image});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.topCenter,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 60),
          decoration: BoxDecoration(color: AppColor.card, borderRadius: BorderRadius.circular(16)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              80.heightBox,
              Text(text, textAlign: TextAlign.center, style: subTextMontserrat(context, fontSize: 13)).px(20),
              25.heightBox,
              GestureDetector(
                onTap: () {
                  InterstitialAdManager().showInterstitialAds();
                  Navigation.pop();
                },
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: AppColor.secondaryButton),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 7),
                    child: Text(
                      'wadlb'.tr,
                      style: textMontserrat(
                        context,
                        color: AppColor.text.withAlpha(250),
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ).px(20),

              20.heightBox,
              /*Row(
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
              ),*/
            ],
          ),
        ),

        /// Floating Image
        Positioned(top: -15, child: SizedBox(height: 130, width: 130, child: Image.asset(image ?? AppAsset.watchAd))),
      ],
    );
  }
}

class RewardHW extends StatelessWidget {
  const RewardHW({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: AppColor.card, borderRadius: BorderRadius.circular(16)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          10.heightBox,
          Text("rhrsw".tr, style: textMontserrat(context, fontSize: 14, fontWeight: FontWeight.w600)).px(20),
          10.heightBox,
          Divider(color: AppColor.divider, height: 0),
          7.heightBox,
          Text("rsdt".tr, style: textMontserrat(context, fontSize: 13)).px(20),
          7.heightBox,
          Text("rsdst".tr, style: subTextPoppins(context, fontSize: 12)).px(20),
          10.heightBox,
          Text("rsdst1".tr, style: textRoboto(context, fontSize: 12)).px(20),
          10.heightBox,
          Text("rsdst2".tr, style: textRoboto(context, fontSize: 12)).px(20),
          25.heightBox,
          GestureDetector(
            onTap: () {
              InterstitialAdManager().showInterstitialByCount();
              Navigation.pop();
            },
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: AppColor.secondaryButton),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 7),
                child: Text(
                  'wadlb'.tr,
                  style: textMontserrat(context, color: AppColor.text.withAlpha(250), fontSize: 15, fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ).px(20),
          20.heightBox,
        ],
      ),
    );
  }
}

class LockUnLock extends StatelessWidget {
  final String text;
  final String subText;
  final VoidCallback onWatchAd;

  const LockUnLock({super.key, required this.text, required this.subText, required this.onWatchAd});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: AppColor.card, borderRadius: BorderRadius.circular(16)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          25.heightBox,
          Text(
            text,
            textAlign: TextAlign.center,
            style: textRoboto(context, fontSize: 16, fontWeight: FontWeight.w600),
          ).px(20),
          15.heightBox,
          Text(subText, textAlign: TextAlign.center, style: subTextMontserrat(context, fontSize: 13)).px(20),
          25.heightBox,
          GestureDetector(
            onTap: () {
              Navigation.pop();
              onWatchAd();
            },
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: AppColor.secondaryButton),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 9),
                child: Text(
                  'wad'.tr,
                  style: textMontserrat(context, color: AppColor.text.withAlpha(250), fontSize: 15, fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ).px(20),
          12.heightBox,
          GestureDetector(
            onTap: () {
              Navigation.pop();
            },
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: AppColor.secondaryButton),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 9),
                child: Text(
                  'nn'.tr,
                  style: textMontserrat(context, color: AppColor.text.withAlpha(250), fontSize: 15, fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ).px(20),
          25.heightBox,
        ],
      ),
    );
  }
}

class StartMiningDialog extends StatelessWidget {
  final String subText;
  final String? image;
  final VoidCallback onWatchAd;

  const StartMiningDialog({super.key, required this.subText, required this.onWatchAd, this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 60),
      decoration: BoxDecoration(color: AppColor.card, borderRadius: BorderRadius.circular(16)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          15.heightBox,
          Image.asset(AppAsset.watchAd, scale: 6),
          15.heightBox,
          Text(subText, textAlign: TextAlign.center, style: subTextMontserrat(context, fontSize: 13)).px(20),
          25.heightBox,
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    Navigation.pop();
                  },
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: AppColor.secondaryButton),
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
                    Navigation.pop();
                    onWatchAd();
                  },
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: AppColor.secondaryButton),
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
    );
  }
}
