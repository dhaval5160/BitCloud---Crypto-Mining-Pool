import 'package:cloud_mining_farm/ad_modual/int_man/Interstitial.dart';
import 'package:cloud_mining_farm/ad_modual/banner/large_banner.dart';
import 'package:cloud_mining_farm/ad_modual/native/small_native.dart';
import 'package:cloud_mining_farm/modual/repository/adreward_time_rp.dart';
import 'package:cloud_mining_farm/modual/repository/daily_reward_2.dart';
import 'package:cloud_mining_farm/modual/repository/start_time_rp.dart';
import 'package:cloud_mining_farm/modual/service/api_service.dart';
import 'package:cloud_mining_farm/modual/service/auth_service.dart';
import 'package:cloud_mining_farm/theme/asset.dart';
import 'package:cloud_mining_farm/theme/colors.dart';
import 'package:cloud_mining_farm/theme/config.dart';
import 'package:cloud_mining_farm/theme/textstyles.dart';
import 'package:cloud_mining_farm/utils/app_navigation/app_navigation.dart';
import 'package:cloud_mining_farm/utils/app_navigation/navigation.dart';
import 'package:cloud_mining_farm/utils/hive_service.dart';
import 'package:cloud_mining_farm/utils/utils.dart';
import 'package:cloud_mining_farm/widget/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:velocity_x/velocity_x.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  String? userImage = "";

  @override
  void initState() {
    super.initState();
    userImage = HiveService().getData<String>(AppConfig.userImage);
  }

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
                child: Column(
                  children: [
                    Row(
                      children: [
                        2.widthBox,
                        FaIcon(FontAwesomeIcons.solidCircleUser, size: 22, color: AppColor.subText),
                        7.widthBox,
                        Text(
                          'ID #${AppConfig.userProfileId}',
                          style: textRoboto(context, fontSize: 15),
                        ),
                      ],
                    ),
                    12.heightBox,
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: AppColor.divider),
                      ),
                      child: Column(
                        children: [
                          9.heightBox,
                          appTopOption(
                            onTap: () {
                              InterstitialAdManager().showInterstitialByCount();
                              Navigation.pushNamed(Routes.recordPage);
                            },
                            name: 'sr'.tr,
                            image: AppAsset.record,
                          ),
                          Divider(color: AppColor.divider, height: 20),

                          appTopOption(
                            onTap: () {
                              InterstitialAdManager().showInterstitialByCount();
                              Navigation.pushNamed(Routes.activeSubPage);
                            },
                            image: AppAsset.subscription,
                            name: 'svas'.tr,
                          ),

                          if (homeCtrl.isPurchase.value == true) ...[
                            Divider(color: AppColor.divider, height: 20),

                            appTopOption(
                              onTap: () {
                                InterstitialAdManager().showInterstitialByCount();
                                Navigation.pushNamed(Routes.restoreSubPage);
                              },
                              name: 'srs'.tr,
                              image: AppAsset.restore,
                            ),
                          ],
                          Divider(color: AppColor.divider, height: 20),

                          appTopOption(
                            onTap: () => deleteAccount(),
                            image: AppAsset.trash,
                            name: 'sda'.tr,
                          ),
                          8.heightBox,
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SmallNative(
              padding: const EdgeInsets.symmetric(vertical: 15),
              sPadding: const EdgeInsets.symmetric(vertical: 7.5),
            ).px(15),
            HorizontalPadding(
              child: CardContainer(
                isPadding: true,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    appOption(
                      onTap: () {
                        InterstitialAdManager().showInterstitialByCount();
                        Navigation.pushNamed(Routes.profilePage);
                      },
                      image: AppAsset.profile,
                      name: 'sp'.tr,
                    ),
                    Divider(color: AppColor.divider),
                    appOption(
                      onTap: () {
                        InterstitialAdManager().showInterstitialByCount();
                        Navigation.pushNamed(Routes.rankingPage);
                      },
                      name: 'rkh'.tr,
                      image: AppAsset.leaderboards,
                    ),
                    Divider(color: AppColor.divider),

                    appOption(
                      onTap: () => supportUs(context),
                      name: 'sru'.tr,
                      image: AppAsset.star,
                    ),
                  ],
                ),
              ),
            ),
            15.heightBox,
            HorizontalPadding(
              child: CardContainer(
                isPadding: true,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    appOption(
                      onTap: () {
                        InterstitialAdManager().showInterstitialByCount();
                        Navigation.pushNamed(Routes.csPage);
                      },
                      image: AppAsset.customer,
                      name: 'scs'.tr,
                    ),

                    Divider(color: AppColor.divider),

                    appOption(
                      onTap: () {
                        InterstitialAdManager().showInterstitialByCount();
                        Navigation.pushNamed(Routes.languagePage, arg: {'page': 'setting'});
                      },
                      image: AppAsset.language,
                      name: 'sla'.tr,
                    ),
                    Divider(color: AppColor.divider),
                    appOption(onTap: () => shareApp(), image: AppAsset.share, name: 'sShare'.tr),
                  ],
                ),
              ),
            ),
            15.heightBox,
            HorizontalPadding(
              child: CardContainer(
                isPadding: true,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    appOption(
                      onTap: () {
                        InterstitialAdManager().showInterstitialByCount();
                        Navigation.pushNamed(Routes.privacyPolicyPage);
                      },
                      image: AppAsset.pp,
                      name: 'spp'.tr,
                    ),
                    Divider(color: AppColor.divider),

                    appOption(onTap: () => logOut(), image: AppAsset.logout, name: 'slo'.tr),
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

  appOption({String? image, String? name, double? scale, GestureTapCallback? onTap}) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: 12, left: 12),
        child: Row(
          children: [
            Container(
              height: 22,
              width: 22,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(image ?? ''),
                  colorFilter: ColorFilter.mode(AppColor.subText, BlendMode.srcIn),
                  fit: BoxFit.contain,
                ),
              ),
            ),

            10.widthBox,
            Text(name ?? "", style: textRoboto(context, fontSize: 15, color: AppColor.subText)),
            Spacer(),
            Image.asset(AppAsset.rightArrow, scale: 22, color: AppColor.subText),
          ],
        ),
      ),
    );
  }

  appTopOption({String? image, String? name, double? scale, GestureTapCallback? onTap}) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: 12, left: 7),
        child: Row(
          children: [
            // Image.asset(image ?? "", scale: 22),
            Container(
              height: 22,
              width: 22,
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage(image ?? ''), fit: BoxFit.contain),
              ),
            ),
            10.widthBox,
            Text(name ?? "", style: textRoboto(context, fontSize: 15)),
          ],
        ),
      ),
    );
  }

  Future<void> shareApp() async {
    final message =
        '''
⚡ Start mining BTC with ease
📊 Track your progress and earnings in real time
🚀 Boost your mining with smart tools

👇 Download the ${AppConfig.appName} app:
${AppConfig.appLink}
''';

    await SharePlus.instance.share(ShareParams(text: message));
  }

  deleteAccount() {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: 'deleteAccount',
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
                    25.heightBox,
                    Text(
                      'sadh'.tr,
                      textAlign: TextAlign.center,
                      style: textPoppins(context, fontSize: 16),
                    ).px(20),
                    7.heightBox,
                    Text(
                      'sads'.tr,
                      textAlign: TextAlign.center,
                      style: subTextPoppins(context, fontSize: 13),
                    ).px(20),
                    20.heightBox,
                    Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () async {
                              EasyLoading.show();

                              await ApiRepo.accountDelete(
                                email: HiveService().getData<String>(AppConfig.userEmail),
                              );
                              await AuthService().signOut();
                              StartTimeService().dispose();
                              DailyRewardServiceTwo().dispose();
                              AdRewardTimeService().dispose();
                              HiveService().saveData(AppConfig.isLogin, false);
                              HiveService().clearAllBoxes();

                              EasyLoading.dismiss();
                              EasyLoading.showToast("salcsd".tr, duration: Duration(seconds: 3));
                              Navigation.popAndPushNamed(Routes.signInPage);
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
                                  'sadby'.tr,
                                  style: textMontserrat(
                                    context,
                                    color: AppColor.text.withAlpha(250),
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        12.widthBox,
                        Expanded(
                          child: GestureDetector(
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
                                  'sadbn'.tr,
                                  style: textMontserrat(
                                    context,
                                    color: AppColor.text.withAlpha(250),
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
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

  logOut() {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: 'logOut',
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
                    25.heightBox,

                    Text(
                      'salh'.tr,
                      textAlign: TextAlign.center,
                      style: textPoppins(context, fontSize: 16),
                    ).px(20),

                    20.heightBox,
                    Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () async {
                              EasyLoading.show();
                              await AuthService().signOut();
                              StartTimeService().dispose();
                              DailyRewardServiceTwo().dispose();
                              AdRewardTimeService().dispose();
                              HiveService().saveData(AppConfig.isLogin, false);
                              HiveService().clearAllBoxes();
                              EasyLoading.dismiss();
                              Navigation.pop();
                              Navigation.popAndPushNamed(Routes.signInPage);
                              AppConfig.bottomBarValue.value = 0;
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
                                  'sallo'.tr,
                                  style: textMontserrat(
                                    context,
                                    color: AppColor.text.withAlpha(250),
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        12.widthBox,
                        Expanded(
                          child: GestureDetector(
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
                                  'salc'.tr,
                                  style: textMontserrat(
                                    context,
                                    color: AppColor.text.withAlpha(250),
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
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
