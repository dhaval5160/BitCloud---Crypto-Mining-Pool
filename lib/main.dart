import 'package:cloud_mining_farm/ad_modual/consent_service.dart';
import 'package:cloud_mining_farm/modual/btc_pool_mining.dart';
import 'package:cloud_mining_farm/modual/service/notification_services.dart';
import 'package:cloud_mining_farm/theme/config.dart';
import 'package:cloud_mining_farm/utils/hive_service.dart';
import 'package:cloud_mining_farm/utils/remotconfig.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

@pragma('vm:entry-point')
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  await NotificationService.instance.init();
  await NotificationService.instance.showNotification(message);
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await Firebase.initializeApp();
  await InitializationHelper().initialize();
  await FirebaseRemoteConfigService().init();
  await HiveService().init();
  configLoading();
  runApp(const CloudMiningFarmApp());
}

void configLoading() {
  EasyLoading.instance
    ..indicatorWidget = SizedBox(
      height: 40,
      width: 40,
      child: CircularProgressIndicator(
        backgroundColor: Colors.grey.withAlpha(50),
        strokeWidth: 1,
        color: Colors.white,
      ),
    )
    ..radius = 10.0
    ..userInteractions = false
    ..textStyle = const TextStyle(
      fontSize: 14,
      color: Colors.white,
      fontFamily: AppConfig.roboto,
      fontWeight: FontWeight.w500,
    );
}
