import 'package:flutter/material.dart';
import 'package:sudoku/main.dart';
import 'package:sudoku/signupin/login_page.dart';

// ignore: must_be_immutable
class Account extends StatefulWidget {
  String userImage = 'assets/images/user.png';
  Account({
    Key? key,
    required this.userImage,
  }) : super(key: key);

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  @override
  void initState() {
    widget.userImage = 'assets/images/user.png';
    super.initState();
  }

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
                            height: 270,
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
                radius: 45,
                child: ClipRRect(
                  child: Image.asset(widget.userImage),
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
                    signout(context);
                  },
                  child: const Text(
                    'Log out',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(
                height: 500,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView(
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      const ListTile(
                        leading: Icon(Icons.event_note_sharp),
                        title: Text('How to Play'),
                        trailing: Icon(Icons.arrow_forward_ios),
                        tileColor: Color.fromARGB(255, 235, 249, 244),
                        iconColor: Colors.black,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const ListTile(
                        leading: Icon(Icons.feedback_outlined),
                        title: Text('Feedback'),
                        tileColor: Color.fromARGB(255, 235, 249, 244),
                        iconColor: Colors.black,
                      ),
                      const ListTile(
                        leading: Icon(Icons.info_outline),
                        title: Text('About'),
                        tileColor: Color.fromARGB(255, 235, 249, 244),
                        iconColor: Colors.black,
                      ),
                      const ListTile(
                        leading: Icon(Icons.help_outline_sharp),
                        title: Text('Help'),
                        tileColor: Color.fromARGB(255, 235, 249, 244),
                        iconColor: Colors.black,
                      ),
                      const ListTile(
                        leading: Icon(Icons.door_front_door_outlined),
                        title: Text('Exit'),
                        tileColor: Color.fromARGB(255, 235, 249, 244),
                        iconColor: Colors.black,
                      ),
                      ListTile(
                        leading: const Icon(Icons.logout),
                        title: const Text('Log out'),
                        tileColor: const Color.fromARGB(255, 235, 249, 244),
                        iconColor: Colors.red,
                        onTap: () {
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                builder: (context) => const LoginScreen(),
                              ),
                              (Route<dynamic> route) => false);
                        },
                      ),
                    ],
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
        onTap: () {
          setState(() {
            widget.userImage = avatar;
            Navigator.pop(context);
          });
        },
        child: CircleAvatar(
          radius: 30,
          child: Image.asset(avatar),
        ),
      );

  signout(BuildContext ctx) {
    Navigator.of(ctx).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (ctx1) => const LoginScreen(),
        ),
        (Route<dynamic> route) => false);
  }
}
