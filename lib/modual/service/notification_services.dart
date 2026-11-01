import 'dart:async';
import 'dart:io';

import 'package:app_settings/app_settings.dart';
import 'package:cloud_mining_farm/theme/config.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

@pragma('vm:entry-point')
void _onDidReceiveBackgroundNotificationResponse(NotificationResponse response) {
  NotificationService.instance._handleTap(response.payload, response.actionId);
}

class NotificationService {
  static final NotificationService _instance = NotificationService._internal();

  factory NotificationService() => _instance;

  static NotificationService get instance => _instance;

  NotificationService._internal();

  final FirebaseMessaging _messaging = FirebaseMessaging.instance;
  static final FlutterLocalNotificationsPlugin _local = FlutterLocalNotificationsPlugin();

  Future<void> init() async {
    await _requestPermissions();
    await _initLocalNotifications();
    await _initFirebaseMessaging();
  }

  Future<void> _requestPermissions() async {
    final status = await Permission.notification.request();
    if (status.isPermanentlyDenied) {
      AppSettings.openAppSettings(type: AppSettingsType.notification);
    }
  }

  Future<void> _initLocalNotifications() async {
    const androidInit = AndroidInitializationSettings('@mipmap/ic_launcher');
    const iosInit = DarwinInitializationSettings();
    const initSettings = InitializationSettings(android: androidInit, iOS: iosInit);

    await _local.initialize(
      initSettings,
      onDidReceiveNotificationResponse: (response) {
        _handleTap(response.payload, response.actionId);
      },
      onDidReceiveBackgroundNotificationResponse: _onDidReceiveBackgroundNotificationResponse,
    );
  }

  Future<void> _initFirebaseMessaging() async {
    await _messaging.subscribeToTopic("bcmp");

    FirebaseMessaging.onMessage.listen((msg) => showNotification(msg));
    FirebaseMessaging.onMessageOpenedApp.listen((msg) {
      showNotification(msg);
    });

    final initialMessage = await _messaging.getInitialMessage();
    if (initialMessage != null) {
      _handleTap(initialMessage.data['action']);
    }

    await _messaging.setForegroundNotificationPresentationOptions(alert: true, badge: true, sound: true);
  }

  Future<void> showNotification(RemoteMessage message) async {
    final String title = message.notification?.title ?? message.data['title'] ?? "";
    final String body = message.notification?.body ?? message.data['body'] ?? "";
    // final String? subtitle = message.data['subtitle'];
    final String? imageUrl = message.data['image_url'] ?? message.notification?.android?.imageUrl;
    final String payload = message.data['action'] ?? 'default';
    final String buttonName = message.data['button_name'] ?? "Open App";
    final String type = message.data['type'] ?? 'normal';
    final int progress = int.tryParse(message.data['progress'] ?? '0') ?? 0;

    final id = DateTime.now().millisecondsSinceEpoch ~/ 1000;
    BigPictureStyleInformation? bigPicture;
    AndroidBitmap<Object>? largeIconBitmap;

    // --- Image Handling Logic ---
    if (imageUrl != null && imageUrl.isNotEmpty) {
      final imagePath = await _downloadAndSaveFile(imageUrl, 'noti_img_$id.jpg');
      if (imagePath != null) {
        largeIconBitmap = FilePathAndroidBitmap(imagePath);

        bigPicture = BigPictureStyleInformation(
          FilePathAndroidBitmap(imagePath),
          largeIcon: null,
          contentTitle: '<b>$title</b>',
          summaryText: body,
          htmlFormatContentTitle: true,
          htmlFormatSummaryText: true,
        );
      }
    }

    final androidDetails = AndroidNotificationDetails(
      'high_importance_channel',
      'Mining Notifications',
      channelDescription: 'Used for important BTC alerts',
      importance: Importance.max,
      priority: Priority.high,
      playSound: true,
      icon: '@mipmap/ic_launcher',
      visibility: NotificationVisibility.public,
      styleInformation: bigPicture ?? BigTextStyleInformation(body),
      largeIcon: largeIconBitmap ?? const DrawableResourceAndroidBitmap('@mipmap/ic_launcher'),
      showProgress: type == 'progress',
      maxProgress: 100,
      progress: progress,
      onlyAlertOnce: true,
      actions: [AndroidNotificationAction('btn_click_event', buttonName, showsUserInterface: true)],
    );

    await _local.show(id, title, body, NotificationDetails(android: androidDetails), payload: payload);
  }

  Future<String?> _downloadAndSaveFile(String url, String filename) async {
    try {
      final dir = await getApplicationDocumentsDirectory();
      final filePath = '${dir.path}/$filename';
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final file = File(filePath);
        await file.writeAsBytes(response.bodyBytes);
        return filePath;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  void _handleTap(String? payload, [String? actionId]) {
    if (actionId == 'btn_click_event') {
      return;
    }
    if (payload == 'home_page') {
      AppConfig.bottomBarValue.value = 0;
    } else if (payload == 'reward_page') {
      AppConfig.bottomBarValue.value = 2;
    }
  }
}


/*@pragma('vm:entry-point')
void _onDidReceiveBackgroundNotificationResponse(NotificationResponse response) {
  NotificationService.instance._handleTap(response.payload);
}

class NotificationService {
  static final NotificationService _instance = NotificationService._internal();

  factory NotificationService() => _instance;

  static NotificationService get instance => _instance;

  NotificationService._internal();

  final FirebaseMessaging _messaging = FirebaseMessaging.instance;
  static final FlutterLocalNotificationsPlugin _local = FlutterLocalNotificationsPlugin();

  Future<void> init() async {
    await _requestPermissions();
    await _initLocalNotifications();
    await _initFirebaseMessaging();
  }

  Future<void> _requestPermissions() async {
    final status = await Permission.notification.request();
    if (status.isPermanentlyDenied) {
      AppSettings.openAppSettings(type: AppSettingsType.notification);
    }
  }

  Future<void> _initLocalNotifications() async {
    const androidInit = AndroidInitializationSettings('@mipmap/ic_launcher');
    const iosInit = DarwinInitializationSettings();
    const initSettings = InitializationSettings(android: androidInit, iOS: iosInit);

    await _local.initialize(
      initSettings,
      onDidReceiveNotificationResponse: (response) {
        _handleTap(response.payload);
      },
      onDidReceiveBackgroundNotificationResponse: _onDidReceiveBackgroundNotificationResponse,
    );
  }

  Future<void> _initFirebaseMessaging() async {
    await _messaging.subscribeToTopic("bcmp");

    FirebaseMessaging.onMessage.listen((msg) => showNotification(msg));
    FirebaseMessaging.onMessageOpenedApp.listen((msg) {
      _handleTap(msg.data['action']);
    });

    final initialMessage = await _messaging.getInitialMessage();
    if (initialMessage != null) {
      _handleTap(initialMessage.data['action']);
    }

    await _messaging.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
  }

  Future<void> showNotification(RemoteMessage message) async {
    final title = message.data['title'] ?? message.notification?.title ?? "";
    final body = message.data['body'] ?? message.notification?.body ?? "";
    final imageUrl = message.data['image'] as String?;
    final payload = message.data['action'] ?? 'default';


    final id = DateTime.now().millisecondsSinceEpoch ~/ 1000;
    BigPictureStyleInformation? bigPicture;

    if (imageUrl != null && imageUrl.isNotEmpty) {
      final imagePath = await _downloadAndSaveFile(imageUrl, 'noti_img_$id.jpg');
      if (imagePath != null) {
        bigPicture = BigPictureStyleInformation(
          FilePathAndroidBitmap(imagePath),
          largeIcon: const DrawableResourceAndroidBitmap('@mipmap/ic_launcher'),
          contentTitle: title,
          summaryText: body,
        );
      }
    }

    final androidDetails = AndroidNotificationDetails(
      'high_importance_channel',
      'High Importance Notifications',
      channelDescription: 'Used for important BTC alerts',
      importance: Importance.max,
      priority: Priority.high,
      largeIcon: const DrawableResourceAndroidBitmap('@mipmap/ic_launcher'),
      playSound: true,
      icon: '@mipmap/ic_launcher',
      styleInformation: bigPicture ?? BigTextStyleInformation(body),
      fullScreenIntent: true,
      visibility: NotificationVisibility.public,
      actions: [
        AndroidNotificationAction('start_mining', "Let's Start Mining"),
      ],
    );

    const iOSDetails = DarwinNotificationDetails();

    final platformDetails = NotificationDetails(android: androidDetails, iOS: iOSDetails);

    await _local.show(id, title, body, platformDetails, payload: payload);
  }

  Future<String?> _downloadAndSaveFile(String url, String filename) async {
    try {
      final dir = await getApplicationDocumentsDirectory();
      final filePath = '${dir.path}/$filename';
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final file = File(filePath);
        await file.writeAsBytes(response.bodyBytes);
        return filePath;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  void _handleTap(String? payload) {
    if (payload == 'bottom') {
    } else if (payload == 'open_btc_mining_page') {}
  }
}*/
