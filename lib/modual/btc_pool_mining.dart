import 'package:cloud_mining_farm/main.dart';
import 'package:cloud_mining_farm/modual/ctrl/home_ctrl.dart';
import 'package:cloud_mining_farm/modual/service/notification_services.dart';
import 'package:cloud_mining_farm/theme/translations.dart';
import 'package:cloud_mining_farm/utils/app_navigation/app_navigation.dart';
import 'package:cloud_mining_farm/utils/hive_service.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class CloudMiningFarmApp extends StatefulWidget {
  const CloudMiningFarmApp({super.key});

  @override
  State<CloudMiningFarmApp> createState() => _CloudMiningFarmAppState();
}

class _CloudMiningFarmAppState extends State<CloudMiningFarmApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: AppBinding(),
      builder: EasyLoading.init(),
      translations: AppTranslations(),
      locale: HiveService().getSavedLocale(),
      fallbackLocale: Locale('en', 'US'),
      initialRoute: Routes.splash,
      getPages: Routes.routes,
    );
  }
}

class AppBinding extends Bindings {
  @override
  Future<void> dependencies() async {
    Get.put(HomeCtrl());
    FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
    await NotificationService.instance.init();
  }
}
