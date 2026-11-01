import 'dart:async';

import 'package:cloud_mining_farm/modual/ctrl/home_ctrl.dart';
import 'package:cloud_mining_farm/utils/utils.dart';
import 'package:get/get.dart';

class AdRewardTimeService {
  static final AdRewardTimeService _instance = AdRewardTimeService._internal();

  factory AdRewardTimeService() => _instance;

  AdRewardTimeService._internal();

  bool get isRunning => adRewardTimeLeft.value.inSeconds > 0;

  final HomeCtrl homeCtrl = Get.find();
  final Rx<Duration> adRewardTimeLeft = Duration.zero.obs;
  final Rx<double> bonusHashRate = 0.0.obs;
  Timer? _adRewardCD;

  void start({required int seconds, required double bonusPower,required String bonusType}) {
    stop();
    homeCtrl.activeHashRate.value += parseMiningPowerToGh('$bonusPower $bonusType');

    adRewardTimeLeft.value = Duration(seconds: seconds);
    _adRewardCD = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (adRewardTimeLeft.value.inSeconds > 1) {
        adRewardTimeLeft.value -= const Duration(seconds: 1);
      } else {
        homeCtrl.activeHashRate.value -= parseMiningPowerToGh('$bonusPower $bonusType');
        stop();
      }
    });
  }

  void stop() {
    _adRewardCD?.cancel();
    _adRewardCD = null;
    adRewardTimeLeft.value = Duration.zero;

  }

  String formatDuration(Duration d) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    return "${twoDigits(d.inMinutes)}:${twoDigits(d.inSeconds.remainder(60))}";
  }

  void dispose() {
    _adRewardCD?.cancel();
    _adRewardCD = null;
    adRewardTimeLeft.value = Duration.zero;
  }
}
