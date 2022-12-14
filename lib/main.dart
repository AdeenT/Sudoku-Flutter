// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:sudoku/model/user_model.dart';
import 'package:sudoku/screens/splash_screen.dart';
import 'package:get/get.dart';

late var loginDb;
late var gameDataDb;
dynamic playerName;
 int currentUserID = 0;
// ignore: constant_identifier_names
const USER_KEY = 'keep user logged in';
Future<void> main() async {
  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(UserModelAdapter().typeId)) {
    Hive.registerAdapter(UserModelAdapter());
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SplashScreen(),
    );
  }
}
