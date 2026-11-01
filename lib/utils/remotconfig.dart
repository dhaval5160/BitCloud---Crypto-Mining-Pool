import 'dart:async';
import 'dart:convert';
import 'package:cloud_mining_farm/helper/end_point_model.dart';
import 'package:cloud_mining_farm/theme/config.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';

class FirebaseRemoteConfigService {
  static final FirebaseRemoteConfigService _instance = FirebaseRemoteConfigService._internal();

  FirebaseRemoteConfigService._internal();

  factory FirebaseRemoteConfigService() => _instance;

  final FirebaseRemoteConfig firebaseRemoteConfig = FirebaseRemoteConfig.instance;

  Future<void> init() async {
    try {
      await firebaseRemoteConfig.ensureInitialized();
      await firebaseRemoteConfig.setConfigSettings(
        RemoteConfigSettings(
          fetchTimeout: const Duration(seconds: 10),
          minimumFetchInterval: Duration.zero,
        ),
      );
      await firebaseRemoteConfig.fetchAndActivate();
      getInfoData();
    } on FirebaseException {
      rethrow;
    }
  }

  String getEndJson() => firebaseRemoteConfig.getString('end_point');

  String getSpIdJson() => firebaseRemoteConfig.getString('sp_id');

  Future<EndPointModel> getEndPointData() async {
    try {
      final json = getEndJson();
      if (json.isEmpty) {
        return EndPointModel();
      }
      final Map<String, dynamic> jsonMap = jsonDecode(json);
      return EndPointModel.fromJson(jsonMap);
    } catch (e) {
      return EndPointModel();
    }
  }

  Future<SpIdModel> getSpIdData() async {
    try {
      final json = getSpIdJson();
      if (json.isEmpty) {
        return SpIdModel();
      }
      final Map<String, dynamic> jsonMap = jsonDecode(json);

      return SpIdModel.fromJson(jsonMap);
    } catch (e) {
      return SpIdModel();
    }
  }

  Future<void> getInfoData() async {
    AppConfig.baseUrl = firebaseRemoteConfig.getString('base_url');
    AppConfig.baseUrlNew = firebaseRemoteConfig.getString('base_url_new');
    AppConfig.iv = firebaseRemoteConfig.getString('iv_encrypt');
    AppConfig.keyIv = firebaseRemoteConfig.getString('key_encrypt');
    AppConfig.token = firebaseRemoteConfig.getString('api_key');

    AppConfig.spIdData = await getSpIdData();
    AppConfig.endpoint = await getEndPointData();

    // AppConfig.drHashRateTwo = AppConfig.endpoint?.dailyRewardHashRateTwo ?? 5.1;
    // AppConfig.drAdTimeTwo = AppConfig.endpoint?.dailyRewardTimeTwo ?? 0;
    // AppConfig.timeBoost = AppConfig.endpoint?.timeBoost ?? 300;
    AppConfig.superCoinValue = AppConfig.endpoint?.superCoinValue ?? "0.00000000001000";

    AppConfig.appLink = AppConfig.endpoint?.appLink ?? '';
    AppConfig.ppLink = AppConfig.endpoint?.ppLink ?? '';
  }
}
