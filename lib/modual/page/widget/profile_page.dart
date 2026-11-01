import 'package:cloud_mining_farm/ad_modual/int_man/Interstitial.dart';
import 'package:cloud_mining_farm/ad_modual/native/native_banner.dart';
import 'package:cloud_mining_farm/modual/model/update_profile_model.dart';
import 'package:cloud_mining_farm/modual/service/api_service.dart';
import 'package:cloud_mining_farm/theme/colors.dart';
import 'package:cloud_mining_farm/theme/config.dart';
import 'package:cloud_mining_farm/theme/textstyles.dart';
import 'package:cloud_mining_farm/utils/app_navigation/navigation.dart';
import 'package:cloud_mining_farm/utils/hive_service.dart';
import 'package:cloud_mining_farm/utils/utils.dart';
import 'package:cloud_mining_farm/widget/app_text.dart';
import 'package:cloud_mining_farm/widget/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final formKey = GlobalKey<FormState>();

  late TextEditingController nameCtrl;
  late TextEditingController emailCtrl;
  late TextEditingController phoneNumberCtrl;
  late TextEditingController btcWalletIDCtrl;

  String? userProfile = '';

  @override
  void initState() {
    super.initState();
    userProfile = HiveService().getData<String>(AppConfig.userImage);
    nameCtrl = TextEditingController(text: HiveService().getData<String>(AppConfig.userName) ?? '');
    emailCtrl = TextEditingController(
      text: HiveService().getData<String>(AppConfig.userEmail) ?? '',
    );
    phoneNumberCtrl = TextEditingController(
      text: HiveService().getData<String>(AppConfig.userMobile),
    );
    btcWalletIDCtrl = TextEditingController(
      text: HiveService().getData<String>(AppConfig.userBtcAddress) ?? '',
    );
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
        appBar: buildCustomAppBar(context, title: 'ph'.tr),
        body: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                30.heightBox,
                Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: userProfile?.isEmpty ?? false
                        ? Image.network(
                            HiveService().getData<String>(AppConfig.userImage) ?? "",
                            scale: 1.8,
                          )
                        : FaIcon(FontAwesomeIcons.solidCircleUser, size: 50, color: AppColor.subText),
                  ),
                ),
                10.heightBox,
                Center(
                  child: Text(
                    HiveService().getData<String>(AppConfig.userEmail) ?? "",
                    style: textPoppins(context, fontSize: 15),
                  ),
                ),
                Center(
                  child: Text(
                    'ID : ${AppConfig.userProfileId}',
                    style: subTextMontserrat(context, fontSize: 13),
                  ),
                ),
                30.heightBox,
                Text("pn".tr, style: subTextRoboto(context, fontSize: 13)).px(18),
                3.heightBox,
                HorizontalPadding(
                  child: CommonTextField(
                    hintText: "ex. jone smith",
                    controller: nameCtrl,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.name,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return "pne".tr;
                      }
                      return null;
                    },
                  ),
                ),
                10.heightBox,
                Text("pe".tr, style: subTextRoboto(context, fontSize: 13)).px(18),
                3.heightBox,
                HorizontalPadding(
                  child: CommonTextField(
                    hintText: "ex. example123@.com",
                    controller: emailCtrl,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return "pee".tr;
                      }
                      return null;
                    },
                  ),
                ),
                10.heightBox,
                Text("ppn".tr, style: subTextRoboto(context, fontSize: 13)).px(18),
                HorizontalPadding(
                  child: CommonTextField(
                    hintText: "ex. +1 1234567890",
                    controller: phoneNumberCtrl,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.phone,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return "ppne".tr;
                      }
                      return null;
                    },
                  ),
                ),
                10.heightBox,

                Text("pwa".tr, style: subTextRoboto(context, fontSize: 13)).px(18),
                HorizontalPadding(
                  child: CommonTextField(
                    hintText: "pwh".tr,
                    controller: btcWalletIDCtrl,
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.multiline,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return "pwae".tr;
                      }
                      return null;
                    },
                  ),
                ),

                25.heightBox,
                HorizontalPadding(
                  child: AppButton(
                    onTap: () async {
                      FocusScope.of(context).unfocus();
                      if (formKey.currentState?.validate() == true) {
                        UpdateProfileModel updateProfileModel = await ApiRepo.updateProfile(
                          email: emailCtrl.text.trim(),
                          name: nameCtrl.text.trim(),
                          btcAddress: btcWalletIDCtrl.text.trim(),
                          gender: "",
                          mobile: phoneNumberCtrl.text.trim(),
                        );
                        if (updateProfileModel.statusCode == '200') {
                          HiveService().saveData(AppConfig.userEmail, updateProfileModel.email);
                          HiveService().saveData(AppConfig.userName, updateProfileModel.name);
                          HiveService().saveData(
                            AppConfig.userBtcAddress,
                            updateProfileModel.btcAddress,
                          );
                          HiveService().saveData(AppConfig.userMobile, updateProfileModel.mobile);
                        }
                        Navigation.pop();
                        AppConfig.bottomBarValue.value = 3;
                      }
                    },
                    text: 'pub'.tr,
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: SafeArea(child: NativeBanner(radius: 0,)),
      ),
    );
  }
}
