import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:sudoku/model/game_data_model.dart';
import 'package:sudoku/model/login_model.dart';

Rx<LoginModel?> userData = Rx<LoginModel?>(null);

Future<void> addUserData(LoginModel user) async {
  var userDb = await Hive.openBox('user_db');
  final id = await userDb.add(user);
}

Future<LoginModel?> getUser(String uid)async{
  var userDb = await Hive.openBox('user_db');
  userData.value = userDb.get(uid);
}
Future<void> addGameData(LoginModel user,GameDataModel star ) async {
  var gameDb = await Hive.openBox('game_db');

   await gameDb.put(user.uid,star);
}

