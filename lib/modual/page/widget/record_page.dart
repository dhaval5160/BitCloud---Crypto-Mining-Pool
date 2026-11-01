import 'package:cloud_mining_farm/ad_modual/banner/banner.dart';
import 'package:cloud_mining_farm/ad_modual/int_man/Interstitial.dart';
import 'package:cloud_mining_farm/ad_modual/native/native_banner.dart';
import 'package:cloud_mining_farm/modual/model/mining_record.dart';
import 'package:cloud_mining_farm/modual/service/api_service.dart';
import 'package:cloud_mining_farm/theme/asset.dart';
import 'package:cloud_mining_farm/theme/colors.dart';
import 'package:cloud_mining_farm/theme/config.dart';
import 'package:cloud_mining_farm/theme/textstyles.dart';
import 'package:cloud_mining_farm/utils/app_navigation/navigation.dart';
import 'package:cloud_mining_farm/utils/hive_service.dart';
import 'package:cloud_mining_farm/utils/utils.dart';
import 'package:cloud_mining_farm/widget/app_text.dart';
import 'package:cloud_mining_farm/widget/blinking_dot.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:velocity_x/velocity_x.dart';

class RecordPage extends StatefulWidget {
  const RecordPage({super.key});

  @override
  State<RecordPage> createState() => _RecordPageState();
}

class _RecordPageState extends State<RecordPage> {
  MiningRecordModel? miningRecordModel;

  @override
  void initState() {
    super.initState();
    getTimeLineData();
  }

  Future<void> getTimeLineData() async {
    miningRecordModel = await ApiRepo.viewBtc(email: HiveService().getData<String>(AppConfig.userEmail));
    setState(() {});
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
        appBar: buildCustomAppBar(context, title: 'rh'.tr),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            15.heightBox,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Image.asset(AppAsset.btcLogo, scale: 7),
                    10.widthBox,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('rmb'.tr, textAlign: TextAlign.center, style: subTextPoppins(context, fontSize: 13)),
                        Text(
                          miningRecordModel?.totalBtcDirect ?? '',
                          style: textMontserrat(context, fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ],
                ),
                10.heightBox,
                Row(
                  children: [
                    Image.asset(AppAsset.btcLogo, scale: 7),
                    10.widthBox,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('rrb'.tr, textAlign: TextAlign.center, style: subTextPoppins(context, fontSize: 13)),
                        Text(
                          miningRecordModel?.totalBtcRefrence ?? '',
                          style: textMontserrat(context, fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ).px(15),
            ShowBanner(padding: EdgeInsets.only(top: 10, bottom: 10), nPadding: EdgeInsets.symmetric(vertical: 7.5)),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text('wh'.tr, style: textPoppins(context)),
            ),
            10.heightBox,
            miningRecordModel?.data?.isEmpty ?? false
                ? Center(child: NoData(top: 100, text: 'smrht'.tr))
                : Flexible(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15, right: 15, bottom: 20),
                      child: CardContainer(
                        child: ListView.separated(
                          shrinkWrap: true,
                          itemCount: miningRecordModel?.data?.length ?? 0,
                          itemBuilder: (context, index) {
                            final data = miningRecordModel?.data?[index];
                            double usdValue = double.parse(data?.cr ?? "") * (AppConfig.appDataSet?.btcPriceInUSD ?? 0.0);
                            final formatted = NumberFormat.currency(symbol: '\$', decimalDigits: 4).format(usdValue);
                            return Padding(
                              padding: EdgeInsets.symmetric(horizontal: 7, vertical: 6),
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    backgroundColor: AppColor.divider,
                                    radius: 16,
                                    child: Text(
                                      data?.type == "direct" ? "M" : 'R',
                                      style: textMontserrat(context, fontWeight: FontWeight.w600, fontSize: 16),
                                    ),
                                  ),
                                  10.widthBox,
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(data?.cr.toString() ?? "", style: textPoppins(context, fontSize: 13)),
                                      Text(miningDateFormat(data?.date ?? ""), style: subTextRoboto(context, fontSize: 13)),
                                    ],
                                  ),
                                  Spacer(),
                                  Text(
                                    formatted,
                                    style: TextStyle(color: AppColor.gold, fontSize: 15, fontWeight: FontWeight.w600),
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
                    ),
                  ),
          ],
        ),
        bottomNavigationBar: SafeArea(child: NativeBanner(radius: 0)),
      ),
    );
  }
}
