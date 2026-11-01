class WithdrawDetailsModel {
  String? totalBtcDirect;
  String? totalBtcRefrence;
  String? totalBtcWithdraw;
  List<WDData>? data;
  String? messsage;
  String? statusCode;

  WithdrawDetailsModel({
    this.totalBtcDirect,
    this.totalBtcRefrence,
    this.totalBtcWithdraw,
    this.data,
    this.messsage,
    this.statusCode,
  });

  WithdrawDetailsModel.fromJson(Map<String, dynamic> json) {
    totalBtcDirect = json['total_btc_direct'];
    totalBtcRefrence = json['total_btc_refrence'];
    totalBtcWithdraw = json['total_btc_withdraw'];
    if (json['data'] != null) {
      data = <WDData>[];
      json['data'].forEach((v) {
        data!.add(WDData.fromJson(v));
      });
    }
    messsage = json['messsage'];
    statusCode = json['status_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['total_btc_direct'] = totalBtcDirect;
    data['total_btc_refrence'] = totalBtcRefrence;
    data['total_btc_withdraw'] = totalBtcWithdraw;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['messsage'] = messsage;
    data['status_code'] = statusCode;
    return data;
  }
}

class WDData {
  String? email;
  String? dr;
  String? status;
  String? date;
  String? time;

  WDData({this.email, this.dr, this.status, this.date, this.time});

  WDData.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    dr = json['dr'];
    status = json['status'];
    date = json['date'];
    time = json['time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['dr'] = dr;
    data['status'] = status;
    data['date'] = date;
    data['time'] = time;
    return data;
  }
}
