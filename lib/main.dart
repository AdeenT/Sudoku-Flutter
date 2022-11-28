import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:sudoku/model/login_model.dart';
import 'package:sudoku/screens/splash_screen.dart';
import 'package:get/get.dart';

// ignore: prefer_typing_uninitialized_variables
late var loginDb;
Future<void> main() async {
 await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(LoginModelAdapter().typeId)) {
    Hive.registerAdapter(LoginModelAdapter());
  }
  loginDb = await Hive.openBox('login_db');
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
