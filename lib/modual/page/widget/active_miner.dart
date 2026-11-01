import 'package:cloud_mining_farm/ad_modual/int_man/Interstitial.dart';
import 'package:cloud_mining_farm/ad_modual/native/small_native.dart';
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

class ActiveMinerPage extends StatefulWidget {
  const ActiveMinerPage({super.key});

  @override
  State<ActiveMinerPage> createState() => _ActiveMinerPageState();
}

class _ActiveMinerPageState extends State<ActiveMinerPage> {
  final HomeCtrl homeCtrl = Get.find();

  @override
  void initState() {
    super.initState();
    homeCtrl.getActiveMiner();
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
        appBar: buildCustomAppBar(context, title: 'amh'.tr),
        body: Obx(
          () => homeCtrl.activeBotList.isEmpty
              ? Center(child: NoData(text: 'amyc'.tr, isCenter: true))
              : GridView.builder(
                  padding: EdgeInsets.only(left: 13, right: 13, bottom: 20, top: 13),
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 0.95,
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemCount: homeCtrl.activeBotList.length,
                  itemBuilder: (context, index) {
                    final data = homeCtrl.activeBotList[index];
                    return CardContainer(
                      isPaddingZero: true,
                      child: Stack(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 7, left: 10),
                                child: Text(data.botType.toString(), style: textRoboto(context)),
                              ),
                              Center(
                                child: Image.asset(
                                  getBotTypeImage(data.botType),
                                  scale: getBotTypeScale(data.botType),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(10),
                                    bottomLeft: Radius.circular(10),
                                  ),
                                  color: AppColor.secondaryButton,
                                  // color: Colors.black12
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 6),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        '${data.power} ${data.powerType}',
                                        style: textRoboto(
                                          context,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 15,
                                          color: AppColor.white,
                                        ),
                                      ),
                                      data.type == 'free'
                                          ? StreamBuilder<Duration>(
                                              stream: Stream.periodic(const Duration(seconds: 1), (
                                                _,
                                              ) {
                                                final endTime = DateTime.fromMillisecondsSinceEpoch(
                                                  data.addTime,
                                                ).add(Duration(seconds: data.durationSeconds));
                                                final remaining = endTime.difference(DateTime.now());
                                                return remaining.isNegative
                                                    ? Duration.zero
                                                    : remaining;
                                              }),
                                              builder: (context, snapshot) {
                                                final remaining = snapshot.data ?? Duration.zero;
                                                return Text(
                                                  formatDuration(remaining),
                                                  style: textRoboto(
                                                    context,
                                                    color: AppColor.white.withAlpha(230),
                                                  ),
                                                );
                                              },
                                            )
                                          : Text(
                                              '${data.days} Days',
                                              style: textRoboto(
                                                context,
                                                color: AppColor.white.withAlpha(230),
                                              ),
                                            ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 7, right: 7),
                              child: Image.asset(
                                getTypeImage(data.type),
                                scale: getTypeScale(data.type),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
        ),
        bottomNavigationBar: SafeArea(child: SmallNative()),
      ),
    );
  }

  String getTypeImage(String planName) {
    switch (planName) {
      case 'free':
        return AppAsset.free;
      case 'Paid':
        return AppAsset.paid;
      default:
        return AppAsset.free;
    }
  }

  String getBotTypeImage(String planName) {
    switch (planName) {
      case 'Start Reward':
        return AppAsset.stating;
      case 'Daily Reward':
      case 'Ad Bonus':
        return AppAsset.ads;
      default:
        return AppAsset.paid1;
    }
  }

  double getBotTypeScale(String botType) {
    switch (botType) {
      case 'Start Reward':
      case 'Daily Reward':
      case 'Ad Bonus':
        return 5.0;
      default:
        return 7.0;
    }
  }

  double getTypeScale(String botType) {
    switch (botType) {
      case 'free':
        return 22.0;
      case 'Paid':
        return 20.0;
      default:
        return 20.0;
    }
  }
}
