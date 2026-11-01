import 'package:cloud_mining_farm/ad_modual/banner/large_banner.dart';
import 'package:cloud_mining_farm/ad_modual/native/small_native.dart';
import 'package:cloud_mining_farm/modual/ctrl/home_ctrl.dart';
import 'package:cloud_mining_farm/theme/asset.dart';
import 'package:cloud_mining_farm/theme/colors.dart';
import 'package:cloud_mining_farm/theme/config.dart';
import 'package:cloud_mining_farm/theme/textstyles.dart';
import 'package:cloud_mining_farm/utils/utils.dart';
import 'package:cloud_mining_farm/widget/app_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class ReferralBalance extends StatefulWidget {
  const ReferralBalance({super.key});

  @override
  State<ReferralBalance> createState() => _ReferralBalanceState();
}

class _ReferralBalanceState extends State<ReferralBalance> {
  final HomeCtrl homeCtrl = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SmallNative(
              padding: const EdgeInsets.only(bottom: 15),
              sPadding: const EdgeInsets.only(bottom: 7.5),
            ).px(15),
            CardContainer(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(AppAsset.referral),
                  ),
                  15.heightBox,
                  Text('wrrb'.tr, style: textPoppins(context, fontWeight: FontWeight.w600)),
                  10.heightBox,
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: AppColor.divider),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(AppAsset.btcLogo, scale: 7.5),
                        10.widthBox,
                        Text(
                          homeCtrl.inviteBtcBalance.value.toStringAsFixed(12),
                          style: textMontserrat(
                            context,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          ' BTC',
                          style: textMontserrat(
                            context,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ).px(10).py(12),
                  ),
                  10.heightBox,
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: AppColor.divider),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('wrati'.tr, style: subTextRoboto(context, fontSize: 12)),
                        Row(
                          children: [
                            Text(
                              "${AppConfig.appDataSet?.referEarn?.toStringAsFixed(12)}",
                              style: textMontserrat(context, fontSize: 15),
                            ),
                            Text(' BTC', style: textMontserrat(context, fontSize: 15)),
                          ],
                        ),
                      ],
                    ).px(10).py(12),
                  ),
                ],
              ),
            ).px(15),
            15.heightBox,
            Text(
              'wrgr'.tr,
              textAlign: TextAlign.center,
              style: subTextMontserrat(context, fontSize: 13),
            ).px(15),
            20.heightBox,
            AppButtonSmall(
              textColor: AppColor.text,
              color: Color(0xFF3C6BC7),
              // color: Color(0xFFF35383),
              onTap: () => shareInvite(),
              padding: EdgeInsets.symmetric(vertical: 7),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    AppConfig.referralCode,
                    style: textRoboto(context, fontSize: 15, color: AppColor.primaryText),
                  ),
                  7.widthBox,
                  FaIcon(FontAwesomeIcons.copy, color: AppColor.primaryText, size: 15),
                  7.widthBox,
                  Text(
                    'wrse'.tr,
                    style: textRoboto(context, fontSize: 15, color: AppColor.primaryText),
                  ),
                ],
              ),
            ).px(15),
            20.heightBox,
            LargeBannerS(),
            60.heightBox,
          ],
        ),
      ),
    );
  }
}
