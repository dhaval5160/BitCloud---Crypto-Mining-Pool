

import 'package:cloud_mining_farm/theme/config.dart';
import 'package:cloud_mining_farm/utils/hive_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LanguageService {
  static const Map<String, Locale> supportedLocales = {
    'en': Locale('en', 'US'),
    'de': Locale('de', 'DE'),
    'fr': Locale('fr', 'FR'),
    'sw': Locale('sw', 'KE'),
    'ms': Locale('ms', 'MY'),
    'fil': Locale('fil', 'PH'),
    'es': Locale('es', 'ES'),
    'pt': Locale('pt', 'PT'),
    'nl': Locale('nl', 'NL'),
  };

  static Future<void> changeLanguage(String langCode) async {
    final hive = HiveService();
    final newLocale = supportedLocales[langCode] ?? const Locale('en', 'US');
    Get.updateLocale(newLocale);
    await hive.saveData(AppConfig.locale, langCode);
  }
}
