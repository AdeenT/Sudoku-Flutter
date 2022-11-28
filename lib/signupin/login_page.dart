import 'package:flutter/material.dart';
import 'package:sudoku/screens/bottom_navigation.dart';
import 'package:sudoku/signupin/signup_page.dart';
import 'package:hive_flutter/hive_flutter.dart';

late String playerName;
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _userController = TextEditingController();
  final _passController = TextEditingController();
  final loginKey = GlobalKey<FormState>();
  bool islogged = false;

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
      body: SafeArea(
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
                        hintText: 'Username'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter username';
                      } else if (islogged == false) {
                        return "username and password doesn't match";
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
                        hintText: 'Password',
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter password';
                        } else if (islogged == false) {
                          return "username and password doesn't match";
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
                        checkLogin(context);
                      },
                      style: const ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(Colors.blue),
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
    );
  }

  void checkLogin(BuildContext ctx) {
    final user = _userController;
    final pass = _passController;
    var box = Hive.box('login_db');

    for (var element in box.values) {
      if (element.username == user.text && element.password == pass.text) {
        playerName = user.text;
        islogged = true;
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const BottomBar()),
            (route) => false);
      }
    }
    if (islogged == false) {
      loginKey.currentState!.validate();
    }
  }
}
