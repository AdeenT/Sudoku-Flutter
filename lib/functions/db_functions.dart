// ignore_for_file: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:sudoku/model/login_model.dart';

import '../main.dart';

ValueNotifier<List<LoginModel>> usersNotifier = ValueNotifier([]);

Future<void> addUser(LoginModel value) async {
  final id = await loginDb.add(value);
  value.id = id;
  usersNotifier.notifyListeners();
}

Future<void> getAllUsers() async {
  final userDb = await Hive.openBox<LoginModel>('LeaderBoard_db');
  usersNotifier.value.clear();
  usersNotifier.value.addAll(userDb.values);
  usersNotifier.notifyListeners();
}

Future<void> userAvatar() async{
  final avatarDB = await Hive.openBox('Avatar_Db');
  
  usersNotifier.notifyListeners();
}