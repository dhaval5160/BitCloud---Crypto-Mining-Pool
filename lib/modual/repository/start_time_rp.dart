import 'dart:async';

import 'package:cloud_mining_farm/modual/ctrl/home_ctrl.dart';
import 'package:cloud_mining_farm/modual/service/api_service.dart';
import 'package:cloud_mining_farm/theme/config.dart';
import 'package:cloud_mining_farm/utils/hive_service.dart';
import 'package:cloud_mining_farm/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StartTimeService {
  static final StartTimeService _instance = StartTimeService._internal();

  factory StartTimeService() => _instance;

  StartTimeService._internal();

  bool get isRunning => startTimeLeft.value.inSeconds > 0;

  final HomeCtrl homeCtrl = Get.find();
  final hive = HiveService();
  final Rx<Duration> startTimeLeft = Duration.zero.obs;
  Timer? _startCD;
  Timer? _miningCD;

  void start({required int seconds}) {
    if (isRunning) return;
    stop(callComplete: false);

    startTimeLeft.value = Duration(seconds: seconds);
    hive.saveData(AppConfig.checkMining, true);
    hive.saveData(AppConfig.miningTime, DateTime.now().millisecondsSinceEpoch);
    _startCD = Timer.periodic(const Duration(seconds: 1), (timer) async {
      if (startTimeLeft.value.inSeconds > 1) {
        startTimeLeft.value -= const Duration(seconds: 1);
      } else {
        stop(callComplete: true);
      }
    });

    _miningCD = Timer.periodic(Duration(seconds: 3), (timer) {
      final earned = _calculateEarning();
      homeCtrl.miningBtcValue.value += earned;
    });
  }

  double _calculateEarning() {
    final hashRate = homeCtrl.activeHashRate.value;
    final factor = miningFactor(homeCtrl.miningBtcValue.value);
    final safeHashRate = hashRate < 0 ? 5.3 : hashRate;
    return safeHashRate * factor;
  }

  Future<void> stop({bool callComplete = true}) async {
    _startCD?.cancel();
    _miningCD?.cancel();
    _startCD = null;
    _miningCD = null;
    startTimeLeft.value = Duration.zero;
    hive.saveData(AppConfig.checkMining, false);

    if (callComplete) {
      double minedBtc = 0.0;

      if (homeCtrl.btcBalance.value != 0.0) {
        minedBtc = homeCtrl.miningBtcValue.value - homeCtrl.btcBalance.value;
      } else {
        minedBtc = homeCtrl.miningBtcValue.value;
      }
      if (minedBtc > 0) {
        String? email = HiveService().getData<String>(AppConfig.userEmail);
        await ApiRepo.addBtc(email: email, btc: minedBtc.toStringAsFixed(12), type: "direct");
      }
      homeCtrl.btcBalance.value = homeCtrl.miningBtcValue.value;
    }
  }

  Future<void> saveMiningState() async {
    final bool? isMining = hive.getData<bool>(AppConfig.checkMining);
    if (isMining != true) return;
    final currentBalance = homeCtrl.miningBtcValue.value;
    hive.saveData(AppConfig.btcBalance, currentBalance);

    final now = DateTime.now().millisecondsSinceEpoch;
    hive.saveData(AppConfig.lastMiningTime, now);

    final remainingSeconds = startTimeLeft.value.inSeconds;
    hive.saveData(AppConfig.lastMiningTimeSecond, remainingSeconds);

    _startCD?.cancel();
    _miningCD?.cancel();
    _startCD = null;
    _miningCD = null;
    startTimeLeft.value = Duration.zero;
  }

  Future<void> resumeMiningFromStorage() async {
    try {
      final bool? isMining = hive.getData<bool>(AppConfig.checkMining);
      if (isMining != true) return;

      final savedBtc = hive.getData<double>(AppConfig.btcBalance) ?? homeCtrl.miningBtcValue.value;
      final miningStartTime = hive.getData<int>(AppConfig.miningTime) ?? 0;
      final lastMiningTime = hive.getData<int>(AppConfig.lastMiningTime) ?? 0;

      final totalMiningSeconds = hive.getData<int>(AppConfig.lastMiningTimeSecond) ?? 0;
      final currentTime = DateTime.now().millisecondsSinceEpoch;

      final secondsSinceStart = ((currentTime - miningStartTime) ~/ 1000);
      final secondsSinceLast = ((currentTime - lastMiningTime) ~/ 1000);

      double earned = 0;

      if (secondsSinceStart >= AppConfig.mingTimer) {
        if (secondsSinceLast > AppConfig.miningIntervals) {
          final earnedPerInterval = _calculateEarning();
          earned = earnedPerInterval * secondsSinceLast / 3;
          homeCtrl.miningBtcValue.value = savedBtc + earned;
          stop(callComplete: true);
        } else {
          homeCtrl.miningBtcValue.value = savedBtc;
          stop(callComplete: true);
        }
      } else {
        if (secondsSinceLast > AppConfig.miningIntervals) {
          final earnedPerInterval = _calculateEarning();
          earned = earnedPerInterval * secondsSinceLast / 5;
          homeCtrl.miningBtcValue.value = savedBtc + earned;
        } else {
          homeCtrl.miningBtcValue.value = savedBtc;
        }
        final remaining = (totalMiningSeconds - secondsSinceLast).clamp(0, totalMiningSeconds);
        start(seconds: remaining);
      }
      hive.deleteData(AppConfig.btcBalance);
    } catch (e) {
      debugPrint("resumeMiningFromStorage error: $e");
    }
  }

  String formatDuration(Duration d) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');

    final hours = d.inHours;
    final minutes = d.inMinutes.remainder(60);
    final seconds = d.inSeconds.remainder(60);

    if (hours > 0) {
      return "${twoDigits(hours)}:${twoDigits(minutes)}:${twoDigits(seconds)}";
    } else {
      return "${twoDigits(minutes)}:${twoDigits(seconds)}";
    }
  }

  void dispose() {
    _startCD?.cancel();
    _miningCD?.cancel();
    _startCD = null;
    _miningCD = null;
    startTimeLeft.value = Duration.zero;
  }
}
