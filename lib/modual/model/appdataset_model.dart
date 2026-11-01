class AppDataSetModel {
  AppDataSet? appDataSet;

  AppDataSetModel({this.appDataSet});

  AppDataSetModel.fromJson(Map<String, dynamic> json) {
    appDataSet = json['AppDataSet'] != null ? AppDataSet.fromJson(json['AppDataSet']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (appDataSet != null) {
      data['AppDataSet'] = appDataSet!.toJson();
    }
    return data;
  }
}

class AppDataSet {
  double? withdrawalLimit;
  double? btcPriceInUSD;
  String? withdrwalText;
  bool? appOpen;
  String? nblColor;
  String? nbDColor;
  double? startHashRate;
  double? dailyRewardHashRate;
  int? dailyRewardTime;
  int? timeBoost;
  double? dailyRewardHashRateTwo;
  int? dailyRewardTimeTwo;
  bool? startRewardadsFirstime;
  double? referEarn;
  int? interstitialBackAdCount;
  int? interstitialAdCount;
  int? interstitialAdCountBottomNav;
  bool? showInterstitial;
  bool? showInterstitialStartGiftPlan;
  String? googleInterstitialId;
  String? adxInterstitialId;
  bool? googleNativeAdStatus;
  String? googleNativeId;
  String? adxNativeId;
  bool? googleLargeBannerAdStatus;
  bool? googleBannerAdStatus;
  String? googleBannerId;
  String? adxBannerId;
  bool? googleAppOpenAdStatus;
  String? googleAppOpenId;
  String? adxAppOpenId;
  String? googleRewardedId;
  bool? googleRewardedStatus;
  String? adxRewardedId;
  String? googleRewardedIntrestialId;
  String? adxRewardedIntrestialId;
  bool? googleRewardedIntrestialStatus;
  bool? googleRewardedNewInt;
  int? start;
  int? gift;
  int? planads;
  String? googleAdaptiveId;
  bool? googleAdaptiveStatus;
  String? contactEmail;
  String? contactWhatsapp;
  int? minMiners;
  int? maxMiners;
  bool? rewardPreload;
  String? bgAppOpenId;
  String? bgAdxAppOpenId;
  String? ontapRewardedId;
  String? ontapAdxRewardedId;

  AppDataSet({
    this.withdrawalLimit,
    this.btcPriceInUSD,
    this.withdrwalText,
    this.appOpen,
    this.nblColor,
    this.nbDColor,
    this.startHashRate,
    this.dailyRewardHashRate,
    this.dailyRewardTime,
    this.timeBoost,
    this.dailyRewardHashRateTwo,
    this.dailyRewardTimeTwo,
    this.startRewardadsFirstime,
    this.referEarn,
    this.interstitialBackAdCount,
    this.interstitialAdCount,
    this.interstitialAdCountBottomNav,
    this.showInterstitial,
    this.showInterstitialStartGiftPlan,
    this.googleInterstitialId,
    this.adxInterstitialId,
    this.googleNativeAdStatus,
    this.googleNativeId,
    this.adxNativeId,
    this.googleLargeBannerAdStatus,
    this.googleBannerAdStatus,
    this.googleBannerId,
    this.adxBannerId,
    this.googleAppOpenAdStatus,
    this.googleAppOpenId,
    this.adxAppOpenId,
    this.googleRewardedId,
    this.googleRewardedStatus,
    this.adxRewardedId,
    this.googleRewardedIntrestialId,
    this.adxRewardedIntrestialId,
    this.googleRewardedIntrestialStatus,
    this.googleRewardedNewInt,
    this.start,
    this.gift,
    this.planads,
    this.googleAdaptiveId,
    this.googleAdaptiveStatus,
    this.contactEmail,
    this.contactWhatsapp,
    this.minMiners,
    this.maxMiners,
    this.rewardPreload,
    this.bgAppOpenId,
    this.bgAdxAppOpenId,
    this.ontapRewardedId,
    this.ontapAdxRewardedId,
  });

  AppDataSet.fromJson(Map<String, dynamic> json) {
    withdrawalLimit = json['withdrawalLimit'];
    btcPriceInUSD = json['BtcPriceInUSD'];
    withdrwalText = json['withdrwal_text'];
    appOpen = json['appOpen'];
    nblColor = json['nblColor'];
    nbDColor = json['nbDColor'];
    startHashRate = json['startHashRate'];
    dailyRewardHashRate = json['dailyRewardHashRate'];
    dailyRewardTime = json['dailyRewardTime'];
    timeBoost = json['timeBoost'];
    dailyRewardHashRateTwo = json['dailyRewardHashRateTwo'];
    dailyRewardTimeTwo = json['dailyRewardTimeTwo'];
    startRewardadsFirstime = json['start_rewardads_firstime'];
    referEarn = json['refer_earn'];
    interstitialBackAdCount = json['interstitial_back_ad_count'];
    interstitialAdCount = json['interstitial_ad_count'];
    interstitialAdCountBottomNav = json['interstitial_ad_count_bottom_nav'];
    showInterstitial = json['show_interstitial'];
    showInterstitialStartGiftPlan = json['show_interstitial_start_gift_plan'];
    googleInterstitialId = json['google_interstitial_id'];
    adxInterstitialId = json['adx_interstitial_id'];
    googleNativeAdStatus = json['google_native_ad_status'];
    googleNativeId = json['google_native_id'];
    adxNativeId = json['adx_native_id'];
    googleLargeBannerAdStatus = json['google_large_banner_ad_status'];
    googleBannerAdStatus = json['google_banner_ad_status'];
    googleBannerId = json['google_banner_id'];
    adxBannerId = json['adx_banner_id'];
    googleAppOpenAdStatus = json['google_app_open_ad_status'];
    googleAppOpenId = json['google_app_open_id'];
    adxAppOpenId = json['adx_app_open_id'];
    googleRewardedId = json['google_rewarded_id'];
    googleRewardedStatus = json['google_rewarded_status'];
    adxRewardedId = json['adx_rewarded_id'];
    googleRewardedIntrestialId = json['google_rewarded_intrestial_id'];
    adxRewardedIntrestialId = json['adx_rewarded_intrestial_id'];
    googleRewardedIntrestialStatus = json['google_rewarded_intrestial_status'];
    googleRewardedNewInt = json['google_rewarded_new_int'];
    start = json['start'];
    gift = json['gift'];
    planads = json['planads'];
    googleAdaptiveId = json['google_adaptive_id'];
    googleAdaptiveStatus = json['google_adaptive_status'];
    contactEmail = json['contact_email'];
    contactWhatsapp = json['contact_whatsapp'];
    minMiners = json['min_miners'];
    maxMiners = json['max_miners'];
    rewardPreload = json['reward_preload'];
    bgAppOpenId = json['bg_app_open_id'];
    bgAdxAppOpenId = json['bg_adx_app_open_id'];
    ontapRewardedId = json['ontap_rewarded_id'];
    ontapAdxRewardedId = json['ontap_adx_rewarded_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['withdrawalLimit'] = withdrawalLimit;
    data['BtcPriceInUSD'] = btcPriceInUSD;
    data['withdrwal_text'] = withdrwalText;
    data['appOpen'] = appOpen;
    data['nblColor'] = nblColor;
    data['nbDColor'] = nbDColor;
    data['startHashRate'] = startHashRate;
    data['dailyRewardHashRate'] = dailyRewardHashRate;
    data['dailyRewardTime'] = dailyRewardTime;
    data['timeBoost'] = timeBoost;
    data['dailyRewardHashRateTwo'] = dailyRewardHashRateTwo;
    data['dailyRewardTimeTwo'] = dailyRewardTimeTwo;
    data['start_rewardads_firstime'] = startRewardadsFirstime;
    data['refer_earn'] = referEarn;
    data['interstitial_back_ad_count'] = interstitialBackAdCount;
    data['interstitial_ad_count'] = interstitialAdCount;
    data['interstitial_ad_count_bottom_nav'] = interstitialAdCountBottomNav;
    data['show_interstitial'] = showInterstitial;
    data['show_interstitial_start_gift_plan'] = showInterstitialStartGiftPlan;
    data['google_interstitial_id'] = googleInterstitialId;
    data['adx_interstitial_id'] = adxInterstitialId;
    data['google_native_ad_status'] = googleNativeAdStatus;
    data['google_native_id'] = googleNativeId;
    data['adx_native_id'] = adxNativeId;
    data['google_large_banner_ad_status'] = googleLargeBannerAdStatus;
    data['google_banner_ad_status'] = googleBannerAdStatus;
    data['google_banner_id'] = googleBannerId;
    data['adx_banner_id'] = adxBannerId;
    data['google_app_open_ad_status'] = googleAppOpenAdStatus;
    data['google_app_open_id'] = googleAppOpenId;
    data['adx_app_open_id'] = adxAppOpenId;
    data['google_rewarded_id'] = googleRewardedId;
    data['google_rewarded_status'] = googleRewardedStatus;
    data['adx_rewarded_id'] = adxRewardedId;
    data['google_rewarded_intrestial_id'] = googleRewardedIntrestialId;
    data['adx_rewarded_intrestial_id'] = adxRewardedIntrestialId;
    data['google_rewarded_intrestial_status'] = googleRewardedIntrestialStatus;
    data['google_rewarded_new_int'] = googleRewardedNewInt;
    data['start'] = start;
    data['gift'] = gift;
    data['planads'] = planads;
    data['google_adaptive_id'] = googleAdaptiveId;
    data['google_adaptive_status'] = googleAdaptiveStatus;
    data['contact_email'] = contactEmail;
    data['contact_whatsapp'] = contactWhatsapp;
    data['min_miners'] = minMiners;
    data['max_miners'] = maxMiners;
    data['reward_preload'] = rewardPreload;
    data['bg_app_open_id'] = bgAppOpenId;
    data['bg_adx_app_open_id'] = bgAdxAppOpenId;
    data['ontap_rewarded_id'] = ontapRewardedId;
    data['ontap_adx_rewarded_id'] = ontapAdxRewardedId;
    return data;
  }
}
