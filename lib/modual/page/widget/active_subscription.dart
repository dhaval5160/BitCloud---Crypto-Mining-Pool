import 'package:cloud_mining_farm/ad_modual/int_man/Interstitial.dart';
import 'package:cloud_mining_farm/ad_modual/native/native_banner.dart';
import 'package:cloud_mining_farm/modual/ctrl/home_ctrl.dart';
import 'package:cloud_mining_farm/theme/asset.dart';
import 'package:cloud_mining_farm/theme/colors.dart';
import 'package:cloud_mining_farm/theme/textstyles.dart';
import 'package:cloud_mining_farm/utils/app_navigation/navigation.dart';
import 'package:cloud_mining_farm/utils/utils.dart';
import 'package:cloud_mining_farm/widget/app_text.dart';
import 'package:cloud_mining_farm/widget/blinking_dot.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class ActiveSubscriptionPage extends StatefulWidget {
  const ActiveSubscriptionPage({super.key});

  @override
  State<ActiveSubscriptionPage> createState() => _ActiveSubscriptionPageState();
}

class _ActiveSubscriptionPageState extends State<ActiveSubscriptionPage> {
  final HomeCtrl homeCtrl = Get.find();

  @override
  void initState() {
    super.initState();
    homeCtrl.getActiveSubscription();
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
        appBar: buildCustomAppBar(context, title: 'ash'.tr),
        body: Obx(
          () => homeCtrl.userActiveSubList.isEmpty
              ? Center(child: NoData(text: 'amsc'.tr, isCenter: true))
              : GridView.builder(
                  padding: EdgeInsets.only(left: 12, right: 12, bottom: 20, top: 10),
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 0.8,
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemCount: homeCtrl.userActiveSubList.length,
                  itemBuilder: (context, index) {
                    final data = homeCtrl.userActiveSubList[index];
                    return CardContainer(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            data.plan ?? '',
                            style: textPoppins(context, fontWeight: FontWeight.w600),
                          ),
                          10.heightBox,
                          Center(
                            child: Container(
                              height: 80,
                              width: 100,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(getPlanImage(data.plan.toString())),
                                ),
                              ),
                            ),
                          ),
                          10.heightBox,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        '${data.power} ',
                                        style: textRoboto(
                                          context,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14,
                                        ),
                                      ),
                                      Text(
                                        '${data.powerType}',
                                        style: textRoboto(
                                          context,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),

                                  Flexible(
                                    child: Text(
                                      data.durationType ?? '',
                                      overflow: TextOverflow.ellipsis,
                                      style: subTextRoboto(context, fontSize: 13),
                                    ).pOnly(left: 10),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Purchase', style: subTextRoboto(context, fontSize: 13)),
                                  Text(
                                    convertPurchaseDate(data.addTime.toString()),
                                    style: subTextRoboto(context, fontSize: 13),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Validity', style: subTextRoboto(context, fontSize: 13)),
                                  Text(
                                    convertPurchaseDate(data.expireTime.toString()),
                                    style: subTextRoboto(
                                      context,
                                      fontSize: 13,
                                      color: Color(0xFFEF5350),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
        ),
        bottomNavigationBar: SafeArea(child: NativeBanner(radius: 0,)),
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
