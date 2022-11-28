import 'package:hive_flutter/hive_flutter.dart';
part 'login_model.g.dart';

@HiveType(typeId: 1)
class LoginModel extends HiveObject {
  @HiveField(0)
  int? id;

  @HiveField(1)
  final String username;

  @HiveField(2)
  final String password;

  @HiveField(3)
  final String leaderboard;
  LoginModel({required this.username, required this.password, required this.leaderboard, this.id});
}
