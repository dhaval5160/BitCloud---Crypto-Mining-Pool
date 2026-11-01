import 'package:cloud_mining_farm/ad_modual/native/native_banner.dart';
import 'package:cloud_mining_farm/theme/asset.dart';
import 'package:cloud_mining_farm/theme/colors.dart';
import 'package:cloud_mining_farm/theme/config.dart';
import 'package:cloud_mining_farm/theme/textstyles.dart';
import 'package:cloud_mining_farm/widget/app_text.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class IpWidget1 extends StatelessWidget {
  final VoidCallback onNext;

  const IpWidget1({super.key, required this.onNext});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(child: Image.asset(AppAsset.introOne)),
            50.heightBox,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35),
              child: AppText(
                'Instant Bitcoin Cloud Mining',
                textAlign: TextAlign.center,
                fontSize: 22,
                color: AppColor.text,
                fontFamily: AppConfig.montserrat,
                fontWeight: FontWeight.w600,
              ),
            ),
            5.heightBox,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35),
              child: AppText(
                'No hardware. No setup. Start in seconds.',
                textAlign: TextAlign.center,
                fontSize: 13,
                color: AppColor.subText,
                fontFamily: AppConfig.roboto,
                fontWeight: FontWeight.w500,
              ),
            ),
            50.heightBox,
            GestureDetector(
              onTap: onNext,
              child: Container(
                height: 38,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: AppColor.primaryButton,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  "Next",
                  style: textMontserrat(
                    context,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: AppColor.primaryText,
                    height: 1.2,
                  ),
                ),
              ),
            ).px(25),
            50.heightBox,
          ],
        ),
      ),
      bottomNavigationBar: NativeBanner(radius: 0,),
    );
  }
}
