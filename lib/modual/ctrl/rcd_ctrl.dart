/*
import 'package:get/get.dart';

class RewardCooldownController extends GetxController {
  final RxMap<int, DateTime> cooldownMap = <int, DateTime>{}.obs;

  bool isRewardAvailable(int index) {
    if (!cooldownMap.containsKey(index)) return true;
    return DateTime.now().isAfter(cooldownMap[index]!);
  }

  Duration remainingTime(int index) {
    if (!cooldownMap.containsKey(index)) return Duration.zero;
    return cooldownMap[index]!.difference(DateTime.now());
  }

  void claimReward(int index, int renewTimeInSeconds) {
    cooldownMap[index] = DateTime.now().add(Duration(seconds: renewTimeInSeconds));
  }
}
*/

import 'package:get/get.dart';
import 'package:hive/hive.dart';

class RewardCooldownController extends GetxController {
  late Box _rewardBox;

  final RxMap<int, DateTime> cooldownMap = <int, DateTime>{}.obs;

  @override
  void onInit() {
    super.onInit();
    _rewardBox = Hive.box('cmf_workerReward_box');
    _loadCooldowns();
  }

  void _loadCooldowns() {
    for (final key in _rewardBox.keys) {
      if (key.toString().startsWith('cooldown_')) {
        final millis = _rewardBox.get(key);
        if (millis is int) {
          final index =
          int.parse(key.toString().replaceFirst('cooldown_', ''));
          cooldownMap[index] =
              DateTime.fromMillisecondsSinceEpoch(millis);
        }
      }
    }
  }

  bool isRewardAvailable(int index) {
    if (!cooldownMap.containsKey(index)) return true;
    return DateTime.now().isAfter(cooldownMap[index]!);
  }

  Duration remainingTime(int index) {
    if (!cooldownMap.containsKey(index)) return Duration.zero;

    final diff = cooldownMap[index]!.difference(DateTime.now());
    return diff.isNegative ? Duration.zero : diff;
  }

  void claimReward(int index, int renewTimeInSeconds) {
    final endTime =
    DateTime.now().add(Duration(seconds: renewTimeInSeconds));

    cooldownMap[index] = endTime;

    _rewardBox.put(
      'cooldown_$index',
      endTime.millisecondsSinceEpoch,
    );
  }

  void clearIfExpired(int index) {
    if (isRewardAvailable(index)) {
      cooldownMap.remove(index);
      _rewardBox.delete('cooldown_$index');
    }
  }
}

