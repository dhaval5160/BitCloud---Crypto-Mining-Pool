class AddWDModel {
  String? messsage;
  String? statusCode;
  double? blanace;

  AddWDModel({this.messsage, this.statusCode, this.blanace});

  AddWDModel.fromJson(Map<String, dynamic> json) {
    messsage = json['messsage'];
    statusCode = json['status_code'];
    blanace = json['blanace'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['messsage'] = messsage;
    data['status_code'] = statusCode;
    data['blanace'] = blanace;
    return data;
  }
}