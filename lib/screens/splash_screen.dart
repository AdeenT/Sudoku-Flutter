import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sudoku/main.dart';
import 'package:sudoku/screens/bottom_navigation.dart';
import 'package:sudoku/signupin/login_page.dart';
import'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 2),
      (){
        keepUserLoggedIn();
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              'assets/images/splashlogo.png',
              height: 210.0,
              width: 210.0,
            ),
            const CircularProgressIndicator.adaptive(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.blue)),
          ],
        ),
      ),
    );
  }

  void keepUserLoggedIn() async{

    final sharedprefs = await SharedPreferences.getInstance();
    final userLoggedIn = sharedprefs.getBool(USER_KEY);
    if(userLoggedIn == null|| userLoggedIn == false){
      Get.offAll(()=>const LoginScreen());
    }else{
      
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>const BottomBar()),);
    }

  }
}
