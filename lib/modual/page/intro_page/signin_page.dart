import 'package:cloud_mining_farm/ad_modual/native/native_banner.dart';
import 'package:cloud_mining_farm/modual/ctrl/home_ctrl.dart';
import 'package:cloud_mining_farm/modual/model/user_model.dart';
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
import 'package:cloud_mining_farm/widget/custom_textfield.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController referralCodeCtrl = TextEditingController();
  final HomeCtrl homeCtrl = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Center(child: Image.asset(AppAsset.icLauncher, scale: 3)),
          18.heightBox,
          buildBitCloudText(context),
          50.heightBox,
          HorizontalPadding(
            child: CommonTextField(
              hintText: "snrh".tr,
              controller: referralCodeCtrl,
              textInputAction: TextInputAction.done,
              keyboardType: TextInputType.multiline,
              textCapitalization: TextCapitalization.characters,
            ),
          ),
          25.heightBox,
          HorizontalPadding(
            child: Row(
              children: [
                Expanded(child: Container(height: 1, color: AppColor.muteText)),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Text('snlw'.tr, style: textRoboto(context)),
                ),
                Expanded(child: Container(height: 1, color: AppColor.muteText)),
              ],
            ),
          ),
          25.heightBox,
          HorizontalPadding(
            child: AppButton(
              onTap: () => handleSingInTap(),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FaIcon(FontAwesomeIcons.google, size: 20, color: AppColor.primaryText),
                    15.widthBox,
                    Text(
                      'sncwg'.tr,
                      style: textMontserrat(context, fontSize: 16, fontWeight: FontWeight.w600, color: AppColor.primaryText),
                    ),
                  ],
                ),
              ),
            ),
          ),
          50.heightBox,
          HorizontalPadding(
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'sntu'.tr,
                    style: TextStyle(
                      fontSize: 13,
                      decoration: TextDecoration.underline,
                      color: Color(0xFF4DA6FF),
                      fontFamily: AppConfig.montserrat,
                      fontWeight: FontWeight.w600,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigation.pushNamed(Routes.privacyPolicyPage);
                      },
                  ),
                  TextSpan(
                    text: ' | ',
                    style: subTextRoboto(context, color: AppColor.subText.withAlpha(150), fontSize: 16),
                  ),
                  TextSpan(
                    text: 'snpp'.tr,
                    style: TextStyle(
                      fontSize: 13,
                      decoration: TextDecoration.underline,
                      color: Color(0xFF4DA6FF),
                      fontFamily: AppConfig.montserrat,
                      fontWeight: FontWeight.w600,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigation.pushNamed(Routes.privacyPolicyPage);
                      },
                  ),
                ],
              ),
            ),
          ),
          7.heightBox,
          HorizontalPadding(
            child: Text('snwgs'.tr, textAlign: TextAlign.center, style: subTextRoboto(context, fontSize: 12)),
          ),
        ],
      ),
      bottomNavigationBar: SafeArea(child: NativeBanner(radius: 0)),
    );
  }

  handleSingInTap() async {
    try {
      FocusScope.of(context).unfocus();
      EasyLoading.show();

      final userCredential = await AuthService().signInWithGoogle();

      if (userCredential == null || userCredential.user == null) {
        EasyLoading.dismiss();
        return;
      }
      final user = userCredential.user;
      final String email = user?.email ?? '';
      final String referralCode = referralCodeCtrl.text.trim();

      if (email.isEmpty) {
        EasyLoading.dismiss();
        return;
      }
      homeCtrl.userActiveSubList.clear();
      final UserProfileModel userProfileModel = await ApiRepo.userLogin(email: email, reference: referralCode, firstTime: '');

      // homeCtrl.activeHashRate.value = AppConfig.endpoint?.startHashRate ?? 7.5;
      homeCtrl.btcBalance.value = double.parse(userProfileModel.totalBtcDirect.toString());
      homeCtrl.miningBtcValue.value = double.parse(userProfileModel.totalBtcDirect.toString());
      homeCtrl.inviteBtcBalance.value = double.parse(userProfileModel.totalBtcRefrence.toString());
      homeCtrl.userActiveSubList.addAll(userProfileModel.subscription ?? []);

      AppConfig.mingTimer = userProfileModel.mingTimer ?? 300;
      AppConfig.factorFast = userProfileModel.factorFast ?? 0.000000000001;
      AppConfig.factorRegular = userProfileModel.factorRegular ?? 0.0000000000005;
      AppConfig.factorMedium = userProfileModel.factorMedium ?? 0.0000000000002;
      AppConfig.factorSlow = userProfileModel.factorSlow ?? 0.00000000000005;
      AppConfig.factorUltraSlow = userProfileModel.factorUltraSlow ?? 0.000000000000005;
      AppConfig.miningIntervals = userProfileModel.miningIntervals ?? 60;
      AppConfig.userProfileId = userProfileModel.profileId ?? "";
      AppConfig.referralCode = userProfileModel.profileRefrenceCode ?? "";

      HiveService().saveData(AppConfig.userEmail, email);
      HiveService().saveData(AppConfig.userName, user?.displayName);
      HiveService().saveData(AppConfig.userImage, user?.photoURL ?? "");
      HiveService().saveData(AppConfig.userMobile, userProfileModel.mobile ?? "");
      HiveService().saveData(AppConfig.userBtcAddress, userProfileModel.btcAddress ?? "");
      HiveService().saveData(AppConfig.isLogin, true);
      EasyLoading.dismiss();
      Navigation.pushNamed(Routes.signInRewardPage);
    } catch (e) {
      debugPrint('$e');
    }
  }

  Widget buildBitCloudText(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'Bit',
                  style: textMontserrat(context, fontSize: 24, fontWeight: FontWeight.w900, color: AppColor.text),
                ),
                TextSpan(
                  text: 'Cloud',
                  style: textMontserrat(context, fontSize: 24, fontWeight: FontWeight.w900, color: AppColor.primaryButton),
                ),
              ],
            ),
          ),

          const SizedBox(height: 5),

          Text(
            'SIGN IN TO YOUR MINING ACCOUNT',
            textAlign: TextAlign.center,
            style: textMontserrat(
              context,
              fontSize: 11.5,
              fontWeight: FontWeight.w700,
              color: AppColor.subText,
            ),
          ),
        ],
      ),
    );
  }

}
