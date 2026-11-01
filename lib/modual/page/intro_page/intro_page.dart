import 'package:cloud_mining_farm/ad_modual/int_man/Interstitial.dart';
import 'package:cloud_mining_farm/modual/page/intro_page/widget/ip_w1.dart';
import 'package:cloud_mining_farm/modual/page/intro_page/widget/ip_w2.dart';
import 'package:cloud_mining_farm/modual/page/intro_page/widget/ip_w3.dart';
import 'package:cloud_mining_farm/theme/colors.dart';
import 'package:cloud_mining_farm/utils/app_navigation/app_navigation.dart';
import 'package:cloud_mining_farm/utils/app_navigation/navigation.dart';
import 'package:flutter/material.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  final PageController pageController = PageController();
  int currentPage = 0;

  late List<Widget> introPages;

  @override
  void initState() {
    super.initState();
    introPages = [
      IpWidget1(onNext: goToNextPage),
      IpWidget2(onNext: goToNextPage),
      IpWidget3(onFinish: finishIntro),
    ];
  }

  void goToNextPage() {
    if (currentPage < introPages.length - 1) {
      pageController.animateToPage(
        currentPage + 1,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
      setState(() {
        currentPage += 1;
      });
    }
  }

  void finishIntro() {
    InterstitialAdManager().showInterstitialAds();
    Navigation.pushNamed(Routes.introLangPage);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      body: SafeArea(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            PageView.builder(
              controller: pageController,
              itemCount: introPages.length,
              itemBuilder: (context, index) => introPages[index],
            ),
      /*      Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: SmoothPageIndicator(
                controller: pageController,
                count: introPages.length,
                effect: ExpandingDotsEffect(
                  dotHeight: 7,
                  dotWidth: 7,
                  spacing: 8,
                  activeDotColor: Theme.of(context).colorScheme.secondary,
                  dotColor: Theme.of(context).colorScheme.onSecondary.withAlpha(50),
                ),
              ),
            ),*/
          ],
        ),
      ),
    );
  }
}
