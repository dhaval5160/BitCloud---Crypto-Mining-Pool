class AddBtcModel {
  String? email;
  String? profileId;
  String? profileRefrenceCode;
  String? totalBtcDirect;
  String? totalBtcRefrence;
  String? messsage;
  String? statusCode;

  AddBtcModel(
      {this.email,
        this.profileId,
        this.profileRefrenceCode,
        this.totalBtcDirect,
        this.totalBtcRefrence,
        this.messsage,
        this.statusCode});

  AddBtcModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    profileId = json['profile_id'];
    profileRefrenceCode = json['profile_refrence_code'];
    totalBtcDirect = json['total_btc_direct'];
    totalBtcRefrence = json['total_btc_refrence'];
    messsage = json['messsage'];
    statusCode = json['status_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['profile_id'] = profileId;
    data['profile_refrence_code'] = profileRefrenceCode;
    data['total_btc_direct'] = totalBtcDirect;
    data['total_btc_refrence'] = totalBtcRefrence;
    data['messsage'] = messsage;
    data['status_code'] = statusCode;
    return data;
  }
}
