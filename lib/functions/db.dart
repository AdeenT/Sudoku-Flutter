// ignore_for_file: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member, avoid_print

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:sudoku/main.dart';
import 'package:sudoku/model/user_model.dart';
import '../screens/bottom_navigation.dart';

class UserFunctions {
  ValueNotifier<bool> isLogged = ValueNotifier(false);
  dynamic userlist;
  Future<void> addLogin(UserModel login) async {
    final userDB = await Hive.openBox<UserModel>('user_model');
    await userDB.put(login.id, login);
    getUserData();
  }

  Future<List<UserModel>> getUserData() async {
    var userDB = await Hive.openBox<UserModel>('user_model');
    return userDB.values.toList();
  }

  Future<bool> loginCheck(username, password) async {
    final ulist = await getUserData();
    bool? bol;
    await Future.forEach(ulist, (UserModel element) {
      if (element.username == username && element.password == password) {
        print('checking is successful');
        print(element.id.toString());
        playerName = element.username;
        bol = true;
        isLogged.notifyListeners();
      } else {
        isLogged.notifyListeners();
      }
    });
    return bol==true? true : false;
  }

  keepUser(BuildContext context) {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const BottomBar()));
  }
}
