import 'package:flutter/material.dart';
import 'package:sudoku/screens/settings.dart';
import 'package:sudoku/signupin/login_page.dart';

class Account extends StatelessWidget {
  const Account({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: const Text(
          "Personal",
          style: TextStyle(
              color: Colors.black87, fontSize: 26, fontWeight: FontWeight.w600),
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              icon: const Icon(
                Icons.settings,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Settings(),
                  ),
                );
              },
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 275),
                child: TextButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          content: SizedBox(
                            height: 300,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    _avatarPics('assets/avatars/avatar0.png'),
                                    _avatarPics('assets/avatars/avatar1.png'),
                                    _avatarPics('assets/avatars/avatar2.png'),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    _avatarPics('assets/avatars/avatar3.png'),
                                    _avatarPics('assets/avatars/avatar4.png'),
                                    _avatarPics('assets/avatars/avatar5.png'),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    _avatarPics('assets/avatars/avatar6.png'),
                                    _avatarPics('assets/avatars/avatar7.png'),
                                    _avatarPics('assets/avatars/avatar8.png'),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                  child: const Text(
                    'Avatar >',
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              CircleAvatar(
                backgroundColor: Colors.transparent,
                radius: 60,
                child: ClipRRect(
                  child: Image.asset('assets/images/user.png'),
                ),
              ),
               Text(
                playerName,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                width: 160,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                          builder: (context) => const LoginScreen(),
                        ),
                        (Route<dynamic> route) => false);
                  },
                  child: const Text(
                    'Log out',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _avatarPics(String avatar) => InkWell(
        onTap: (){
        },
        child: CircleAvatar(
          radius: 30,
          child: Image.asset(avatar),
        ),
      );
}
