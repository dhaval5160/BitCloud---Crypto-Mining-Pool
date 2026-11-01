class MiningPlan {
  final String? planId;
  final String? planName;
  final String? miner;
  final int? minerCount;
  final String? power;
  final String? miningRig;
  final String? algorithm;
  final int? amount;
  final int? discountPercentage;
  final int? adTime;
  final String? validity;
  final String? benchmarkValue;
  final bool? planads;

  MiningPlan( {
     this.planId,
     this.planName,
     this.miner,
     this.minerCount,
     this.power,
     this.miningRig,
     this.algorithm,
     this.amount,
     this.discountPercentage,
     this.adTime,
     this.validity,
     this.benchmarkValue,
     this.planads,
  });

  factory MiningPlan.fromJson(Map<String, dynamic> json) {
    return MiningPlan(
      planId: json['plan_id'],
      planName: json['plan_Name'],
      miner: json['miner'],
      minerCount: json['miner_count'],
      power: json['power'],
      miningRig: json['mining_rig'],
      algorithm: json['algorithm'],
      amount: json['amount'],
      discountPercentage: json['discount_p'],
      adTime: json['adTime'],
      validity: json['validity'],
      benchmarkValue: json['benchmarkValue'],
      planads: json['planads'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'plan_id': planId,
      'plan_Name': planName,
      'miner': miner,
      'miner_count': minerCount,
      'power': power,
      'mining_rig': miningRig,
      'algorithm': algorithm,
      'amount': amount,
      'discount_p': discountPercentage,
      'adTime': adTime,
      'validity': validity,
      'benchmarkValue': benchmarkValue,
      'planads': planads,
    };
  }
}
