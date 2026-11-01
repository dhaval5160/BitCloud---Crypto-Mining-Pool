import 'dart:async';
import 'dart:math';

import 'package:cloud_mining_farm/ad_modual/app_open.dart';
import 'package:cloud_mining_farm/ad_modual/int_man/int_rwd_admanger.dart';
import 'package:cloud_mining_farm/modual/model/active_bot_model.dart';
import 'package:cloud_mining_farm/modual/model/appdataset_model.dart';
import 'package:cloud_mining_farm/modual/model/sub_details_model.dart';
import 'package:cloud_mining_farm/modual/model/user_model.dart';
import 'package:cloud_mining_farm/modual/model/withdraw_details_model.dart';
import 'package:cloud_mining_farm/modual/service/api_service.dart';
import 'package:cloud_mining_farm/theme/config.dart';
import 'package:cloud_mining_farm/utils/hive_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class HomeCtrl extends GetxController with GetTickerProviderStateMixin {
  final ScrollController planScrollController = ScrollController();
  List<GlobalKey> planKeys = [];

  Timer? activeMinerCount;
  RxInt activeMiners = 13000.obs;

  // setting
  RxDouble setRating = 2.0.obs;
  RxString inviteCode = ''.obs;
  RxBool isExpanded = true.obs;

  RxInt selectedLanguage = 0.obs;
  RxString languageCode = ''.obs;
  RxBool isChangingLanguage = false.obs;
  RxInt walletTabIndex = 0.obs;

  // subscribe page
  RxInt selectedPlan = 0.obs;
  Rx<Plans> selectedPlanDetails = Plans().obs;

  RxInt selectedPlanIndex = 0.obs;
  RxBool isPurchase = false.obs;
  RxBool isPlanAds = false.obs;
  RxInt planAdsTime = 0.obs;
  RxDouble bonusSpeed = 0.0.obs;

  RxInt showTimerIndex = (-1).obs;

  RxDouble activeHashRate = 0.0.obs;
  RxDouble btcBalance = 0.000000000000.obs;
  RxDouble miningBtcValue = 0.000000000000.obs;
  RxDouble inviteBtcBalance = 0.000000000000.obs;

  RxList<ActiveBotModel> activeBotList = <ActiveBotModel>[].obs;
  RxList<ActiveBotModel> activeBoosterList = <ActiveBotModel>[].obs;

  RxList<UserSubIdData> userActiveBotList = <UserSubIdData>[].obs;
  RxList<UserSubIdData> userActiveSubList = <UserSubIdData>[].obs;

  RxList<ListPlan> subscriptionPlanList = <ListPlan>[].obs;
  RxList<Plans> planDetailsList = <Plans>[].obs;
  Rx<ListPlan> randomPlan = ListPlan().obs;
  Rx<ListPlan> planDetails = ListPlan().obs;

  Rx<SubDetailsModel> subDetailsModel = SubDetailsModel().obs;
  RxList<Leaderboard> leaderBoardList = <Leaderboard>[].obs;
  RxList<ListReward> rewardList = <ListReward>[].obs;
  Rx<WithdrawDetailsModel> withdrawDetailsModel = WithdrawDetailsModel().obs;
  RxList<WDData> withdrawDetailsList = <WDData>[].obs;

  Future<void> getSubDetails() async {
    try {
      leaderBoardList.clear();
      subscriptionPlanList.clear();
      rewardList.clear();
      String? email = HiveService().getData<String>(AppConfig.userEmail);
      subDetailsModel.value = await ApiRepo.subscriptionDetails(email: email ?? "");
      isPurchase.value = subDetailsModel.value.purchase ?? true;
      subscriptionPlanList.addAll(subDetailsModel.value.listPlan ?? []);
      rewardList.addAll(subDetailsModel.value.listReward ?? []);
      leaderBoardList.addAll(subDetailsModel.value.leaderboard ?? []);
      shoeRandomPlan();
    } catch (e, st) {
      debugPrint("$e");
      debugPrint("$st");
      return;
    }
  }

  Future<void> getWithdrawDetails() async {
    withdrawDetailsList.clear();
    withdrawDetailsModel.value = await ApiRepo.viewWithdrawDetails(email: HiveService().getData<String>(AppConfig.userEmail));
    withdrawDetailsList.addAll(withdrawDetailsModel.value.data ?? []);
  }

  void startRandomActiveMinerCount({required int minMiners, required int maxMiners}) {
    activeMinerCount = Timer.periodic(const Duration(seconds: 5), (_) {
      activeMiners.value = minMiners + Random().nextInt(maxMiners);
    });
  }

  void getActiveSubscription() async {
    try {
      EasyLoading.show();

      userActiveSubList.clear();

      final email = HiveService().getData<String>(AppConfig.userEmail);
      final UserProfileModel userProfileModel = await ApiRepo.userLogin(email: email, reference: '', firstTime: '');
      final now = DateTime.now();

      final activeSubs = (userProfileModel.subscription ?? []).where((sub) {
        if (sub.addTime == null || sub.durationSeconds == null || sub.type != 'Paid') {
          return false;
        }

        try {
          final endTime = DateTime.parse(sub.expireTime ?? '');
          final isActive = endTime.isAfter(now);
          return isActive;
        } catch (e) {
          return false;
        }
      }).toList();

      userActiveSubList.addAll(activeSubs);

      EasyLoading.dismiss();
    } catch (e) {
      EasyLoading.dismiss();
    }
  }

  void shoeRandomPlan() {
    if (subscriptionPlanList.isEmpty) {
      return;
    }

    final random = Random();
    final index = random.nextInt(subscriptionPlanList.length);

    randomPlan.value = subscriptionPlanList[index];
  }

  @override
  void onInit() {
    super.onInit();
    appDataSet();
  }

  appDataSet() async {
    AppDataSetModel appDataSetModel = await ApiRepo.appDataSet();
    AppConfig.appDataSet = appDataSetModel.appDataSet;
    activeHashRate.value = appDataSetModel.appDataSet?.startHashRate ?? 5.3;
    startRandomActiveMinerCount(
      minMiners: appDataSetModel.appDataSet?.minMiners ?? 25000,
      maxMiners: appDataSetModel.appDataSet?.maxMiners ?? 45000,
    );
    if (AppConfig.appDataSet?.appOpen == true) {
      AppOpenAdManager().loadAd();
    }
    IntOrRwdAdManger().initAds();
  }

  void getActiveMiner() async {
    EasyLoading.show();

    try {
      activeBotList.clear();

      final allMiners = HiveService().getAll('cmf_activeBot_box').cast<ActiveBotModel>();
      final now = DateTime.now();
      final validMiners = <ActiveBotModel>[];

      for (final miner in allMiners) {
        final start = DateTime.fromMillisecondsSinceEpoch(miner.addTime);
        final endTime = start.add(Duration(seconds: miner.durationSeconds));

        if (endTime.isAfter(now)) {
          validMiners.add(miner);
        } else {
          await miner.delete();
        }
      }

      activeBotList.addAll(validMiners);

      final email = HiveService().getData<String>(AppConfig.userEmail);
      final UserProfileModel userProfileModel = await ApiRepo.userLogin(email: email, reference: '', firstTime: '');

      final activeSubs = (userProfileModel.subscription ?? []).where((sub) {
        if (sub.addTime == null || sub.durationSeconds == null || sub.type != 'Paid') {
          return false;
        }

        try {
          final endTime = DateTime.parse(sub.expireTime ?? '');
          final isActive = endTime.isAfter(now);
          return isActive;
        } catch (e) {
          return false;
        }
      }).toList();

      for (UserSubIdData sub in activeSubs) {
        activeBotList.add(
          ActiveBotModel(
            productID: sub.productID.toString(),
            botType: sub.botType.toString(),
            type: sub.type.toString(),
            power: sub.power.toString(),
            powerType: sub.powerType.toString(),
            durationType: sub.durationType.toString(),
            durationSeconds: sub.durationSeconds ?? 0,
            addTime: DateTime.parse(sub.addTime ?? '').millisecondsSinceEpoch,
            expireTime: DateTime.parse(sub.expireTime ?? '').millisecondsSinceEpoch,
            days: sub.days,
            status: sub.status,
          ),
        );
      }
    } catch (e) {
      debugPrint('Error loading miners: $e');
      EasyLoading.showError("Failed to load miners");
    } finally {
      EasyLoading.dismiss();
    }
  }

  Future<void> getActiveBooster() async {
    try {
      final allMiners = HiveService().getAll('cmf_activeBot_box').cast<ActiveBotModel>();

      final now = DateTime.now();

      final validMiners = <ActiveBotModel>[];
      final expiredMiners = <ActiveBotModel>[];

      for (final miner in allMiners) {
        final start = DateTime.fromMillisecondsSinceEpoch(miner.addTime);
        final endTime = start.add(Duration(seconds: miner.durationSeconds));

        if (endTime.isAfter(now)) {
          validMiners.add(miner);
        } else {
          expiredMiners.add(miner);
        }
      }

      for (final miner in expiredMiners) {
        await miner.delete();
      }
      activeBoosterList.assignAll(validMiners);
    } catch (e) {
      debugPrint("$e");
    }
  }

  void updateRemaining() async {
    try {
      final now = DateTime.now();
      final stillValid = <ActiveBotModel>[];

      for (final miner in activeBoosterList) {
        final start = DateTime.fromMillisecondsSinceEpoch(miner.addTime);
        final endTime = start.add(Duration(seconds: miner.durationSeconds));
        if (endTime.isAfter(now)) {
          stillValid.add(miner);
        } else {
          await miner.delete();
        }
      }

      activeBoosterList.assignAll(stillValid);
    } catch (e) {
      EasyLoading.dismiss();
    }
  }

  Duration remainingTime(ActiveBotModel miner) {
    final endTime = DateTime.fromMillisecondsSinceEpoch(miner.addTime).add(Duration(seconds: miner.durationSeconds));
    final remaining = endTime.difference(DateTime.now());

    if (remaining.isNegative || remaining.inSeconds == 0) {
      Future.microtask(() {
        updateRemaining();
      });
    }
    return remaining.isNegative ? Duration.zero : remaining;
  }
}
