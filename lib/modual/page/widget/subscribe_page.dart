import 'package:cloud_mining_farm/ad_modual/banner/large_banner.dart';
import 'package:cloud_mining_farm/ad_modual/int_man/Interstitial.dart';
import 'package:cloud_mining_farm/ad_modual/native/small_native.dart';
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
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class SubscribePage extends StatefulWidget {
  const SubscribePage({super.key});

  @override
  State<SubscribePage> createState() => _SubscribePageState();
}

class _SubscribePageState extends State<SubscribePage> {
  final HomeCtrl homeCtrl = Get.find();
  final subscriptionService = SubscriptionService();

  @override
  void initState() {
    super.initState();
    setData();
  }

  setData() async {
    try {
      EasyLoading.show();

      await Future.delayed(Duration(seconds: 1));

      homeCtrl.selectedPlan.value = 0;
      homeCtrl.selectedPlanDetails.value = homeCtrl.planDetailsList[0];

      for (var element in subscriptionService.products) {
        final match = homeCtrl.planDetailsList.firstWhereOrNull((plan) => plan.planId == element.id);
        if (match != null) {
          match.price = element.price;
        }
      }

      setState(() {});
      EasyLoading.dismiss();
    } catch (e) {
      EasyLoading.dismiss();
    }
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
        appBar: buildCustomAppBar(context, title: homeCtrl.planDetails.value.planName.toString()),
        body: SingleChildScrollView(
          child: Column(
            children: [
              15.heightBox,
              Container(
                height: 180,
                width: 180,
                decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage(getPlanImage(homeCtrl.planDetails.value.planName.toString()))),
                ),
              ),
              SmallNative(
                padding: const EdgeInsets.symmetric(vertical: 15),
                sPadding: const EdgeInsets.symmetric(vertical: 7.5),
              ).px(15),
              ListView.separated(
                shrinkWrap: true,
                padding: EdgeInsets.symmetric(horizontal: 15),
                physics: NeverScrollableScrollPhysics(),
                itemCount: homeCtrl.planDetailsList.length,
                itemBuilder: (context, index) {
                  final data = homeCtrl.planDetailsList[index];
                  return planInfo(
                    onTap: () {
                      homeCtrl.selectedPlan.value = index;
                      homeCtrl.selectedPlanDetails.value = data;
                    },
                    index: index,
                    context: context,
                    planTime: data.planTime,
                    price: data.price,
                    power: '${homeCtrl.planDetails.value.power} ${homeCtrl.planDetails.value.powerType}',
                    description: data.description,
                    rate: data.rate,
                    rateTax: data.rateTax,
                    discount: data.discount.toString(),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(height: 15);
                },
              ),
              20.heightBox,
              HorizontalPadding(
                child: CardContainer(
                  isPaddingZero: true,
                  child: Padding(
                    padding: const EdgeInsets.all(13),
                    child: Obx(() {
                      final plans = homeCtrl.selectedPlanDetails.value;

                      num discountedPrice = plans.amount ?? 0;
                      num discountPercent = plans.discount ?? 0;
                      num originalPrice = discountPercent > 0 ? discountedPrice / (1 - discountPercent / 100) : discountedPrice;

                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('spd'.tr, style: textRoboto(context, fontWeight: FontWeight.w600, fontSize: 16)),
                          Divider(height: 22, color: AppColor.divider),
                          planDetails(
                            key: 'sms'.tr,
                            value: "${homeCtrl.planDetails.value.power.toString()} ${homeCtrl.planDetails.value.powerType}",
                          ),
                          planDetails(key: 'sbms'.tr, value: '${homeCtrl.bonusSpeed.value.toStringAsFixed(2)} TH/s'),
                          planDetails(key: 'sv'.tr, value: plans.planTime.toString()),
                          planDetails(key: "smp".tr, value: homeCtrl.planDetails.value.miningPower.toString()),
                          planDetails(key: "smb".tr, value: homeCtrl.planDetails.value.miningBoost.toString()),

                          planDetails(key: "sam".tr, value: homeCtrl.planDetails.value.miner.toString()),
                          Divider(height: 22, color: AppColor.divider),
                          plans.discount != 0
                              ? Column(
                                  children: [
                                    planDetails(key: 'sssp'.tr, value: '₹${originalPrice.toStringAsFixed(2)}'),
                                    3.heightBox,
                                    planDetails(key: 'ssda'.tr, value: '${plans.discount}%'),
                                    3.heightBox,
                                  ],
                                )
                              : SizedBox.shrink(),
                          planDetails(key: 'ssfp'.tr, value: plans.price.toString()),
                        ],
                      );
                    }),
                  ),
                ),
              ),
              10.heightBox,
              Text('sspd'.tr, textAlign: TextAlign.center, style: subTextRoboto(context, fontSize: 12)).px(15),
              20.heightBox,
              LargeBannerS(),
              60.heightBox,
            ],
          ),
        ),
        bottomNavigationBar: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: SizedBox(
              height: 35,
              child: AppButton(
                textColor: AppColor.text,
                onTap: () async {
                  try {
                    EasyLoading.show();

                    final plan = homeCtrl.selectedPlanDetails.value;
                    double power = double.parse(homeCtrl.planDetails.value.power?.toStringAsFixed(2) ?? "45.55");
                    final bonusPower = power + homeCtrl.bonusSpeed.value;

                    final PurchaseResult result = await subscriptionService.buy(plan.planId.toString());

                    final addTimeFormatted = formatUtcMillisToLocal(
                      (result.transactionDate == null || result.transactionDate!.isEmpty)
                          ? DateTime.now().toUtc().millisecondsSinceEpoch.toString()
                          : result.transactionDate,
                    );

                    if (!result.success) {
                      await ApiRepo.getSubDetailsError(
                        email: HiveService().getData<String>(AppConfig.userEmail),
                        botType: homeCtrl.planDetails.value.planName,
                        type: 'Purchase Error',
                        plan: homeCtrl.planDetails.value.planName,
                        power: bonusPower.toStringAsFixed(2),
                        powerType: homeCtrl.planDetails.value.powerType.toString(),
                        durationType: plan.planTime,
                        durationSeconds: plan.durationSeconds.toString(),
                        addTime: addTimeFormatted,
                        token: result.token,
                        productID: plan.planId,
                        purchaseId: result.purchaseId,
                        originalJson: '',
                        purchaseStatus: result.status,
                      );

                      EasyLoading.dismiss();
                      EasyLoading.showToast("${result.message}");
                      return;
                    }

                    await ApiRepo.getSubDetails(
                      email: HiveService().getData<String>(AppConfig.userEmail),
                      botType: homeCtrl.planDetails.value.planName,
                      type: 'Paid',
                      plan: homeCtrl.planDetails.value.planName,
                      power: bonusPower.toStringAsFixed(2),
                      powerType: homeCtrl.planDetails.value.powerType.toString(),
                      durationType: plan.planTime,
                      durationSeconds: plan.durationSeconds.toString(),
                      addTime: addTimeFormatted,
                      token: result.token,
                      productID: plan.planId,
                      purchaseId: result.purchaseId,
                      originalJson: '',
                      purchaseStatus: result.status,
                    );

                    homeCtrl.activeHashRate.value += parseMiningPowerToGh(
                      "${bonusPower.toStringAsFixed(2)} ${homeCtrl.planDetails.value.powerType.toString()}",
                    );

                    EasyLoading.dismiss();

                    if (!context.mounted) return;

                    showSuccessDialog(
                      context,
                      massage: "sissm".trParams({
                        "hashrate": '${homeCtrl.planDetails.value.power} ${homeCtrl.planDetails.value.powerType}',
                        "day": plan.planTime.toString(),
                      }),
                      onTap: () {
                        Navigation.pop();
                        Navigation.pop();
                        InterstitialAdManager().showInterstitialByCount();
                      },
                    );
                  } catch (e) {
                    EasyLoading.dismiss();
                  }
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'ss'.tr,
                      style: textMontserrat(context, fontSize: 18, fontWeight: FontWeight.w600, color: AppColor.text),
                    ),
                    5.widthBox,
                    Obx(
                      () => Text(
                        homeCtrl.selectedPlanDetails.value.price.toString(),
                        style: textMontserrat(context, fontSize: 16, fontWeight: FontWeight.w600, color: AppColor.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  planDetails({required String key, required String value, TextStyle? style}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(key, style: subTextRoboto(context)),
        Text(value, style: style ?? textPoppins(context, fontWeight: FontWeight.w600)),
      ],
    );
  }

  Widget planInfo({
    required BuildContext context,
    required int index,
    String? planTime,
    String? price,
    String? power,
    String? description,
    String? rate,
    String? rateTax,
    String? discount,
    GestureTapCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Obx(
        () => Container(
          decoration: BoxDecoration(
            color: index == homeCtrl.selectedPlan.value ? Color(0xFF4A4852) : AppColor.card,
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.only(left: 3, right: 3, bottom: 3),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 7),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      planTime ?? '',
                      style: textRoboto(
                        context,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: index == homeCtrl.selectedPlan.value ? AppColor.text : AppColor.subText,
                      ),
                    ),
                    Text(
                      price ?? '',
                      style: textRoboto(
                        context,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: index == homeCtrl.selectedPlan.value ? AppColor.text : AppColor.subText,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(color: AppColor.background, borderRadius: BorderRadius.circular(8)),
                padding: const EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('hms'.tr, style: subTextRoboto(context)),
                        Text(power ?? "", style: textPoppins(context, fontWeight: FontWeight.w600)),
                      ],
                    ),
                    7.heightBox,
                    Text(description ?? '', style: subTextMontserrat(context, fontSize: 12)),
                    3.heightBox,
                    Row(
                      children: [
                        RatingBarIndicator(
                          rating: double.parse(rate ?? "4.9"),
                          itemCount: 5,
                          itemSize: 14,
                          unratedColor: Colors.black12,
                          itemPadding: const EdgeInsets.symmetric(horizontal: 1.5),
                          itemBuilder: (context, _) {
                            return Image.asset(AppAsset.star);
                          },
                        ),
                        5.widthBox,
                        Text('$rate', style: subTextMontserrat(context, fontSize: 12, fontWeight: FontWeight.w600)),
                        3.widthBox,
                        Text('· ', style: subTextMontserrat(context, fontSize: 12, fontWeight: FontWeight.w900)),
                        Text('$rateTax', style: subTextMontserrat(context, fontSize: 12)),
                      ],
                    ),
                    10.heightBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        discount != null && discount != "0"
                            ? Container(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(colors: [Color(0xffFF9800), Color(0xffF44336)]),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
                                child: Row(
                                  children: [
                                    Text(
                                      'sslo'.tr,
                                      style: textRoboto(context, fontSize: 12, fontWeight: FontWeight.w600, color: AppColor.text),
                                    ),
                                    Text(
                                      ': ',
                                      style: textRoboto(context, fontWeight: FontWeight.w600, color: AppColor.text),
                                    ),
                                    5.widthBox,
                                    Text(
                                      '$discount% OFF',
                                      style: textRoboto(context, fontSize: 12, fontWeight: FontWeight.w900, color: AppColor.text),
                                    ),
                                  ],
                                ),
                              )
                            : SizedBox.shrink(),

                        Obx(
                          () => RadioGroup<int>(
                            groupValue: homeCtrl.selectedPlan.value,
                            onChanged: (value) {
                              homeCtrl.selectedPlan.value = value!;
                            },
                            child: Radio<int>(
                              value: index,
                              fillColor: WidgetStateProperty.resolveWith<Color>((states) {
                                if (states.contains(WidgetState.selected)) {
                                  return AppColor.primaryButton;
                                }
                                return AppColor.subText.withAlpha(100);
                              }),
                              visualDensity: const VisualDensity(vertical: -4, horizontal: -4),
                              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String getPlanImage(String planName) {
    switch (planName) {
      case 'Home Plan':
        return AppAsset.one;
      case 'Basic Plan':
        return AppAsset.two;
      case 'Standard Plan':
        return AppAsset.three;
      case 'Advance Plan':
        return AppAsset.four;
      case 'Delux Plan':
        return AppAsset.five;
      default:
        return AppAsset.two;
    }
  }
}
