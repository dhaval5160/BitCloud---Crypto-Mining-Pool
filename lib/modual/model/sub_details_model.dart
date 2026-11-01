class SubDetailsModel {
  bool? purchase;
  List<ListPlan>? listPlan;
  List<ListReward>? listReward;
  List<Leaderboard>? leaderboard;

  SubDetailsModel(
      {this.purchase, this.listPlan, this.listReward, this.leaderboard});

  SubDetailsModel.fromJson(Map<String, dynamic> json) {
    purchase = json['purchase'];
    if (json['ListPlan'] != null) {
      listPlan = <ListPlan>[];
      json['ListPlan'].forEach((v) {
        listPlan!.add(ListPlan.fromJson(v));
      });
    }
    if (json['ListReward'] != null) {
      listReward = <ListReward>[];
      json['ListReward'].forEach((v) {
        listReward!.add(ListReward.fromJson(v));
      });
    }
    if (json['leaderboard'] != null) {
      leaderboard = <Leaderboard>[];
      json['leaderboard'].forEach((v) {
        leaderboard!.add(Leaderboard.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['purchase'] = purchase;
    if (listPlan != null) {
      data['ListPlan'] = listPlan!.map((v) => v.toJson()).toList();
    }
    if (listReward != null) {
      data['ListReward'] = listReward!.map((v) => v.toJson()).toList();
    }
    if (leaderboard != null) {
      data['leaderboard'] = leaderboard!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ListPlan {
  String? planName;
  num? power;
  String? powerType;
  String? miningBoost;
  String? miningPower;
  int? adTime;
  int? miner;
  List<Plans>? plans;
  bool? planads;
  String? description;

  ListPlan({
    this.planName,
    this.power,
    this.powerType,
    this.miningBoost,
    this.miningPower,
    this.adTime,
    this.miner,
    this.plans,
    this.planads,
    this.description,
  });

  ListPlan.fromJson(Map<String, dynamic> json) {
    planName = json['planName'];
    power = json['power'];
    powerType = json['powerType'];
    miningBoost = json['mining_boost'];
    miningPower = json['mining_power'];
    adTime = json['adTime'];
    miner = json['miner'];
    if (json['plans'] != null) {
      plans = <Plans>[];
      json['plans'].forEach((v) {
        plans!.add(Plans.fromJson(v));
      });
    }
    planads = json['planads'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['planName'] = planName;
    data['power'] = power;
    data['powerType'] = powerType;
    data['mining_boost'] = miningBoost;
    data['mining_power'] = miningPower;
    data['adTime'] = adTime;
    data['miner'] = miner;
    if (plans != null) {
      data['plans'] = plans!.map((v) => v.toJson()).toList();
    }
    data['planads'] = planads;
    data['description'] = description;
    return data;
  }
}

class Plans {
  String? planId;
  String? planTime;
  num? amount;
  num? discount;
  int? durationSeconds;
  String? price;
  String? description;
  String? rate;
  String? rateTax;

  Plans({
    this.planId,
    this.planTime,
    this.amount,
    this.discount,
    this.durationSeconds,
    this.price,
    this.description,
    this.rate,
    this.rateTax,
  });

  Plans.fromJson(Map<String, dynamic> json) {
    planId = json['planId'];
    planTime = json['planTime'];
    amount = json['amount'];
    discount = json['discount'];
    durationSeconds = json['durationSeconds'];
    price = json['price'];
    description = json['description'];
    rate = json['rate'];
    rateTax = json['rate_tax'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['planId'] = planId;
    data['planTime'] = planTime;
    data['amount'] = amount;
    data['discount'] = discount;
    data['durationSeconds'] = durationSeconds;
    data['price'] = price;
    data['description'] = description;
    data['rate'] = rate;
    data['rate_tax'] = rateTax;
    return data;
  }
}

class ListReward {
  String? rewardName;
  String? task;
  String? reward;
  String? rewardUnit;
  int? time;
  String? rewardType;
  int? renewTime;
  bool? availble;

  ListReward({
    this.rewardName,
    this.task,
    this.reward,
    this.rewardUnit,
    this.time,
    this.rewardType,
    this.renewTime,
    this.availble,
  });

  ListReward.fromJson(Map<String, dynamic> json) {
    rewardName = json['reward_name'];
    task = json['task'];
    reward = json['reward'];
    rewardUnit = json['reward_unit'];
    time = json['time'];
    rewardType = json['reward_type'];
    renewTime = json['renew_time'];
    availble = json['availble'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['reward_name'] = rewardName;
    data['task'] = task;
    data['reward'] = reward;
    data['reward_unit'] = rewardUnit;
    data['time'] = time;
    data['reward_type'] = rewardType;
    data['renew_time'] = renewTime;
    data['availble'] = availble;
    return data;
  }
}

class Leaderboard {
  String? name;
  String? btc;
  String? message;

  Leaderboard({this.name, this.btc, this.message});

  Leaderboard.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    btc = json['btc'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['btc'] = btc;
    data['message'] = message;
    return data;
  }
}
