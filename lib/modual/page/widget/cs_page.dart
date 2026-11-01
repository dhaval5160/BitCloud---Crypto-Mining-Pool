import 'package:cloud_mining_farm/ad_modual/int_man/Interstitial.dart';
import 'package:cloud_mining_farm/ad_modual/native/native_banner.dart';
import 'package:cloud_mining_farm/theme/colors.dart';
import 'package:cloud_mining_farm/theme/config.dart';
import 'package:cloud_mining_farm/theme/textstyles.dart';
import 'package:cloud_mining_farm/utils/app_navigation/navigation.dart';
import 'package:cloud_mining_farm/utils/hive_service.dart';
import 'package:cloud_mining_farm/utils/utils.dart';
import 'package:cloud_mining_farm/widget/app_text.dart';
import 'package:cloud_mining_farm/widget/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:velocity_x/velocity_x.dart';

class CustomerSupportPage extends StatefulWidget {
  const CustomerSupportPage({super.key});

  @override
  State<CustomerSupportPage> createState() => _CustomerSupportPageState();
}

class _CustomerSupportPageState extends State<CustomerSupportPage> {
  TextEditingController emailCtrl = TextEditingController(
    text: HiveService().getData<String>(AppConfig.userEmail),
  );
  TextEditingController subjectCtrl = TextEditingController();
  TextEditingController nameCtrl = TextEditingController();

  final csFormKey = GlobalKey<FormState>();

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
        appBar: buildCustomAppBar(context, title: 'scs'.tr),
        body: SingleChildScrollView(
          child: Form(
            key: csFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                40.heightBox,
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
                15.heightBox,
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
                15.heightBox,
                Text("csm".tr, style: subTextRoboto(context, fontSize: 13)).px(18),
                3.heightBox,
                HorizontalPadding(
                  child: CommonTextField(
                    hintText: "csmh".tr,
                    controller: subjectCtrl,
                    maxLines: 3,
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return "Subject is required.";
                      }
                      return null;
                    },
                  ),
                ),
                35.heightBox,
                HorizontalPadding(
                  child: AppButton(
                    onTap: () async {
                      try {
                        if (csFormKey.currentState!.validate()) {
                          FocusScope.of(context).unfocus();

                          final email = Email(
                            body:
                                'name: ${nameCtrl.text},\nemail: ${emailCtrl.text},\nmessage: ${subjectCtrl.text}',
                            subject:
                                'App: ${AppConfig.appName}, email: ${emailCtrl.text}, Version: ${AppConfig.appVersion}',
                            recipients: [AppConfig.appDataSet?.contactEmail ?? ''],
                            isHTML: false,
                          );

                          await FlutterEmailSender.send(email);
                        }
                      } catch (e) {
                        debugPrint('Email send error: $e');
                      }
                    },
                    text: 'scss'.tr,
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

  Future<void> sendEmailUsingLauncher({
    required String name,
    required String email,
    required String message,
    List<String>? attachmentPaths, // not usable with this method
  }) async {
    final subject = Uri.encodeComponent(
      'App: ${AppConfig.appName}, Version: ${AppConfig.appVersion}',
    );
    final body = Uri.encodeComponent('name: $name\nemail: $email\nmessage: $message');
    final uri = Uri.parse(
      'mailto:${AppConfig.appDataSet?.contactEmail}?subject=$subject&body=$body',
    );

    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch email client';
    }
  }
}
