import 'package:cloud_mining_farm/ad_modual/int_man/Interstitial.dart';
import 'package:cloud_mining_farm/modual/ctrl/home_ctrl.dart';
import 'package:cloud_mining_farm/modual/page/wallet_widget/mining_balance.dart';
import 'package:cloud_mining_farm/modual/page/wallet_widget/referral_balance.dart';
import 'package:cloud_mining_farm/theme/colors.dart';
import 'package:cloud_mining_farm/theme/textstyles.dart';
import 'package:cloud_mining_farm/utils/utils.dart';
import 'package:cloud_mining_farm/widget/app_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class WalletPage extends StatefulWidget {
  const WalletPage({super.key});

  @override
  State<WalletPage> createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {
  final HomeCtrl homeCtrl = Get.find();
  final walletPages = [MiningBalance(), ReferralBalance()];
  final PageController pageController = PageController();

  @override
  void initState() {
    super.initState();
    homeCtrl.walletTabIndex.value = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      appBar: buildCustomAppBar(context, showFullAppBar: false),
      body: Column(
        children: [
          15.heightBox,
          HorizontalPadding(
            child: Obx(
              () => Row(
                children: [
                  Expanded(
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.horizontal(left: Radius.circular(10)),
                        color: homeCtrl.walletTabIndex.value == 0 ? AppColor.primaryButton : AppColor.divider.withAlpha(50),
                        border: getButtonBorder(isSelected: homeCtrl.walletTabIndex.value == 0, isLeft: true, context: context),
                      ),
                      child: AppButtonSmall(
                        padding: EdgeInsets.symmetric(vertical: 6),
                        borderRadius: BorderRadius.horizontal(left: Radius.circular(8)),
                        color: Colors.transparent,
                        onTap: () {
                          homeCtrl.walletTabIndex.value = 0;
                          pageController.jumpToPage(0);
                        },
                        child: Text(
                          'wm'.tr,
                          style: textMontserrat(
                            context,
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                            color: homeCtrl.walletTabIndex.value == 0 ? AppColor.text : AppColor.subText,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.horizontal(right: Radius.circular(10)),
                        color: homeCtrl.walletTabIndex.value == 1 ? AppColor.primaryButton : AppColor.divider.withAlpha(50),
                        border: getButtonBorder(isSelected: homeCtrl.walletTabIndex.value == 1, isLeft: false, context: context),
                      ),
                      child: AppButtonSmall(
                        padding: EdgeInsets.symmetric(vertical: 6),
                        borderRadius: BorderRadius.horizontal(right: Radius.circular(8)),
                        color: Colors.transparent,
                        onTap: () {
                          homeCtrl.walletTabIndex.value = 1;
                          pageController.jumpToPage(1);
                        },
                        child: Text(
                          'wr'.tr,
                          style: textMontserrat(
                            context,
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                            color: homeCtrl.walletTabIndex.value == 1 ? AppColor.text : AppColor.subText,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          15.heightBox,
          Expanded(
            child: PageView.builder(
              controller: pageController,
              itemCount: walletPages.length,
              onPageChanged: (index) {
                homeCtrl.walletTabIndex.value = index;
                InterstitialAdManager().showInterstitialByCount();
              },
              itemBuilder: (context, index) {
                return walletPages[index];
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  Border getButtonBorder({required bool isSelected, bool isLeft = false, required BuildContext context}) {
    final color = isSelected ? AppColor.primaryButton : AppColor.divider.withAlpha(50);
    return Border(
      top: BorderSide(color: color, width: 1),
      bottom: BorderSide(color: color, width: 1),
      left: isLeft ? BorderSide(color: color, width: 1) : BorderSide.none,
      right: !isLeft ? BorderSide(color: color, width: 1) : BorderSide.none,
    );
  }
}
