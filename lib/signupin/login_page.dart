// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sudoku/main.dart';
import 'package:sudoku/screens/bottom_navigation.dart';
import 'package:sudoku/signupin/signup_page.dart';
import 'package:sudoku/functions/db.dart';

// ignore: prefer_typing_uninitialized_variables
var currentUserID = 'keep';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _userController = TextEditingController();
  final _passController = TextEditingController();
  final loginKey = GlobalKey<FormState>();

  @override
  void initState() {
    currentUserID;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              'Apt ',
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 26,
                  fontWeight: FontWeight.w600),
            ),
            Text(
              'Sudoku+',
              style: TextStyle(
                  color: Colors.black87,
                  fontSize: 26,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Form(
                key: loginKey,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 24,
                    ),
                    const Text(
                      'Enjoy Free Sudoku \n          Puzzles',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 20),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    TextFormField(
                      controller: _userController,
                      decoration: const InputDecoration(
                          filled: true,
                          fillColor: Color.fromARGB(255, 240, 246, 253),
                          border: OutlineInputBorder(),
                          labelText: 'Username'),
                      validator: (value) {
                        if (value!.isEmpty ||
                            UserFunctions().isLogged.value == false) {
                          return 'Please enter a valid username';
                        } else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    TextFormField(
                        controller: _passController,
                        obscureText: true,
                        decoration: const InputDecoration(
                          filled: true,
                          fillColor: Color.fromARGB(255, 240, 246, 253),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.blue,
                            ),
                          ),
                          labelText: 'Password',
                        ),
                        validator: (value) {
                          if (value!.isEmpty ||
                              UserFunctions().isLogged.value == false) {
                            return 'Please enter a valid password';
                          } else {
                            return null;
                          }
                        }),
                    const SizedBox(
                      height: 24,
                    ),
                    SizedBox(
                      width: 100,
                      child: ElevatedButton(
                        onPressed: () {
                          loginKey.currentState!.validate();
                          checkLogin(
                              _userController.text, _passController.text);
                        },
                        style: const ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.blue),
                        ),
                        child: const Text(
                          'Log in',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const Text("Don't have any account?"),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SignupScreen(),
                            ),
                          );
                        },
                        child: const Text('Create one>>'))
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  checkLogin(userr, pass) async {
    bool b=await UserFunctions().loginCheck(userr, pass);
    if (b){
      print('it works');
      UserFunctions().keepUser(context);
    } else{
      print('else is working...');
      loginKey.currentState!.validate();
    }
  }
}
