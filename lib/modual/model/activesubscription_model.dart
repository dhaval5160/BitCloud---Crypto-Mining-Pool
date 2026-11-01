class ActiveSubscriptionModel {
  String? productId;
  String? transactionDate;
  String? purchaseID;
  String? status;
  VerificationData? verificationData;
  bool? isPending;
  bool? isAutoRenewing;
  String? originalJson;

  ActiveSubscriptionModel(
      {this.productId,
        this.transactionDate,
        this.purchaseID,
        this.status,
        this.verificationData,
        this.isPending,
        this.isAutoRenewing,
        this.originalJson});

  ActiveSubscriptionModel.fromJson(Map<String, dynamic> json) {
    productId = json['productId'];
    transactionDate = json['transactionDate'];
    purchaseID = json['purchaseID'];
    status = json['status'];
    verificationData = json['verificationData'] != null
        ? VerificationData.fromJson(json['verificationData'])
        : null;
    isPending = json['isPending'];
    isAutoRenewing = json['isAutoRenewing'];
    originalJson = json['originalJson'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['productId'] =productId;
    data['transactionDate'] =transactionDate;
    data['purchaseID'] =purchaseID;
    data['status'] =status;
    if (verificationData != null) {
      data['verificationData'] =verificationData!.toJson();
    }
    data['isPending'] =isPending;
    data['isAutoRenewing'] =isAutoRenewing;
    data['originalJson'] =originalJson;
    return data;
  }
}

class VerificationData {
  String? localVerificationData;
  String? serverVerificationData;
  String? source;

  VerificationData(
      {this.localVerificationData, this.serverVerificationData, this.source});

  VerificationData.fromJson(Map<String, dynamic> json) {
    localVerificationData = json['localVerificationData'];
    serverVerificationData = json['serverVerificationData'];
    source = json['source'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['localVerificationData'] =localVerificationData;
    data['serverVerificationData'] =serverVerificationData;
    data['source'] =source;
    return data;
  }
}
