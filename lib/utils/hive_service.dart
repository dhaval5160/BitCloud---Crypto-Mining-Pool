import 'package:cloud_mining_farm/modual/model/active_bot_model.dart';
import 'package:cloud_mining_farm/theme/config.dart';
import 'package:cloud_mining_farm/theme/language_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveService {
  static final HiveService _instance = HiveService._internal();
  factory HiveService() => _instance;
  HiveService._internal();

  final Map<String, Box> _boxes = {};

  Future<void> init() async {
    await Hive.initFlutter();
    Hive.registerAdapter(ActiveBotModelAdapter());
    _boxes['bcmra_box'] = await Hive.openBox('bcmra_box');
    _boxes['cmf_activeBot_box'] = await Hive.openBox('cmf_activeBot_box');
    _boxes['cmf_workerReward_box'] = await Hive.openBox('cmf_workerReward_box');
  }

  Future<void> saveData(String key, dynamic value, {String boxName = 'bcmra_box'}) async {
    await _boxes[boxName]?.put(key, value);
  }

  T? getData<T>(String key, {String boxName = 'bcmra_box'}) {
    return _boxes[boxName]?.get(key) as T?;
  }

  Future<void> deleteData(String key, {String boxName = 'bcmra_box'}) async {
    await _boxes[boxName]?.delete(key);
  }

  Future<void> clearBox(String boxName) async {
    await _boxes[boxName]?.clear();
  }


  Future<void> addToBox(dynamic value, {required String boxName}) async {
    await _boxes[boxName]?.add(value);
  }

  List<dynamic> getAll(String boxName) {
    return _boxes[boxName]?.values.toList() ?? [];
  }

  Locale getSavedLocale() {
    String? langCode = getData<String>(AppConfig.locale);
    return LanguageService.supportedLocales[langCode] ?? const Locale('en', 'US');
  }

  Future<void> clearAllBoxes() async {
    for (var box in _boxes.values) {
      await box.clear();
    }
  }

  static final ValueNotifier<bool> lockNotifier = ValueNotifier(false);

  ValueListenable<Box> getListenable({String boxName = 'bcmra_box', List<String>? keys}) {
    return _boxes[boxName]!.listenable(keys: keys);
  }

  void setLock(bool value) {
    saveData(AppConfig.lockMinedBTC, value);
    lockNotifier.value = value;
  }
}
