import 'package:cloud_mining_farm/ad_modual/int_man/Interstitial.dart';
import 'package:cloud_mining_farm/ad_modual/native/native_banner.dart';
import 'package:cloud_mining_farm/modual/ctrl/home_ctrl.dart';
import 'package:cloud_mining_farm/modual/model/addwd_model.dart';
import 'package:cloud_mining_farm/modual/service/api_service.dart';
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
import 'package:lottie/lottie.dart';
import 'package:velocity_x/velocity_x.dart';

class PayoutPage extends StatefulWidget {
  const PayoutPage({super.key});

  @override
  State<PayoutPage> createState() => _PayoutPageState();
}

class _PayoutPageState extends State<PayoutPage> {
  final HomeCtrl homeCtrl = Get.find();
  double balance = 0.0;
  String btcWalletID = '';

  @override
  void initState() {
    balance = homeCtrl.btcBalance.value + homeCtrl.inviteBtcBalance.value;
    btcWalletID = HiveService().getData<String>(AppConfig.userBtcAddress) ?? '';
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
        appBar: buildCustomAppBar(context, title: 'wwc'.tr),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              20.heightBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(AppAsset.btcLogo, scale: 7),
                  10.widthBox,
                  Text(
                    balance.toStringAsFixed(12),
                    style: textMontserrat(context, fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              20.heightBox,
              pvaCard(text: btcWalletID, context: context),
              10.heightBox,
              pvaCard(text: balance.toStringAsFixed(12), context: context),
              2.heightBox,
              HorizontalPadding(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text('pomw'.tr, style: subTextRoboto(context, fontSize: 10)),
                    Text(
                      '${AppConfig.appDataSet?.withdrawalLimit} BTC',
                      style: subTextRoboto(context, fontSize: 10),
                    ),
                  ],
                ),
              ),
              15.heightBox,
              HorizontalPadding(
                child: AppButton(
                  onTap: () async {
                    if (isProfileComplete()) {
                      double withdrawalLimit = AppConfig.appDataSet?.withdrawalLimit ?? 0.0;
                      if (balance >= withdrawalLimit) {
                        AddWDModel addWDModel = await ApiRepo.addWithdrawDetails(
                          email: HiveService().getData<String>(AppConfig.userEmail),
                          btc: balance.toStringAsFixed(12),
                        );
                        if (addWDModel.statusCode == '200') {
                          withdrawDialog();
                          homeCtrl.btcBalance.value = 0.000000000000;
                          homeCtrl.miningBtcValue.value = 0.000000000000;
                          homeCtrl.inviteBtcBalance.value = 0.000000000000;
                          HiveService().deleteData(AppConfig.btcBalance);
                        } else {
                          withdrawErrorDialog(massage: addWDModel.blanace?.toStringAsFixed(12));
                        }
                      } else {
                        EasyLoading.showToast(
                          'prbw'.trParams({"rbtc": "${AppConfig.appDataSet?.withdrawalLimit}"}),
                        );
                      }
                    } else {
                      EasyLoading.showToast('poe1'.tr);
                      Navigation.pop();
                    }
                  },
                  text: 'wwb'.tr,
                ),
              ),
              15.heightBox,
              HorizontalPadding(
                child: Text(
                  'pop'.tr,
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    decorationColor: AppColor.divider,
                    color: AppColor.secondaryText,
                    fontFamily: AppConfig.poppins,
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
                ),
              ),
              10.heightBox,
              HorizontalPadding(child: Text('pod1'.tr, style: subTextRoboto(context, fontSize: 12))),
              HorizontalPadding(child: Text('pod2'.tr, style: subTextRoboto(context, fontSize: 12))),
              HorizontalPadding(child: Text('pod3'.tr, style: subTextRoboto(context, fontSize: 12))),
            ],
          ),
        ),
        bottomNavigationBar: SafeArea(child: NativeBanner(radius: 0,)),
      ),
    );
  }

  Widget pvaCard({required BuildContext context, String? text}) {
    return HorizontalPadding(
      child: Container(
        height: 40,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: AppColor.card),
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
        child: Text(
          text ?? '',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: (text?.isEmpty ?? true) ? subTextPoppins(context) : textPoppins(context),
        ),
      ),
    );
  }

  void withdrawDialog() {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: 'withdrawDialog',
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
                decoration: BoxDecoration(
                  color: AppColor.card,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Lottie.asset(
                      AppAsset.done,
                      width: 150,
                      height: 150,
                      fit: BoxFit.fill,
                      repeat: true,
                    ),
                    Text(
                      "pows".tr,
                      textAlign: TextAlign.center,
                      style: textPoppins(context),
                    ).px(20),
                    20.heightBox,
                    GestureDetector(
                      onTap: () {
                        InterstitialAdManager().showInterstitialByCount();
                        Navigation.pop();
                        homeCtrl.getWithdrawDetails();
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
                            'pook'.tr,
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
                    25.heightBox,
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void withdrawErrorDialog({String? massage}) {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: 'withdrawErrorDialog',
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
                decoration: BoxDecoration(
                  color: AppColor.card,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Lottie.asset(AppAsset.error404, height: 150, fit: BoxFit.fill, repeat: true),
                    10.heightBox,
                    Text(
                      '⚠ BTC amount doesn’t match!',
                      textAlign: TextAlign.center,
                      style: textPoppins(context, fontSize: 15),
                    ),
                    7.heightBox,
                    Text(
                      'Expected: $massage',
                      textAlign: TextAlign.center,
                      style: textMontserrat(context),
                    ),
                    Text(
                      'Received: ${balance.toStringAsFixed(12)}',
                      textAlign: TextAlign.center,
                      style: textMontserrat(context),
                    ),
                    20.heightBox,
                    GestureDetector(
                      onTap: () {
                        Navigation.pop();
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
                            'pook'.tr,
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
                    25.heightBox,
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
