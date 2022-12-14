// ignore_for_file: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member, avoid_print

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:sudoku/main.dart';
import 'package:sudoku/model/user_model.dart';
import '../screens/bottom_navigation.dart';
String? ima;
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
        currentUserID = int.parse(element.id.toString());
        ima=element.profile;

        bol = true;
        isLogged.notifyListeners();
      } else {
        isLogged.notifyListeners();
      }
    });
    return bol == true ? true : false;
  }

  Future<void> updateUser(int id, UserModel model) async {
    final userDB = await Hive.openBox<UserModel>('user_model');
    await userDB.put(model.id, model);
    print('image updated');
    ima=model.profile;
    log(model.profile.toString(), name: 'user image');
    await getUserData();
  }

  keepUser(BuildContext context) {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const BottomBar()));
  }
}
