import 'package:cloud_mining_farm/ad_modual/banner/banner.dart';
import 'package:cloud_mining_farm/ad_modual/int_man/Interstitial.dart';
import 'package:cloud_mining_farm/ad_modual/native/native_banner.dart';
import 'package:cloud_mining_farm/modual/ctrl/home_ctrl.dart';
import 'package:cloud_mining_farm/theme/asset.dart';
import 'package:cloud_mining_farm/theme/colors.dart';
import 'package:cloud_mining_farm/theme/config.dart';
import 'package:cloud_mining_farm/theme/textstyles.dart';
import 'package:cloud_mining_farm/utils/app_navigation/navigation.dart';
import 'package:cloud_mining_farm/utils/hive_service.dart';
import 'package:cloud_mining_farm/widget/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class SuperCoinPage extends StatefulWidget {
  const SuperCoinPage({super.key});

  @override
  State<SuperCoinPage> createState() => _SuperCoinPageState();
}

class _SuperCoinPageState extends State<SuperCoinPage> {
  final HomeCtrl homeCtrl = Get.find();
  double balance = 0.0;

  @override
  void initState() {
    balance = homeCtrl.btcBalance.value + homeCtrl.inviteBtcBalance.value;
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
        appBar: buildCustomAppBar(context, title: 'scat'.tr),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            30.heightBox,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(AppAsset.superCoin, scale: 20),
                12.widthBox,
                Text(
                  HiveService().getData<String>(AppConfig.superCoin) != null
                      ? "${HiveService().getData<String>(AppConfig.superCoin)}"
                      : "0.00",
                  style: textMontserrat(context, fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            5.heightBox,
            Text(
              "scab".tr,
              style: subTextPoppins(context, fontSize: 15, fontWeight: FontWeight.w600),
            ),
            ShowBanner(padding: EdgeInsets.symmetric(vertical: 20), nPadding: EdgeInsets.symmetric(vertical: 15)),
            Text(
              "scht".tr,
              textAlign: TextAlign.center,
              style: subTextPoppins(context, fontSize: 13),
            ).px(20),
            25.heightBox,
            CardContainer(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("scone".tr, style: subTextRoboto(context, fontSize: 18)),
                  Text("=", style: subTextRoboto(context, fontSize: 18)).px(7),
                  Text(AppConfig.superCoinValue, style: subTextRoboto(context, fontSize: 18)),
                ],
              ),
            ).px(20),
            25.heightBox,
            Text(
              "scn1".trParams({"cbtcb": '${AppConfig.appDataSet?.withdrawalLimit}'}),
              textAlign: TextAlign.center,
              style: subTextPoppins(context, fontSize: 12),
            ).px(20),
            10.heightBox,
            GestureDetector(
              onTap: () async {
                final double withdrawalLimit = AppConfig.appDataSet?.withdrawalLimit ?? 0.0;

                if (balance < withdrawalLimit) {
                  EasyLoading.showToast('sccer'.tr);
                  return;
                }
                EasyLoading.show();
                await Future.delayed(Duration(seconds: 3));

                final String? getSC = HiveService().getData<String>(AppConfig.superCoin);

                final double sc = double.tryParse(getSC ?? '0') ?? 0.0;
                final double scv = double.tryParse(AppConfig.superCoinValue) ?? 0.0;

                if (sc <= 0 || scv <= 0) {
                  EasyLoading.dismiss();

                  EasyLoading.showToast('isc'.tr);
                  return;
                }
                final double convertedValue = sc * scv;
                homeCtrl.btcBalance.value += convertedValue;
                EasyLoading.dismiss();
                EasyLoading.showToast('sccs'.tr);
              },
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  color: AppColor.primaryButton,
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 7),
                  child: Text(
                    'scuscb'.tr,
                    textAlign: TextAlign.center,
                    style: textMontserrat(
                      context,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: AppColor.text,
                    ),
                  ),
                ),
              ).pOnly(top: 20),
            ).px(20),
          ],
        ),
        bottomNavigationBar: SafeArea(child: NativeBanner(radius: 0,)),
      ),
    );
  }
}
