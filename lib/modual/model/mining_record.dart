class MiningRecordModel {
  String? totalBtcDirect;
  String? totalBtcRefrence;
  List<TimeLineData>? data;
  String? messsage;
  String? statusCode;

  MiningRecordModel({
    this.totalBtcDirect,
    this.totalBtcRefrence,
    this.data,
    this.messsage,
    this.statusCode,
  });

  MiningRecordModel.fromJson(Map<String, dynamic> json) {
    totalBtcDirect = json['total_btc_direct'];
    totalBtcRefrence = json['total_btc_refrence'];
    if (json['data'] != null) {
      data = <TimeLineData>[];
      json['data'].forEach((v) {
        data!.add(TimeLineData.fromJson(v));
      });
    }
    messsage = json['messsage'];
    statusCode = json['status_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['total_btc_direct'] = totalBtcDirect;
    data['total_btc_refrence'] = totalBtcRefrence;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['messsage'] = messsage;
    data['status_code'] = statusCode;

    return data;
  }
}

class TimeLineData {
  String? email;
  String? cr;
  String? type;
  String? date;
  String? time;

  TimeLineData({this.email, this.cr, this.type, this.date, this.time});

  TimeLineData.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    cr = json['cr'];
    type = json['type'];
    date = json['date'];
    time = json['time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['cr'] = cr;
    data['type'] = type;
    data['date'] = date;
    data['time'] = time;
    return data;
  }
}
