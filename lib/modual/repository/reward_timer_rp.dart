import 'dart:async';
import 'package:cloud_mining_farm/modual/ctrl/home_ctrl.dart';
import 'package:cloud_mining_farm/utils/utils.dart';
import 'package:get/get.dart';

class RewardTimeService {
  static final RewardTimeService _instance = RewardTimeService._internal();

  factory RewardTimeService() => _instance;

  RewardTimeService._internal();

  bool get isRunning => rewardTimeLeft.value.inSeconds > 0;

  final HomeCtrl homeCtrl = Get.find();
  final Rx<Duration> rewardTimeLeft = Duration.zero.obs;
  Timer? _rewardCD;

  void start({required int seconds, required double bonusPower,required String bonusType}) {
    stop();
    homeCtrl.activeHashRate.value += parseMiningPowerToGh('$bonusPower $bonusType');

    rewardTimeLeft.value = Duration(seconds: seconds);
    _rewardCD = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (rewardTimeLeft.value.inSeconds > 1) {
        rewardTimeLeft.value -= const Duration(seconds: 1);
      } else {
        homeCtrl.activeHashRate.value -= parseMiningPowerToGh('$bonusPower $bonusType');
        stop();
      }
    });
  }

  void stop() {
    _rewardCD?.cancel();
    _rewardCD = null;
    rewardTimeLeft.value = Duration.zero;

  }

  String formatDuration(Duration d) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    return "${twoDigits(d.inMinutes)}:${twoDigits(d.inSeconds.remainder(60))}";
  }

  void dispose() {
    _rewardCD?.cancel();
    _rewardCD = null;
    rewardTimeLeft.value = Duration.zero;
  }
}
