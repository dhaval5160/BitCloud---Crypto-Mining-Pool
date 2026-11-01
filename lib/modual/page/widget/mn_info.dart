import 'package:cloud_mining_farm/ad_modual/int_man/Interstitial.dart';
import 'package:cloud_mining_farm/theme/colors.dart';
import 'package:cloud_mining_farm/theme/textstyles.dart';
import 'package:cloud_mining_farm/utils/app_navigation/navigation.dart';
import 'package:cloud_mining_farm/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class MnInfoPage extends StatefulWidget {
  const MnInfoPage({super.key});

  @override
  State<MnInfoPage> createState() => _MnInfoPageState();
}

class _MnInfoPageState extends State<MnInfoPage> {
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
        appBar: AppBar(
          elevation: 0,
          iconTheme: IconThemeData(color: Theme.of(context).colorScheme.secondary),
          centerTitle: true,
          backgroundColor: AppColor.background,
          title: Text('Mining Unit Overview',
              style: textMontserrat(context, fontSize: 18, fontWeight: FontWeight.w600)),
        ),
        body: HorizontalPadding(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                20.heightBox,
                showInfo(
                  header: '',
                  subText: '',
                ),
                15.heightBox,
                showInfo(
                  header: '✅ Accepted Shares',
                  subText:
                      'These are valid results your miner has submitted. The more accepted shares you have, the more rewards you earn!',
                ),
                15.heightBox,
                showInfo(
                  header: '❌ Rejected Shares',
                  subText:
                      'These are results that were not accepted — usually due to internet delay or minor issues. Fewer rejected shares mean better performance.',
                ),
                15.heightBox,
                showInfo(
                  header: '📈 Efficiency',
                  subText:
                      'This shows how well your miner is performing. Higher efficiency = more accepted shares and better rewards.',
                ),
              ],
            ),
          ),
        ),
        // bottomNavigationBar: SafeArea(child: ShowBanner()),
      ),
    );
  }

  showInfo({String? header, String? subText}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(header ?? '', style: textMontserrat(context, fontSize: 16, fontWeight: FontWeight.w600)),
        3.heightBox,
        Text('--→ $subText', style: subTextPoppins(context, fontSize: 13)),
      ],
    );
  }
}
