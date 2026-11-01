import 'package:cloud_mining_farm/ad_modual/banner/large_banner.dart';
import 'package:cloud_mining_farm/ad_modual/int_man/int_rwd_admanger.dart';
import 'package:cloud_mining_farm/ad_modual/native/small_native.dart';
import 'package:cloud_mining_farm/modual/ctrl/home_ctrl.dart';
import 'package:cloud_mining_farm/modual/ctrl/rcd_ctrl.dart';
import 'package:cloud_mining_farm/modual/model/active_bot_model.dart';
import 'package:cloud_mining_farm/modual/model/sub_details_model.dart';
import 'package:cloud_mining_farm/modual/repository/reward_timer_rp.dart';
import 'package:cloud_mining_farm/theme/asset.dart';
import 'package:cloud_mining_farm/theme/colors.dart';
import 'package:cloud_mining_farm/theme/config.dart';
import 'package:cloud_mining_farm/theme/textstyles.dart';
import 'package:cloud_mining_farm/utils/app_navigation/navigation.dart';
import 'package:cloud_mining_farm/utils/hive_service.dart';
import 'package:cloud_mining_farm/utils/responsiv.dart';
import 'package:cloud_mining_farm/utils/utils.dart';
import 'package:cloud_mining_farm/widget/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class RewardZonePage extends StatefulWidget {
  const RewardZonePage({super.key});

  @override
  State<RewardZonePage> createState() => _RewardZonePageState();
}

class _RewardZonePageState extends State<RewardZonePage> {
  final HomeCtrl homeCtrl = Get.find();
  final RewardCooldownController rewardCooldownCtrl = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      appBar: buildCustomAppBar(context, showFullAppBar: false),
      body: SingleChildScrollView(
        child: Column(
          children: [
            15.heightBox,
            HorizontalPadding(
              child: CardContainer(
                isPaddingZero: true,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('srz'.tr, style: textMontserrat(context, fontWeight: FontWeight.w600, fontSize: 15)),
                    15.heightBox,
                    Text('rzst'.tr, style: textRoboto(context, fontSize: 18).copyWith(height: 1.2)),
                    15.heightBox,
                    Text('rzst1'.tr, style: subTextRoboto(context, fontSize: 12)),
                    15.heightBox,
                    GestureDetector(
                      onTap: () {
                        showRZHWDialog(context);
                      },
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          border: Border.all(color: Color(0xffFF9F1C)),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 7),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FaIcon(FontAwesomeIcons.circleQuestion, color: Color(0xffFF9F1C), size: 14),
                              7.widthBox,
                              Text("rzhw".tr, style: textPoppins(context, fontSize: 14, color: Color(0xffFF9F1C))),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ).py(15).px(15),
              ),
            ),
            SmallNative(
              padding: const EdgeInsets.symmetric(vertical: 15),
              sPadding: const EdgeInsets.symmetric(vertical: 7.5),
            ).px(15),
            HorizontalPadding(
              child: CardContainer(
                isPaddingZero: true,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('rzar'.tr, style: subTextMontserrat(context, fontWeight: FontWeight.w600, fontSize: 14)).px(18).py(12),
                    Divider(color: AppColor.divider, height: 0),
                    ListView.separated(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.symmetric(vertical: 15),
                      itemCount: homeCtrl.rewardList.length,
                      itemBuilder: (context, index) {
                        final data = homeCtrl.rewardList[index];
                        final time = int.parse(data.time.toString()) / 60;
                        return Obx(() {
                          final isAvailable = rewardCooldownCtrl.isRewardAvailable(index);
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: context.responsive.widthPercent(50),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      data.rewardName.toString(),
                                      style: textMontserrat(
                                        context,
                                        color: AppColor.text,
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("rwt".tr, style: subTextRoboto(context, fontSize: 12, fontWeight: FontWeight.w600)),
                                        5.widthBox,
                                        Flexible(
                                          child: Text(
                                            data.task.toString(),
                                            overflow: TextOverflow.ellipsis,
                                            style: subTextMontserrat(context, fontSize: 12),
                                          ),
                                        ),
                                      ],
                                    ),
                                    isAvailable
                                        ? Row(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "rwr".tr,
                                                overflow: TextOverflow.ellipsis,
                                                style: subTextRoboto(context, fontSize: 12, fontWeight: FontWeight.w600),
                                              ),
                                              5.widthBox,
                                              Flexible(
                                                child: Text(
                                                  "${data.reward.toString()} ${data.rewardUnit.toString()}",
                                                  overflow: TextOverflow.ellipsis,
                                                  style: subTextMontserrat(context, fontSize: 12),
                                                ),
                                              ),
                                            ],
                                          )
                                        : Row(
                                            children: [
                                              FaIcon(FontAwesomeIcons.circleCheck, color: Color(0xffFF9F1C), size: 12),
                                              7.widthBox,
                                              Text(
                                                "rzrc".tr,
                                                overflow: TextOverflow.ellipsis,
                                                style: subTextRoboto(
                                                  context,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w600,
                                                  color: Color(0xffFF9F1C),
                                                ),
                                              ),
                                            ],
                                          ),
                                  ],
                                ),
                              ),
                              data.availble == true
                                  ? GestureDetector(
                                      onTap: isAvailable
                                          ? () {
                                              showWatchAdDialog(
                                                context,
                                                text: 'htrwd'.tr,
                                                subText: "hbrwd".trParams({"reward": ""}),
                                                subHeader: data.rewardType == "speed"
                                                    ? "${data.reward} ${data.rewardUnit} for ${time.toStringAsFixed(0)} minutes."
                                                    : "${data.reward} ${data.rewardUnit}",
                                                image: AppAsset.giftReward,
                                                onWatchAd: () {
                                                  handleBoostTap(data: data, index: index);
                                                },
                                              );
                                            }
                                          : null,
                                      child: Container(
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          border: Border.all(color: isAvailable ? const Color(0xFF16A34A) : Colors.grey),
                                          borderRadius: BorderRadius.circular(8),
                                        ),
                                        child: isAvailable
                                            ? Padding(
                                                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    FaIcon(FontAwesomeIcons.gift, color: Color(0xFF22C55E), size: 13),
                                                    7.widthBox,
                                                    Text(
                                                      "rwcb".tr,
                                                      style: textPoppins(context, fontSize: 13, color: Color(0xFF22C55E)),
                                                    ),
                                                  ],
                                                ),
                                              )
                                            : Padding(
                                                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    FaIcon(FontAwesomeIcons.circleCheck, color: AppColor.subText, size: 13),
                                                    7.widthBox,
                                                    Text(
                                                      "rzsb".tr,
                                                      style: textPoppins(context, fontSize: 13, color: AppColor.subText),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                      ),
                                    )
                                  : SizedBox.shrink(),
                            ],
                          ).px(10);
                        });
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return Divider(color: AppColor.divider, height: 25);
                      },
                    ),
                  ],
                ),
              ),
            ),
            20.heightBox,
            LargeBannerS(),
            60.heightBox,
          ],
        ),
      ),
    );
  }

  Future<void> handleBoostTap({ListReward? data, required int index}) async {
    EasyLoading.show(status: 'Loading ad...');

    await Future.delayed(Duration(seconds: 1));

    IntOrRwdAdManger().showIntORRwdAdOnPlanAd(
      onReward: () async {
        if (data?.rewardType == "speed") {
          RewardTimeService().start(
            seconds: data?.time ?? 0,
            bonusPower: double.parse(data?.reward ?? "11.5"),
            bonusType: data?.rewardUnit ?? "",
          );

          try {
            final activeMiner = ActiveBotModel(
              productID: '',
              botType: "${data?.rewardName} Reward",
              type: 'free',
              power: data?.reward ?? "11.5",
              powerType: data?.rewardUnit ?? "",
              durationType: 'fixed',
              durationSeconds: data?.time ?? 300,
              addTime: DateTime.now().millisecondsSinceEpoch,
              expireTime: data?.time ?? 300,
            );
            await HiveService().addToBox(activeMiner, boxName: 'cmf_activeBot_box');
          } catch (e) {
            debugPrint('$e');
          }
        } else if (data?.rewardType == "btc") {
          double rewardBTC = double.parse(data?.reward ?? "0");
          homeCtrl.miningBtcValue.value += rewardBTC;
        } else {
          final String storedSC = HiveService().getData<String>(AppConfig.superCoin) ?? "0";

          final String rewardSC = data?.reward ?? "0";

          final num getSC = num.parse(storedSC);
          final num reward = num.parse(rewardSC);

          final num totalSC = getSC + reward;

          HiveService().saveData(AppConfig.superCoin, totalSC.toString());
        }
        rewardCooldownCtrl.claimReward(index, data?.renewTime ?? 300);
      },
      onAdClosed: () {
        final time = (data?.time ?? 0) / 60;

        showRSDialog(
          context,
          massage: data?.rewardType == "speed"
              ? "${data?.reward} ${data?.rewardUnit} for ${time.toStringAsFixed(0)} minutes."
              : "${data?.reward} ${data?.rewardUnit}",
          onTap: () {
            Navigation.pop();
          },
        );
      },
    );

    EasyLoading.dismiss();
  }
}
