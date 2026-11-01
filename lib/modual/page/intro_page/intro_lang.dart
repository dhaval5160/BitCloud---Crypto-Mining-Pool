import 'package:cloud_mining_farm/ad_modual/int_man/Interstitial.dart';
import 'package:cloud_mining_farm/ad_modual/native/native_banner.dart';
import 'package:cloud_mining_farm/modual/ctrl/home_ctrl.dart';
import 'package:cloud_mining_farm/theme/colors.dart';
import 'package:cloud_mining_farm/theme/language_service.dart';
import 'package:cloud_mining_farm/theme/textstyles.dart';
import 'package:cloud_mining_farm/utils/app_navigation/app_navigation.dart';
import 'package:cloud_mining_farm/utils/app_navigation/navigation.dart';
import 'package:cloud_mining_farm/widget/app_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class IntroLangPage extends StatefulWidget {
  const IntroLangPage({super.key});

  @override
  State<IntroLangPage> createState() => _IntroLangPageState();
}

class _IntroLangPageState extends State<IntroLangPage> {
  final HomeCtrl homeCtrl = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      appBar: AppBar(
        backgroundColor: AppColor.background,
        automaticallyImplyLeading: false,
        title: Text(
          "Choose Language",
          style: textMontserrat(context, fontSize: 18, fontWeight: FontWeight.w600, color: AppColor.white),
        ),
        actions: [
          Obx(() {
            return homeCtrl.isChangingLanguage.value
                ? Padding(
                    padding: const EdgeInsets.only(right: 12),
                    child: SizedBox(
                      height: 25,
                      width: 25,
                      child: CircularProgressIndicator(strokeWidth: 1.5, color: AppColor.primaryButton),
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.only(right: 12),
                    child: GestureDetector(
                      onTap: () async {
                        homeCtrl.isChangingLanguage.value = true;

                        await Future.delayed(const Duration(seconds: 2));

                        LanguageService.changeLanguage(homeCtrl.languageCode.value);

                        InterstitialAdManager().showInterstitialByCount();

                        Navigation.pushNamed(Routes.countryPage);

                        homeCtrl.isChangingLanguage.value = false;
                      },
                      child: Container(
                        height: 30,
                        padding: const EdgeInsets.symmetric(horizontal: 14),
                        decoration: BoxDecoration(color: AppColor.primaryButton, borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'NEXT',
                              style: textMontserrat(
                                context,
                                fontSize: 13,
                                fontWeight: FontWeight.w900,
                                color: AppColor.white,
                              ).copyWith(letterSpacing: 1),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
          }),
        ],
      ),

      body: ListView.separated(
        shrinkWrap: true,
        itemCount: languagesList.length,
        padding: const EdgeInsets.all(15),
        itemBuilder: (context, index) {
          final data = languagesList[index];
          return Obx(() {
            return GestureDetector(
              onTap: () {
                homeCtrl.languageCode.value = data['code'].toString();
                homeCtrl.selectedLanguage.value = index;
              },
              child: CardContainer(
                color: homeCtrl.selectedLanguage.value == index ? AppColor.primaryButton : AppColor.card,
                borderRadius: BorderRadius.circular(10),
                isPaddingZero: true,
                child: Padding(
                  padding: const EdgeInsets.only(left: 13, right: 10, top: 10, bottom: 10),
                  child: Row(
                    children: [
                      Container(
                        height: 25,
                        width: 25,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(image: NetworkImage('${data['flag']}'), fit: BoxFit.cover),
                        ),
                      ),
                      15.widthBox,
                      Text(
                        '${data['language']}',
                        style: textRoboto(
                          context,
                          fontSize: homeCtrl.selectedLanguage.value == index ? 17 : 15,
                          color: homeCtrl.selectedLanguage.value == index ? AppColor.text : AppColor.subText,
                          fontWeight: homeCtrl.selectedLanguage.value == index ? FontWeight.bold : FontWeight.w500,
                        ),
                      ),
                      Spacer(),
                      RadioGroup<int>(
                        groupValue: homeCtrl.selectedLanguage.value,
                        onChanged: (int? value) {
                          setState(() {
                            homeCtrl.selectedLanguage.value = value ?? 0;
                          });
                        },
                        child: Radio<int>(
                          value: index,
                          fillColor: WidgetStateProperty.resolveWith<Color>((states) {
                            if (states.contains(WidgetState.selected)) {
                              return AppColor.text;
                            }
                            return AppColor.subText.withAlpha(100);
                          }),
                          visualDensity: const VisualDensity(vertical: -4, horizontal: -4),
                          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          });
        },
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(height: 10);
        },
      ),
      bottomNavigationBar: SafeArea(child: NativeBanner(radius: 0)),
    );
  }

  final languagesList = [
    {"language": "English", "code": "en", "flag": "https://flagcdn.com/w80/gb.png"},
    {"language": "German", "code": "de", "flag": "https://flagcdn.com/w80/de.png"},
    {"language": "French", "code": "fr", "flag": "https://flagcdn.com/w80/fr.png"},
    {"language": "Swahili", "code": "sw", "flag": "https://flagcdn.com/w80/ke.png"},
    {"language": "Malay", "code": "ms", "flag": "https://flagcdn.com/w80/my.png"},
    {"language": "Filipino", "code": "fil", "flag": "https://flagcdn.com/w80/ph.png"},
    {"language": "Spanish", "code": "es", "flag": "https://flagcdn.com/w80/es.png"},
    {"language": "Portuguese", "code": "pt", "flag": "https://flagcdn.com/w80/pt.png"},
    {"language": "Dutch", "code": "nl", "flag": "https://flagcdn.com/w80/nl.png"},
  ];
}
