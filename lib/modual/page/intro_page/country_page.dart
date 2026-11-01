import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:cloud_mining_farm/ad_modual/int_man/interstitial.dart';
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
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:velocity_x/velocity_x.dart';

class CountryPage extends StatefulWidget {
  const CountryPage({super.key});

  @override
  State<CountryPage> createState() => _CountryPageState();
}

class _CountryPageState extends State<CountryPage> {
  String? selectedRegion = "Choose Your Region";
  bool isInitializing = false;
  bool isInitialized = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(child: Image.asset(AppAsset.icLauncher, scale: 3)),
          18.heightBox,
          buildBitCloudText(context),
          30.heightBox,
          Text(headerText, style: textMontserrat(context, fontSize: 16, fontWeight: FontWeight.w600)).px(18),
          7.heightBox,
          DropdownButtonFormField<String>(
            initialValue: selectedRegion,
            hint: Text("cicr".tr),
            items: regionList.map((region) {
              return DropdownMenuItem<String>(
                value: region,
                child: Text(region, style: textRoboto(context, fontSize: 16, fontWeight: FontWeight.w500)),
              );
            }).toList(),
            onChanged: (value) async {
              if (value != null && value != "Choose Your Region") {
                setState(() {
                  selectedRegion = value;
                  isInitializing = true;
                });

                await Future.delayed(const Duration(seconds: 3), () {
                  setState(() {
                    isInitializing = false;
                    isInitialized = true;
                  });
                });
              }
            },

            decoration: InputDecoration(
              filled: true,
              fillColor: AppColor.card,
              isDense: true,
              enabled: true,
              contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none),
            ),
            icon: Icon(Icons.keyboard_arrow_down_rounded, color: AppColor.subText),
            dropdownColor: AppColor.card,
          ).px(15),
          Center(
            child: Column(
              children: [
                if (isInitializing) ...[
                  15.heightBox,
                  Lottie.asset('asset/lottie/connnecting.json', height: 100),
                  AnimatedTextKit(
                    animatedTexts: [
                      TyperAnimatedText(
                        'ci'.tr,
                        textStyle: textMontserrat(context, fontSize: 16, fontWeight: FontWeight.w600, color: AppColor.subText),
                        speed: const Duration(milliseconds: 100),
                      ),
                    ],
                    repeatForever: true,
                  ).px(15),
                ] else if (isInitialized) ...[
                  Column(
                    children: [
                      Lottie.asset(AppAsset.done, height: 100, repeat: false),
                      AppText(
                        'csc'.trParams({"selectedRegion": "$selectedRegion"}),
                        textAlign: TextAlign.center,
                        fontSize: 14,
                        color: AppColor.subText,
                        fontFamily: AppConfig.roboto,
                      ),
                    ],
                  ).px(15),
                ] else ...[
                  20.heightBox,
                  AppText(
                    'cyrs'.tr,
                    textAlign: TextAlign.center,
                    fontSize: 14,
                    color: AppColor.subText,
                    fontFamily: AppConfig.roboto,
                  ).px(15),
                ],
              ],
            ),
          ),
          25.heightBox,
          HorizontalPadding(
            child: AppButton(
              onTap: () {
                if (selectedRegion != "Choose Your Region") {
                  Navigation.pushNamed(Routes.signInPage);
                  InterstitialAdManager().showInterstitialAds();
                } else {
                  EasyLoading.showToast("csre".tr);
                }
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 2),
                child: Text(
                  "ccb".tr,
                  style: textMontserrat(context, fontSize: 16, fontWeight: FontWeight.w600, color: AppColor.primaryText),
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: SafeArea(child: NativeBanner(radius: 0)),
    );
  }

  final regionList = [
    "Choose Your Region",
    "Global",
    "Asia",
    "Africa",
    "Europe",
    "North America",
    "South America",
    "Australia",
    "Pacific",
    "Middle East",
  ];

  String get headerText {
    if (isInitializing) {
      return "cics".tr;
    } else if (isInitialized) {
      return "cisc".tr;
    } else {
      return "cisyr".tr;
    }
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

          const SizedBox(height: 2),

          Text(
            'EMPOWER MINING POOL',
            textAlign: TextAlign.center,
            style: textMontserrat(
              context,
              fontSize: 11.5,
              fontWeight: FontWeight.w700,
              color: AppColor.subText,
            ).copyWith(letterSpacing: 1.8),
          ),
        ],
      ),
    );
  }
}
