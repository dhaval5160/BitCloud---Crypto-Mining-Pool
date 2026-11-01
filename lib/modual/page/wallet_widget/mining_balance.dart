import 'package:cloud_mining_farm/ad_modual/banner/large_banner.dart';
import 'package:cloud_mining_farm/ad_modual/int_man/Interstitial.dart';
import 'package:cloud_mining_farm/ad_modual/native/small_native.dart';
import 'package:cloud_mining_farm/modual/ctrl/home_ctrl.dart';
import 'package:cloud_mining_farm/theme/asset.dart';
import 'package:cloud_mining_farm/theme/colors.dart';
import 'package:cloud_mining_farm/theme/config.dart';
import 'package:cloud_mining_farm/theme/textstyles.dart';
import 'package:cloud_mining_farm/utils/app_navigation/app_navigation.dart';
import 'package:cloud_mining_farm/utils/app_navigation/navigation.dart';
import 'package:cloud_mining_farm/utils/hive_service.dart';
import 'package:cloud_mining_farm/utils/utils.dart';
import 'package:cloud_mining_farm/widget/app_text.dart';
import 'package:cloud_mining_farm/widget/blinking_dot.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:velocity_x/velocity_x.dart';

class MiningBalance extends StatefulWidget {
  const MiningBalance({super.key});

  @override
  State<MiningBalance> createState() => _MiningBalanceState();
}

class _MiningBalanceState extends State<MiningBalance> {
  final HomeCtrl homeCtrl = Get.find();

  double balance = 0.0;
  late String formatted;
  late String formattedTotal;

  @override
  void initState() {
    super.initState();
    balance = homeCtrl.btcBalance.value + homeCtrl.inviteBtcBalance.value;
    double usdValue = homeCtrl.btcBalance.value * (AppConfig.appDataSet?.btcPriceInUSD ?? 0.0);
    double usdValueTotal = balance * (AppConfig.appDataSet?.btcPriceInUSD ?? 0.0);
    formatted = NumberFormat.currency(symbol: '\$', decimalDigits: 2).format(usdValue);
    formattedTotal = NumberFormat.currency(symbol: '\$', decimalDigits: 2).format(usdValueTotal);
  }

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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('wmh'.tr, style: textPoppins(context, fontWeight: FontWeight.w600)),

                      ValueListenableBuilder(
                        valueListenable: HiveService().getListenable(
                          keys: [AppConfig.lockMinedBTC],
                        ),
                        builder: (context, Box box, _) {
                          bool isLocked = box.get(AppConfig.lockMinedBTC, defaultValue: false);

                          return GestureDetector(
                            onTap: () {
                              InterstitialAdManager().showInterstitialByCount();
                              if (isLocked) {
                                Navigation.pushNamed(Routes.unlockPage);
                              } else {
                                Navigation.pushNamed(Routes.lockPage);
                              }
                            },
                            child: Image.asset(
                              isLocked ? AppAsset.lock : AppAsset.unLock,
                              scale: 26,
                              color: AppColor.text,
                            ),
                          );
                        },
                      ),

                      /*ValueListenableBuilder<bool>(
                        valueListenable: HiveService.lockNotifier,
                        builder: (context, isLocked, _) {
                          return GestureDetector(
                            onTap: () {
                              InterstitialAdManager().showInterstitialByCount();
                              Navigation.pushNamed(
                                isLocked ? Routes.unlockPage : Routes.lockPage,
                              );
                            },
                            child: Image.asset(
                              isLocked ? AppAsset.lock : AppAsset.unLock,
                              scale: 25,
                              color: AppColor.text,
                            ),
                          );
                        },
                      ),*/
                    ],
                  ),
                  13.heightBox,
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: AppColor.divider),
                    ),
                    child: Column(
                      children: [
                        15.heightBox,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(AppAsset.btcLogo, scale: 7),
                            7.widthBox,
                            Text(
                              homeCtrl.btcBalance.value.toStringAsFixed(12),
                              style: textMontserrat(
                                context,
                                fontSize: 22,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              ' BTC',
                              style: textMontserrat(
                                context,
                                fontSize: 22,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          formatted,
                          style: subTextPoppins(context, fontWeight: FontWeight.w600),
                        ),
                        15.heightBox,
                        Divider(color: AppColor.divider, height: 0),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('BTC/USD:', style: textRoboto(context, fontSize: 13)),
                              Text(
                                NumberFormat.currency(
                                  symbol: '\$',
                                  decimalDigits: 2,
                                ).format(AppConfig.appDataSet?.btcPriceInUSD ?? 0.0),
                                style: subTextRoboto(context, fontSize: 13),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  10.heightBox,
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: AppColor.divider),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('wmte'.tr, style: subTextRoboto(context, fontSize: 12)),
                          Row(
                            children: [
                              Text(
                                balance.toStringAsFixed(12),
                                style: textMontserrat(
                                  context,
                                  fontSize: 16,
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
                              Spacer(),
                              Text(
                                formattedTotal,
                                style: subTextPoppins(
                                  context,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),

                  if (isProfileComplete() == true) ...[
                    15.heightBox,
                    AppButton(
                      color: Color(0xFF3C6BC7),
                      onTap: () {
                        InterstitialAdManager().showInterstitialByCount();
                        if (HiveService().getData<bool>(AppConfig.lockMinedBTC) == true) {
                          Navigation.pushNamed(Routes.unlockPage);
                        } else {
                          Navigation.pushNamed(Routes.payoutPage);
                        }
                      },
                      text: 'wwb'.tr,
                    ),
                  ],
                  5.heightBox,
                ],
              ),
            ).px(15),
             15.heightBox,
            isProfileComplete() == false
                ? CardContainer(
                    isPaddingZero: true,
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Text(
                              'wmw'.tr,
                              style: textPoppins(context, fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                        Divider(color: AppColor.divider, height: 0),
                        15.heightBox,
                        Image.asset(AppAsset.setup, scale: 8),
                        10.heightBox,
                        HorizontalPadding(
                          child: Text(
                            'wmcyas'.tr,
                            textAlign: TextAlign.center,
                            style: textMontserrat(context, fontSize: 18),
                          ),
                        ),
                        5.heightBox,
                        HorizontalPadding(
                          child: Text(
                            'wmprdcw'.tr,
                            textAlign: TextAlign.center,
                            style: subTextRoboto(context, fontSize: 13),
                          ),
                        ),
                        15.heightBox,
                        HorizontalPadding(
                          child: AppButtonSmall(
                            padding: EdgeInsets.symmetric(vertical: 6),
                            onTap: () {
                              InterstitialAdManager().showInterstitialByCount();
                              Navigation.pushNamed(Routes.profilePage);
                            },
                            child: Text(
                              'wmbc'.tr,
                              style: textMontserrat(
                                context,
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                color: AppColor.white,
                              ),
                            ),
                          ),
                        ),
                        15.heightBox,
                      ],
                    ),
                  ).px(15)
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('wh'.tr, style: textPoppins(context, fontWeight: FontWeight.w600)),
                      Obx(
                        () => homeCtrl.withdrawDetailsList.isEmpty
                            ? Center(child: NoData(top: 50))
                            : ListView.separated(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                padding: EdgeInsets.symmetric(vertical: 10),
                                itemCount: homeCtrl.withdrawDetailsList.length,
                                itemBuilder: (context, index) {
                                  final data = homeCtrl.withdrawDetailsList[index];
                                  double usdValue =
                                      double.parse(data.dr ?? "") *
                                      (AppConfig.appDataSet?.btcPriceInUSD ?? 0.0);
                                  final formatted = NumberFormat.currency(
                                    symbol: '\$',
                                    decimalDigits: 4,
                                  ).format(usdValue);
                                  return CardContainer(
                                    child: Row(
                                      children: [
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              data.dr.toString(),
                                              style: textPoppins(context, fontSize: 12),
                                            ),
                                            Text(
                                              miningDateFormat(data.date ?? ""),
                                              style: textPoppins(context, fontSize: 12),
                                            ),
                                          ],
                                        ),
                                        Spacer(),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.end,
                                          children: [
                                            Text(
                                              formatted,
                                              style: textMontserrat(
                                                context,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            Text(
                                              data.status ?? '',
                                              style: textPoppins(
                                                context,
                                                fontSize: 12,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.red,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  );
                                },
                                separatorBuilder: (BuildContext context, int index) {
                                  return SizedBox(height: 10);
                                },
                              ),
                      ),
                    ],
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
