import 'package:hive/hive.dart';

part 'active_bot_model.g.dart';

@HiveType(typeId: 0)
class ActiveBotModel extends HiveObject {
  @HiveField(0)
  String productID;

  @HiveField(1)
  String botType;

  @HiveField(2)
  String type;

  @HiveField(3)
  String power;

  @HiveField(4)
  String powerType;

  @HiveField(5)
  String durationType;

  @HiveField(6)
  int durationSeconds;

  @HiveField(7)
  int addTime;

  @HiveField(8)
  int expireTime;

  @HiveField(9)
  int? days;

  @HiveField(10)
  int? status;

  ActiveBotModel({
    required this.productID,
    required this.botType,
    required this.type,
    required this.power,
    required this.powerType,
    required this.durationType,
    required this.durationSeconds,
    required this.addTime,
    required this.expireTime,
     this.days,
     this.status,
  });
}
