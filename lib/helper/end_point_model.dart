class EndPointModel {
  String? api;
  String? login;
  String? addBtc;
  String? addBtcNew;
  String? viewBtc;
  String? addWithdraw;
  String? viewWithdraw;
  String? deleteBtc;
  String? subscriptionBtc;
  String? subscriptionAdd;
  String? subscriptionAddError;
  String? profile;
  String? ads;
  String? appLink;
  String? ppLink;
  String? superCoinValue;
  double? startHashRate;
  double? startingReward;
  double? dailyRewardHashRateTwo;
  int? dailyRewardTimeTwo;
  int? timeBoost;


  EndPointModel({
    this.api,
    this.login,
    this.addBtc,
    this.addBtcNew,
    this.viewBtc,
    this.addWithdraw,
    this.viewWithdraw,
    this.deleteBtc,
    this.subscriptionBtc,
    this.subscriptionAdd,
    this.subscriptionAddError,
    this.profile,
    this.ads,
    this.appLink,
    this.ppLink,
    this.startHashRate,
    this.startingReward,
    this.dailyRewardHashRateTwo,
    this.dailyRewardTimeTwo,
    this.timeBoost,
    this.superCoinValue,
  });

  EndPointModel.fromJson(Map<String, dynamic> json) {
    api = json['api'];
    login = json['login'];
    addBtc = json['add_btc'];
    addBtcNew = json['add_btc_new'];
    viewBtc = json['view_btc'];
    addWithdraw = json['add_withdraw'];
    viewWithdraw = json['view_withdraw'];
    deleteBtc = json['delete_btc'];
    subscriptionBtc = json['subscription_btc'];
    subscriptionAdd = json['subscription_add'];
    subscriptionAddError = json['subscriptionAddError'];
    profile = json['profile'];
    ads = json['ads'];
    appLink = json['appLink'];
    ppLink = json['ppLink'];
    startHashRate = json['startHashRate'];
    startingReward = json['startingreward'];
    dailyRewardHashRateTwo = json['dailyRewardHashRateTwo'];
    dailyRewardTimeTwo = json['dailyRewardTimeTwo'];
    timeBoost = json['timeBoost'];
    superCoinValue = json['super_coin_value'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['api'] = api;
    data['login'] = login;
    data['add_btc'] = addBtc;
    data['add_btc_new'] = addBtcNew;
    data['view_btc'] = viewBtc;
    data['add_withdraw'] = addWithdraw;
    data['view_withdraw'] = viewWithdraw;
    data['delete_btc'] = deleteBtc;
    data['subscription_btc'] = subscriptionBtc;
    data['subscription_add'] = subscriptionAdd;
    data['subscriptionAddError'] = subscriptionAddError;
    data['profile'] = profile;
    data['ads'] = ads;
    data['appLink'] = appLink;
    data['ppLink'] = ppLink;
    data['startHashRate'] = startHashRate;
    data['startingreward'] = startingReward;
    data['dailyRewardHashRateTwo'] = dailyRewardHashRateTwo;
    data['dailyRewardTimeTwo'] = dailyRewardTimeTwo;
    data['timeBoost'] = timeBoost;
    data['super_coin_value'] = superCoinValue;

    return data;
  }
}

class SpIdModel {
  List<String>? listSpId;

  SpIdModel({this.listSpId});

  SpIdModel.fromJson(Map<String, dynamic> json) {
    listSpId = json['list_spId'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['list_spId'] = listSpId;
    return data;
  }
}
