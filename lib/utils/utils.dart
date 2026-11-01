import 'dart:convert';
import 'package:cloud_mining_farm/helper/app_snackbar.dart';
import 'package:cloud_mining_farm/modual/ctrl/home_ctrl.dart';
import 'package:cloud_mining_farm/theme/asset.dart';
import 'package:cloud_mining_farm/theme/colors.dart';
import 'package:cloud_mining_farm/theme/config.dart';
import 'package:cloud_mining_farm/theme/textstyles.dart';
import 'package:cloud_mining_farm/utils/app_navigation/navigation.dart';
import 'package:cloud_mining_farm/utils/hive_service.dart';
import 'package:cloud_mining_farm/widget/app_text.dart';
import 'package:cloud_mining_farm/widget/watchaddialogbody.dart';
import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:velocity_x/velocity_x.dart';

final HomeCtrl homeCtrl = Get.find();

class HorizontalPadding extends StatelessWidget {
  final Widget child;
  final double? horizontal;

  const HorizontalPadding({super.key, required this.child, this.horizontal});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontal ?? 15),
      child: child,
    );
  }
}

class VerticalPadding extends StatelessWidget {
  final Widget child;

  const VerticalPadding({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.symmetric(vertical: 10), child: child);
  }
}

String hashRateFormating(double miningPowerGHs) {
  if (miningPowerGHs < 1000) {
    return '${miningPowerGHs.toStringAsFixed(2)} GH/s';
  } else if (miningPowerGHs < 1_000_000) {
    final ths = miningPowerGHs / 1000;
    return '${ths.toStringAsFixed(2)} TH/s';
  } else {
    final phs = miningPowerGHs / 1_000_000;
    return '${phs.toStringAsFixed(2)} PH/s';
  }
}

double miningFactor(double btcBalance) {
  if (btcBalance > 0.010000000000) {
    return AppConfig.factorUltraSlow;
  } else if (btcBalance > 0.001000000000) {
    return AppConfig.factorSlow;
  } else if (btcBalance > 0.000100000000) {
    return AppConfig.factorMedium;
  } else if (btcBalance > 0.000010000000) {
    return AppConfig.factorRegular;
  } else {
    return AppConfig.factorFast;
  }
}

String formatDuration(Duration d) {
  final totalDays = d.inDays;
  final hours = d.inHours % 24;
  final minutes = d.inMinutes % 60;
  final seconds = d.inSeconds % 60;

  final hStr = hours.toString().padLeft(2, '0');
  final mStr = minutes.toString().padLeft(2, '0');
  final sStr = seconds.toString().padLeft(2, '0');

  if (totalDays >= 365) {
    final years = totalDays ~/ 365;
    return '$years year${years > 1 ? 's' : ''}';
  } else if (totalDays >= 30) {
    final months = totalDays ~/ 30;
    return '$months Month${months > 1 ? 's' : ''}';
  } else if (totalDays >= 1) {
    return '$totalDays day${totalDays > 1 ? 's' : ''}';
  } else {
    return hours > 0 ? '$hStr : $mStr : $sStr' : '$mStr : $sStr';
  }
}

final List<String> userActivityLogs = [
  '*****145782 purchased 255 GH/s power ⚡',
  '*****743845 purchased 15 TH/s power 🔋',
  '*****743874 withdraw *** BTC successfully 💸',
  '*****982341 purchased 1.2 TH/s power 🚀',
  '*****128734 withdraw *** BTC successfully 🏦',
  '*****764392 purchased 560 GH/s power 🔌',
  '*****384756 withdraw *** BTC successfully 💰',
  '*****204589 purchased 3.5 TH/s power 💡',
  '*****674920 withdraw *** BTC successfully 📤',
  '*****937481 purchased 95 GH/s power ⚙️',
];

String formatTime(int seconds) {
  if (seconds < 60) return "$seconds sec";
  final int hours = seconds ~/ 3600;
  final int minutes = (seconds % 3600) ~/ 60;

  if (hours > 0 && minutes > 0) {
    return "$hours hr $minutes min";
  } else if (hours > 0) {
    return "$hours hours";
  } else {
    return "$minutes minutes";
  }
}

String miningDateFormat(String inputDate) {
  try {
    final date = DateFormat('d-M-yyyy').parse(inputDate);
    return DateFormat('d MMMM yyyy').format(date);
  } catch (e) {
    return inputDate;
  }
}

double getMiningPowerValue(double miningPowerGHs) {
  if (miningPowerGHs < 1000) {
    return miningPowerGHs;
  } else {
    double thValue = miningPowerGHs / 1000;
    return thValue;
  }
}

String getMiningPowerUnit(double miningPowerGHs) {
  return miningPowerGHs < 1000 ? ' Gh/s' : ' Th/s';
}

String calculateWorkerCount(double currentHashRate) {
  double perWorkerHashRate = currentHashRate > 250 ? 20.0 : 10.0;
  return (currentHashRate / perWorkerHashRate).ceil().toString();
}

String? formatUtcMillisToLocal(String? utcMillis) {
  if (utcMillis == null || utcMillis.isEmpty) return null;

  final dateTime = DateTime.fromMillisecondsSinceEpoch(int.parse(utcMillis), isUtc: true).toLocal();

  return dateTime.toIso8601String();
}

double parseMiningPowerToGh(String input) {
  input = input.trim().toLowerCase();
  if (input.endsWith('th/s')) {
    final value = double.tryParse(input.replaceAll('th/s', '').trim());
    return value != null ? value * 1000 : 0.0;
  } else if (input.endsWith('gh/s')) {
    final value = double.tryParse(input.replaceAll('gh/s', '').trim());
    return value ?? 0.0;
  } else {
    return double.tryParse(input) ?? 0.0;
  }
}

String convertPurchaseDate(String dateTime) {
  DateTime parsedDate = DateTime.parse(dateTime);
  return DateFormat('dd/MM/yyyy').format(parsedDate);
}

/*String convertValidityDate({
  required String purchaseDate,
  required String durationType,
}) {
  final DateTime startDate = DateTime.parse(purchaseDate);
  late DateTime futureDate;

  if (durationType == "Monthly") {
    futureDate = startDate.add(Duration(seconds: 2592000));
  } else {
    futureDate = startDate.add(Duration(seconds: 31536000));
  }
  return DateFormat('dd/MM/yyyy').format(futureDate);
}*/

bool isProfileComplete() {
  final name = HiveService().getData<String>(AppConfig.userName);
  final email = HiveService().getData<String>(AppConfig.userEmail);
  final mobile = HiveService().getData<String>(AppConfig.userMobile);
  final btc = HiveService().getData<String>(AppConfig.userBtcAddress);

  return (name?.isNotEmpty ?? false) &&
      (email?.isNotEmpty ?? false) &&
      (mobile?.isNotEmpty ?? false) &&
      (btc?.isNotEmpty ?? false);
}

double getExtraPowerValue(double miningPowerGHs) {
  double thValue = miningPowerGHs * 3 / 100;
  return thValue;
}

void showWatchAdDialog(
  BuildContext context, {
  required String text,
  required String? subText,
  required VoidCallback onWatchAd,
  String? muteText,
  String? subHeader,
  String? image,
}) {
  showGeneralDialog(
    context: context,
    barrierDismissible: true,
    barrierLabel: 'WatchAdDialog',
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
            child: WatchAdDialogBody(
              text: text,
              subText: subText ?? "",
              image: image,
              onWatchAd: onWatchAd,
              muteText: muteText,
              subHeader: subHeader,
            ),
          ),
        ),
      );
    },
  );
}

void showLimitDialog(BuildContext context, {required String text, String? image}) {
  showGeneralDialog(
    context: context,
    barrierDismissible: true,
    barrierLabel: 'WatchLimitDialog',
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
            child: WatchLimitDialogBody(text: text, image: image),
          ),
        ),
      );
    },
  );
}

void showRZHWDialog(BuildContext context) {
  showGeneralDialog(
    context: context,
    barrierDismissible: true,
    barrierLabel: 'rzhw',
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
            child: RewardHW(),
          ),
        ),
      );
    },
  );
}

void showLockUnLockDialog(
  BuildContext context, {
  required String text,
  required String? subText,
  required VoidCallback onWatchAd,
}) {
  showGeneralDialog(
    context: context,
    barrierDismissible: true,
    barrierLabel: 'WatchAdDialog',
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
            child: LockUnLock(text: text, subText: subText ?? "", onWatchAd: onWatchAd),
          ),
        ),
      );
    },
  );
}

void showStartMingDialog(
  BuildContext context, {
  required String? subText,
  required VoidCallback onWatchAd,
  String? image,
}) {
  showGeneralDialog(
    context: context,
    barrierDismissible: true,
    barrierLabel: 'start_mining',
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
            child: StartMiningDialog(subText: subText ?? "", image: image, onWatchAd: onWatchAd),
          ),
        ),
      );
    },
  );
}

void showSuccessDialog(
  BuildContext context, {
  String? massage,
  bool? isEmpty,
  required GestureTapCallback onTap,
}) {
  showGeneralDialog(
    context: context,
    barrierDismissible: true,
    barrierLabel: 'showSuccessDialog',
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
                  isEmpty == true
                      ? FaIcon(
                          FontAwesomeIcons.triangleExclamation,
                          color: AppColor.subText,
                          size: 50,
                        ).pOnly(top: 5, bottom: 15)
                      : Lottie.asset(
                          AppAsset.done,
                          width: 150,
                          height: 150,
                          fit: BoxFit.fill,
                          repeat: false,
                        ),

                  Text(
                    massage ?? '',
                    textAlign: TextAlign.center,
                    style: subTextPoppins(context),
                  ).px(20),
                  20.heightBox,
                  AppButtonSmall(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    onTap: onTap,
                    child: Text(
                      'srd'.tr,
                      style: textMontserrat(
                        context,
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: AppColor.white,
                      ),
                    ),
                  ).px(20),
                  20.heightBox,
                ],
              ),
            ),
          ),
        ),
      );
    },
  );
}

void showRSDialog(BuildContext context, {String? massage, required GestureTapCallback onTap}) {
  showGeneralDialog(
    context: context,
    barrierDismissible: true,
    barrierLabel: 'showSuccessDialog',
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
                  Lottie.asset(
                    AppAsset.done,
                    width: 120,
                    height: 120,
                    fit: BoxFit.fill,
                    repeat: false,
                  ),
                  Text(
                    'rztc'.tr,
                    textAlign: TextAlign.center,
                    style: textMontserrat(context, fontWeight: FontWeight.w600, fontSize: 15),
                  ),
                  20.heightBox,
                  Text(
                    'rztm'.trParams({"massage": massage ?? ""}),
                    textAlign: TextAlign.center,
                    style: subTextPoppins(context),
                  ).px(20),
                  20.heightBox,
                  AppButtonSmall(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    onTap: onTap,
                    child: Text(
                      'rzsb'.tr,
                      style: textMontserrat(
                        context,
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: AppColor.white,
                      ),
                    ),
                  ).px(20),
                  20.heightBox,
                ],
              ),
            ),
          ),
        ),
      );
    },
  );
}

void showRCDialog(BuildContext context, {String? subText}) {
  showGeneralDialog(
    context: context,
    barrierDismissible: true,
    barrierLabel: 'showSuccessDialog',
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
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: const Color(0xff10B981).withValues(alpha: .15),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.verified_rounded, size: 38, color: Color(0xff10B981)),
                  ),

                  20.heightBox,

                  /// Title
                  Text(
                    'Already Claimed',
                    textAlign: TextAlign.center,
                    style: textRoboto(context, fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                  ),

                  10.heightBox,

                  Text(
                    subText ?? "",
                    textAlign: TextAlign.center,
                    style: subTextMontserrat(context, fontSize: 13, color: Colors.white.withValues(alpha: .72)),
                  ),

                  26.heightBox,

                  AppButtonSmall(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    onTap: () {
                      Navigation.pop();
                    },
                    child: Text(
                      'pook'.tr,
                      style: textMontserrat(
                        context,
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: AppColor.white,
                      ),
                    ),
                  ).px(20),
                  20.heightBox,
                ],
              ),
            ),
          ),
        ),
      );
    },
  );
}


String decryptAESCryptoJS(Map body) {
  try {
    final String base64Encrypted = body["encrypted"];
    final String base64Key = AppConfig.keyIv;
    final String base64Iv = AppConfig.iv;

    final key = encrypt.Key(Uint8List.fromList(base64Decode(base64Key)));
    final iv = encrypt.IV(Uint8List.fromList(base64Decode(base64Iv)));
    final encryptedData = base64Decode(base64Encrypted);

    final encrypter = encrypt.Encrypter(encrypt.AES(key, mode: encrypt.AESMode.cbc));

    final decrypted = encrypter.decryptBytes(encrypt.Encrypted(encryptedData), iv: iv);
    return utf8.decode(decrypted);
  } catch (e) {
    rethrow;
  }
}

void supportUs(BuildContext context) {
  Get.bottomSheet(
    Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        color: AppColor.card,
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              15.heightBox,
              Text(
                'sf'.tr,
                style: textMontserrat(context, fontWeight: FontWeight.w600, fontSize: 20),
              ),
              30.heightBox,
              RatingBar.builder(
                initialRating: homeCtrl.setRating.value,
                minRating: 2,
                direction: Axis.horizontal,
                allowHalfRating: false,
                itemCount: 5,
                itemSize: 35,
                updateOnDrag: true,
                unratedColor: AppColor.divider,
                itemPadding: const EdgeInsets.symmetric(horizontal: 8),
                itemBuilder: (context, index) {
                  switch (index) {
                    case 0:
                      return const Icon(Icons.sentiment_very_dissatisfied, color: Colors.red);
                    case 1:
                      return const Icon(Icons.sentiment_dissatisfied, color: Colors.redAccent);
                    case 2:
                      return const Icon(Icons.sentiment_neutral, color: Colors.amber);
                    case 3:
                      return const Icon(Icons.sentiment_satisfied, color: Colors.lightGreen);
                    case 4:
                      return const Icon(Icons.sentiment_very_satisfied, color: Colors.green);
                    default:
                      return const Icon(Icons.star, color: Colors.grey); // Fallback
                  }
                },
                onRatingUpdate: (rating) {
                  homeCtrl.setRating.value = rating;
                },
              ),
              30.heightBox,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: AppButton(
                  color: AppColor.secondaryButton,
                  textColor: AppColor.secondaryText,
                  onTap: () async {
                    Navigation.pop();
                    if (homeCtrl.setRating.value >= 3) {
                      final Uri url = Uri.parse(AppConfig.appLink);
                      if (await launchUrl(url, mode: LaunchMode.externalNonBrowserApplication)) {
                        throw Exception('Could not launch $url');
                      }
                    } else {
                      AppSnackBar.showSnackBar(
                        title: "⭐️ Thanks for rating us!",
                        message: "Your feedback helps us improve! 😊",
                      );
                    }
                  },
                  text: 'sttr'.tr,
                ),
              ),
              15.heightBox,
            ],
          ),
        ),
      ),
    ),
    backgroundColor: Theme.of(context).cardColor,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
  );
}

Future<void> shareInvite() async {
  final message =
      '''
🚀 Join me in mining Bitcoin with this powerful ${AppConfig.appName} app!

💸 I'm earning crypto daily — it's easy, fast, and free to start.

🎁 Use my invite code: ${AppConfig.referralCode} to claim your bonus instantly.

👇 Tap below to download and start mining together:
${AppConfig.appLink}
''';

  final result = await SharePlus.instance.share(ShareParams(text: message));

  if (result.status == ShareResultStatus.success) {
    AppSnackBar.showSnackBar(
      title: 'Invite Reward',
      message: 'You will receive your invitation reward shortly.',
    );
  }
}

final faqList = [
  {"ca": "", "qus": "q1".tr, "ans": "a1".tr},
  {"ca": "", "qus": "q2".tr, "ans": "a2".tr},
  {"ca": "", "qus": "q3".tr, "ans": "a3".tr},
  {"ca": "", "qus": "q4".tr, "ans": "a4".tr},
  {"ca": "", "qus": "q5".tr, "ans": "a5".tr},
  {"ca": "", "qus": "q6".tr, "ans": "a6".tr},
  {"ca": "", "qus": "q7".tr, "ans": "a7".tr},
  {"ca": "", "qus": "q8".tr, "ans": "a8".tr},
  {"ca": "", "qus": "q9".tr, "ans": "a9".tr},
  {"ca": "", "qus": "q10".tr, "ans": "a10".tr},
];

String rewardFormatDuration(Duration d) {
  if (d.isNegative || d == Duration.zero) {
    return "rat".trParams({"atime": "0s"});
  }

  final hours = d.inHours;
  final minutes = d.inMinutes % 60;
  final seconds = d.inSeconds % 60;

  if (hours > 0) {
    return "rat".trParams({"atime": "${hours}h"});
  }

  if (minutes > 0) {
    return "rat".trParams({"atime": "${minutes}m"});
  }

  return "rat".trParams({"atime": "${seconds}s"});
}

void showSnackBar(BuildContext context, {required String text, required String massage}) {
  Get.snackbar(
    text,
    massage,
    snackPosition: SnackPosition.BOTTOM,
    backgroundColor: Colors.black87,
    colorText: Colors.white,
    margin: const EdgeInsets.all(12),
    duration: const Duration(seconds: 2),
  );
}
