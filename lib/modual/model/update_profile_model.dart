class UpdateProfileModel {
  String? email;
  String? name;
  String? btcAddress;
  String? gender;
  String? mobile;
  String? messsage;
  String? statusCode;

  UpdateProfileModel(
      {this.email,
        this.name,
        this.btcAddress,
        this.gender,
        this.mobile,
        this.messsage,
        this.statusCode});

  UpdateProfileModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    name = json['name'];
    btcAddress = json['btc_address'];
    gender = json['gender'];
    mobile = json['mobile'];
    messsage = json['messsage'];
    statusCode = json['status_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email']  = email;
    data['name']  = name;
    data['btc_address']  = btcAddress;
    data['gender']  = gender;
    data['mobile']  = mobile;
    data['messsage']  = messsage;
    data['status_code']  = statusCode;
    return data;
  }
}
