// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:hive_flutter/hive_flutter.dart';

part 'login_model.g.dart';

@HiveType(typeId: 1)
class LoginModel extends HiveObject {
  @HiveField(0)
  int? uid;

  @HiveField(1)
  final String username;

  @HiveField(2)
  final String password;

  LoginModel({
    this.uid,
    required this.username,
    required this.password,
  });
}
