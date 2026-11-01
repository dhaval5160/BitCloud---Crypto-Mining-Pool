import 'package:cloud_mining_farm/theme/config.dart';
import 'package:cloud_mining_farm/utils/hive_service.dart';
import 'package:get/get.dart';

class TimeBoostUsageService {
  static final TimeBoostUsageService _instance = TimeBoostUsageService._internal();

  factory TimeBoostUsageService() => _instance;

  TimeBoostUsageService._internal();

  final HiveService hive = HiveService();

  final RxInt usedCount = 0.obs;
  final int maxUses = 3;

  void init() {
    _loadData();
  }

  void _loadData() {
    final Map? data = hive.getData<Map>(AppConfig.timeBoostUsageKey);

    if (data == null) {
      usedCount.value = 0;
      return;
    }

    final DateTime firstUseTime = DateTime.parse(data['firstUseTime']);

    if (DateTime.now().difference(firstUseTime) >= const Duration(hours: 24)) {
      _reset();
    } else {
      usedCount.value = data['count'];
    }
  }

  /// Call this when user uses Time Boost
  bool useBoost() {
    _loadData();

    if (usedCount.value >= maxUses) return false;

    usedCount.value++;

    hive.saveData(AppConfig.timeBoostUsageKey, {
      'count': usedCount.value,
      'firstUseTime':
          hive.getData<Map>(AppConfig.timeBoostUsageKey)?['firstUseTime'] ??
          DateTime.now().toIso8601String(),
    });

    return true;
  }

  int get remainingUses => maxUses - usedCount.value;

  bool get canUseBoost => remainingUses > 0;

  void _reset() {
    usedCount.value = 0;
    hive.deleteData(AppConfig.timeBoostUsageKey);
  }
}
