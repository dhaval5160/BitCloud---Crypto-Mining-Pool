import 'package:cloud_mining_farm/ad_modual/banner/banner.dart';
import 'package:cloud_mining_farm/ad_modual/int_man/Interstitial.dart';
import 'package:cloud_mining_farm/ad_modual/native/native_banner.dart';
import 'package:cloud_mining_farm/modual/ctrl/home_ctrl.dart';
import 'package:cloud_mining_farm/modual/service/api_service.dart';
import 'package:cloud_mining_farm/modual/service/subscription_service.dart';
import 'package:cloud_mining_farm/theme/asset.dart';
import 'package:cloud_mining_farm/theme/colors.dart';
import 'package:cloud_mining_farm/theme/config.dart';
import 'package:cloud_mining_farm/theme/textstyles.dart';
import 'package:cloud_mining_farm/utils/app_navigation/navigation.dart';
import 'package:cloud_mining_farm/utils/hive_service.dart';
import 'package:cloud_mining_farm/utils/utils.dart';
import 'package:cloud_mining_farm/widget/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class RestoreSubPage extends StatefulWidget {
  const RestoreSubPage({super.key});

  @override
  State<RestoreSubPage> createState() => _RestoreSubPageState();
}

class _RestoreSubPageState extends State<RestoreSubPage> {
  final HomeCtrl homeCtrl = Get.find();

  final subscriptionService = SubscriptionService();

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
        appBar: buildCustomAppBar(context, title: 'srs'.tr),
        body: Column(
          children: [
            10.heightBox,
            Image.asset(AppAsset.restoreSub, height: 180),
            ShowBanner(padding: EdgeInsets.only(top: 10, bottom: 18), nPadding: EdgeInsets.symmetric(vertical: 15)),
            HorizontalPadding(child: Text("srt".tr, style: subTextRoboto(context, fontSize: 13))),
            10.heightBox,
            HorizontalPadding(child: Text("srwt".tr, style: subTextRoboto(context, fontSize: 13))),
            25.heightBox,

            HorizontalPadding(
              child: AppButtonSmall(
                padding: EdgeInsets.symmetric(vertical: 5),
                onTap: () {
                  restoreSubscription();
                },
                child: Text(
                  'rsb'.tr,
                  style: textMontserrat(context, fontWeight: FontWeight.w600, fontSize: 18, color: AppColor.white),
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: SafeArea(child: NativeBanner(radius: 0)),
      ),
    );
  }

  restoreSubscription() async {
    try {
      EasyLoading.show();

      await Future.delayed(Duration(seconds: 2));

      await subscriptionService.restorePurchases();

      final restoredPurchases = subscriptionService.activeSubscriptions.value;

      if (restoredPurchases.isEmpty) {
        EasyLoading.dismiss();
        if (!mounted) return;
        showSuccessDialog(
          context,
          isEmpty: true,
          massage: 'snasfua'.tr,
          onTap: () {
            Navigation.pop();
            InterstitialAdManager().showInterstitialAds();
          },
        );
        return;
      }

      final email = HiveService().getData<String>(AppConfig.userEmail);
      await ApiRepo.userLogin(email: email, reference: '', firstTime: 'yes');

      homeCtrl.activeHashRate.value = AppConfig.appDataSet?.startHashRate ?? 5.3;

      for (var result in restoredPurchases) {
        for (var element in homeCtrl.subscriptionPlanList) {
          for (var plansElement in element.plans ?? []) {
            if (plansElement.planId == result.productID) {
              await ApiRepo.getSubDetails(
                email: email,
                botType: element.planName,
                type: 'Paid',
                plan: element.planName,
                power: element.power.toString(),
                powerType: element.powerType,
                durationType: plansElement.planTime,
                durationSeconds: plansElement.durationSeconds.toString(),
                addTime: formatUtcMillisToLocal(result.transactionDate),
                token: result.verificationData.serverVerificationData,
                productID: result.productID,
                purchaseId: result.purchaseID,
                originalJson: result.verificationData.localVerificationData,
                purchaseStatus: result.status.name,
              );

              homeCtrl.activeHashRate.value += parseMiningPowerToGh("${element.power} ${element.powerType}");
            }
          }
        }
      }

      EasyLoading.dismiss();
      if (!mounted) return;
      showSuccessDialog(
        context,
        isEmpty: false,
        massage: 'srsm'.tr,
        onTap: () {
          Navigation.pop();
          InterstitialAdManager().showInterstitialAds();
        },
      );
    } catch (e) {
      EasyLoading.dismiss();
      debugPrint('$e');
    }
  }
}
