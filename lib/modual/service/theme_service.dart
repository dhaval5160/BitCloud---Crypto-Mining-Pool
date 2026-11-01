
import 'package:cloud_mining_farm/theme/config.dart';
import 'package:cloud_mining_farm/utils/hive_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class ThemeService {
  static final ThemeService instance = ThemeService._internal();
  ThemeService._internal();

  final RxBool isThemeMode = true.obs;
  final RxBool isThemeModeNative = true.obs;

  Future<void> init() async {
    final isDark = HiveService().getData<bool>(AppConfig.isDarkMode) ?? true;
    isThemeMode.value = isDark;
    isThemeModeNative.value = isDark;
    Get.changeThemeMode(isDark ? ThemeMode.dark : ThemeMode.light);
  }

  Future<void> switchTheme(bool themeMode) async {
    isThemeMode.value = themeMode;
    HiveService().saveData(AppConfig.isDarkMode, themeMode);
    Get.changeThemeMode(themeMode ? ThemeMode.dark : ThemeMode.light);
  }

  ThemeMode get theme => isThemeMode.value ? ThemeMode.dark : ThemeMode.light;
}
