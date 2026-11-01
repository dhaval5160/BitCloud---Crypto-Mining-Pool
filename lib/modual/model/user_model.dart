class UserProfileModel {
  List<UserSubIdData>? subscription;
  String? email;
  String? name;
  String? btcAddress;
  String? gender;
  String? mobile;
  String? profileId;
  String? profileRefrenceCode;
  String? totalBtcDirect;
  String? totalBtcRefrence;
  String? factor;
  bool? adsDisplay;
  int? mingTimer;
  double? factorFast;
  double? factorRegular;
  double? factorMedium;
  double? factorSlow;
  double? factorUltraSlow;
  int? miningIntervals;
  String? messsage;
  String? statusCode;


  UserProfileModel({
    this.subscription,
    this.email,
    this.name,
    this.btcAddress,
    this.gender,
    this.mobile,
    this.profileId,
    this.profileRefrenceCode,
    this.totalBtcDirect,
    this.totalBtcRefrence,
    this.factor,
    this.adsDisplay,
    this.mingTimer,
    this.factorFast,
    this.factorRegular,
    this.factorMedium,
    this.factorSlow,
    this.factorUltraSlow,
    this.miningIntervals,
    this.messsage,
    this.statusCode,
  });

  UserProfileModel.fromJson(Map<String, dynamic> json) {
    if (json['subscription'] != null) {
      subscription = <UserSubIdData>[];
      json['subscription'].forEach((v) {
        subscription!.add(UserSubIdData.fromJson(v));
      });
    }
    email = json['email'];
    name = json['name'];
    btcAddress = json['btc_address'];
    gender = json['gender'];
    mobile = json['mobile'];
    profileId = json['profile_id'];
    profileRefrenceCode = json['profile_refrence_code'];
    totalBtcDirect = json['total_btc_direct'];
    totalBtcRefrence = json['total_btc_refrence'];
    factor = json['factor'];
    adsDisplay = json['ads_display'];
    mingTimer = json['mingTimer'];
    factorFast = json['factor_fast'];
    factorRegular = json['factor_regular'];
    factorMedium = json['factor_medium'];
    factorSlow = json['factor_slow'];
    factorUltraSlow = json['factor_ultraslow'];
    miningIntervals = json['miningIntervals'];
    messsage = json['messsage'];
    statusCode = json['status_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (subscription != null) {
      data['subscription'] = subscription!.map((v) => v.toJson()).toList();
    }
    data['email'] = email;
    data['name'] = name;
    data['btc_address'] = btcAddress;
    data['gender'] = gender;
    data['mobile'] = mobile;
    data['profile_id'] = profileId;
    data['profile_refrence_code'] = profileRefrenceCode;
    data['total_btc_direct'] = totalBtcDirect;
    data['total_btc_refrence'] = totalBtcRefrence;
    data['factor'] = factor;
    data['ads_display'] = adsDisplay;
    data['mingTimer'] = mingTimer;
    data['factor_fast'] = factorFast;
    data['factor_regular'] = factorRegular;
    data['factor_medium'] = factorMedium;
    data['factor_slow'] = factorSlow;
    data['factor_ultraslow'] = factorUltraSlow;
    data['miningIntervals'] = miningIntervals;
    data['messsage'] = messsage;
    data['status_code'] = statusCode;
    return data;
  }
}

class UserSubIdData {
  String? email;
  String? productID;
  String? botType;
  String? type;
  String? plan;
  String? power;
  String? powerType;
  String? durationType;
  int? durationSeconds;
  int? days;
  int? status;
  String? addTime;
  String? expireTime;

  UserSubIdData(
      {this.email,
      this.productID,
      this.botType,
      this.type,
      this.plan,
      this.power,
      this.powerType,
      this.durationType,
      this.durationSeconds,
      this.expireTime,
      this.status,
      this.days,
      this.addTime});

  UserSubIdData.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    productID = json['productID'];
    botType = json['botType'];
    type = json['type'];
    plan = json['plan'];
    power = json['power'];
    powerType = json['powerType'];
    durationType = json['durationType'];
    durationSeconds = json['durationSeconds'];
    addTime = json['addTime'];
    status = json['status'];
    days = json['days'];
    expireTime = json['expireTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['productID'] = productID;
    data['botType'] = botType;
    data['type'] = type;
    data['plan'] = plan;
    data['power'] = power;
    data['powerType'] = powerType;
    data['durationType'] = durationType;
    data['durationSeconds'] = durationSeconds;
    data['days'] = days;
    data['status'] = status;
    data['addTime'] = addTime;
    data['expireTime'] = expireTime;
    return data;
  }
}

