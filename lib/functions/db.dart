import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:sudoku/model/user_model.dart';

class UserFunctions {

  bool ?isLogged ;

  ValueNotifier<List<UserModel>> userlist = ValueNotifier([]);
  Future<void> addLogin(UserModel login) async {
    final userDB = await Hive.openBox<UserModel>('user_model');
    final id = await userDB.add(login);
  }

  Future<List<UserModel>> getUserData() async {
    var userDB = await Hive.openBox<UserModel>('user_model');
    return  userDB.values.toList();
  }

  Future<void> loginCheck(username, password) async {

    List<UserModel> userDB = await getUserData();
    log(password);
    log(username);
    log(userDB.toString());
   for(int i = 0 ; i < userDB.length ; i++ ){
     if(username == userDB[i].username && password == userDB[i].password){
      
       }else{
        isLogged = false;
     }
   }
}
}