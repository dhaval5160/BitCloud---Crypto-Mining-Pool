
import 'package:cloud_mining_farm/helper/end_point_model.dart';
import 'package:cloud_mining_farm/modual/model/appdataset_model.dart';
import 'package:flutter/material.dart';

class AppConfig {
  AppConfig._();

  static const roboto = 'Roboto';
  static const montserrat = 'Montserrat';
  static const poppins = 'Poppins';

  static String appVersion = "";
  static String appName = "";
  static int deviceSdkInt = 0;

  static final String userProfileImage = '';


  static String token = "";
  static String baseUrl = "";
  static String baseUrlNew = "";
  static String iv = "";
  static String keyIv = "";

  static String appLink = "";
  static String ppLink = "";

  static ValueNotifier<int> bottomBarValue = ValueNotifier<int>(4);

  static SpIdModel? spIdData;
  static EndPointModel? endpoint;
  static AppDataSet? appDataSet;


  static double startHR = 15.00;
  static int mingTimer = 60;
  // static int drAdTimeTwo = 60;
  // static double drHashRateTwo = 10.6;
  // static int timeBoost = 300;
  static String superCoinValue = "0.000000001000";
  static String referralCode = '';
  static String userProfileId = '';


  static double factorFast = 0.000000000001;
  static double factorRegular = 0.0000000000005;
  static double factorMedium = 0.0000000000002;
  static double factorSlow = 0.00000000000005;
  static double factorUltraSlow = 0.000000000000005;
  static int miningIntervals = 60;


  static const locale = 'locale';
  static const dailyReward = 'dailyReward';
  static const dailyRewardTwo = 'dailyRewardTwo';
  static const btcBalance = 'btcBalance';
  static const miningTime = 'miningTime';
  static const lastMiningTime = 'lastMiningTime';
  static const lastMiningTimeSecond = 'lastMiningTimeSecond';
  static const checkMining = 'checkMining';
  static const isDarkMode = 'isDarkMode';
  static const lockMinedBTC = 'lockMinedBTC';
  static const lockMinedBTCTime = 'lockMinedBTCTime';
  static const String timeBoostUsageKey = 'time_boost_usage';
  static const String superCoin = 'super_coin';


  static final String isLogin = 'IS_LOGIN';
  static final String userEmail = 'USER_EMAIL';
  static final String userImage = 'USER_IMAGE';
  static final String userName = 'USER_NAME';
  static final String userMobile = 'USER_MOBILE';
  static final String userBtcAddress = 'USER_BtcAddress';





}
