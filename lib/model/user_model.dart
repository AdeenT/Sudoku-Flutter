import 'package:hive_flutter/hive_flutter.dart';
part 'user_model.g.dart';

@HiveType(typeId: 1)
class UserModel extends HiveObject {
  @HiveField(0)
  String? id;

  @HiveField(1)
  String? username;

  @HiveField(2)
  String? password;
  
  @HiveField(3)
  int? star;

  @HiveField(4)
  String? profile;
 
  UserModel({
    this.id,
    this.username,
    this.password,
    this.star = 0,
    this.profile='mmm'
  });
}
