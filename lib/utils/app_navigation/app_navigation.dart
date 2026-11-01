import 'package:cloud_mining_farm/modual/page/bottom_page.dart';
import 'package:cloud_mining_farm/modual/page/intro_page/country_page.dart';
import 'package:cloud_mining_farm/modual/page/intro_page/intro_lang.dart';
import 'package:cloud_mining_farm/modual/page/intro_page/intro_page.dart';
import 'package:cloud_mining_farm/modual/page/intro_page/signin_page.dart';
import 'package:cloud_mining_farm/modual/page/intro_page/signin_reward_page.dart';
import 'package:cloud_mining_farm/modual/page/intro_page/system_initialization_screen.dart';
import 'package:cloud_mining_farm/modual/page/widget/active_miner.dart';
import 'package:cloud_mining_farm/modual/page/widget/active_subscription.dart';
import 'package:cloud_mining_farm/modual/page/widget/cs_page.dart';
import 'package:cloud_mining_farm/modual/page/widget/exit_page.dart';
import 'package:cloud_mining_farm/modual/page/widget/faq_page.dart';
import 'package:cloud_mining_farm/modual/page/widget/language_page.dart';
import 'package:cloud_mining_farm/modual/page/widget/lock_page.dart';
import 'package:cloud_mining_farm/modual/page/widget/payout_page.dart';
import 'package:cloud_mining_farm/modual/page/widget/privacy_policy_page.dart';
import 'package:cloud_mining_farm/modual/page/widget/profile_page.dart';
import 'package:cloud_mining_farm/modual/page/widget/ranking_page.dart';
import 'package:cloud_mining_farm/modual/page/widget/record_page.dart';
import 'package:cloud_mining_farm/modual/page/widget/restore_sub.dart';
import 'package:cloud_mining_farm/modual/page/widget/subscribe_page.dart';
import 'package:cloud_mining_farm/modual/page/widget/supercoin.dart';
import 'package:cloud_mining_farm/modual/page/widget/unlock_page.dart';
import 'package:cloud_mining_farm/modual/splash_page.dart';
import 'package:get/get.dart';

mixin Routes {
  static const Transition defaultTransition = Transition.native;

  // Route names
  static const String splash = "/splash";
  static const String signInPage = "/signInPage";
  static const String signInRewardPage = "/signInRewardPage";
  static const String bottomPage = "/bottomPage";
  static const String subscribePage = "/subscribePage";
  static const String profilePage = "/profilePage";
  static const String payoutPage = "/payoutPage";
  static const String activeMinerPage = "/activeMinerPage";
  static const String activeSubPage = "/activeSubPage";
  static const String privacyPolicyPage = "/privacyPolicyPage";
  static const String languagePage = "/languagePage";
  static const String csPage = "/csPage";
  static const String recordPage = "/recordPage";
  static const String rankingPage = "/rankingPage";
  static const String countryPage = "/countryPage";
  static const String introPage = "/introPage";
  static const String exitPage = "/exitPage";
  static const String restoreSubPage = "/restoreSubPage";
  static const String introLangPage = "/introLangPage";
  static const String lockPage = "/lockPage";
  static const String unlockPage = "/unlockPage";
  static const String faqPage = "/faqPage";
  static const String superCoinPage = "/superCoinPage";
  static const String systemInitializationScreen = "/systemInitializationScreen";

  static List<GetPage<dynamic>> routes = [
    GetPage(name: splash, page: () => const SplashPage(), transition: defaultTransition),
    GetPage(name: signInPage, page: () => const SignInPage(), transition: defaultTransition),
    GetPage(
      name: signInRewardPage,
      page: () => const SignInRewardPage(),
      transition: defaultTransition,
    ),
    GetPage(name: profilePage, page: () => const ProfilePage(), transition: defaultTransition),
    GetPage(name: payoutPage, page: () => const PayoutPage(), transition: defaultTransition),
    GetPage(name: recordPage, page: () => const RecordPage(), transition: defaultTransition),
    GetPage(name: rankingPage, page: () => const RankingPage(), transition: defaultTransition),
    GetPage(name: countryPage, page: () => const CountryPage(), transition: defaultTransition),
    GetPage(name: introPage, page: () => const IntroPage(), transition: defaultTransition),
    GetPage(name: exitPage, page: () => ExitPage(), transition: defaultTransition),
    GetPage(name: bottomPage, page: () => const BottomBarPage(), transition: defaultTransition),
    GetPage(name: csPage, page: () => const CustomerSupportPage(), transition: defaultTransition),
    GetPage(name: languagePage, page: () => const LanguagePage(), transition: defaultTransition),
    GetPage(
      name: privacyPolicyPage,
      page: () => const PrivacyPolicyPage(),
      transition: defaultTransition,
    ),
    GetPage(
      name: activeSubPage,
      page: () => const ActiveSubscriptionPage(),
      transition: defaultTransition,
    ),
    GetPage(
      name: activeMinerPage,
      page: () => const ActiveMinerPage(),
      transition: defaultTransition,
    ),
    GetPage(name: subscribePage, page: () => const SubscribePage(), transition: defaultTransition),
    GetPage(
      name: restoreSubPage,
      page: () => const RestoreSubPage(),
      transition: defaultTransition,
    ),
    GetPage(name: introLangPage, page: () => const IntroLangPage(), transition: defaultTransition),
    GetPage(name: lockPage, page: () => const LockPage(), transition: defaultTransition),
    GetPage(name: unlockPage, page: () => const UnlockPage(), transition: defaultTransition),
    GetPage(name: faqPage, page: () => const FaqPage(), transition: defaultTransition),
    GetPage(name: superCoinPage, page: () => const SuperCoinPage(), transition: defaultTransition),
    GetPage(name: systemInitializationScreen, page: () => const SystemInitializationScreen(), transition: defaultTransition),
  ];
}
