import 'package:flutter/material.dart';
import 'package:sudoku/controllers/settings_controllers.dart';
import 'package:sudoku/screens/account.dart';
import 'package:sudoku/screens/home_screen.dart';
import 'package:sudoku/screens/leaderboard.dart';
import 'package:get/get.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  List<Widget> lists = [
    const HomeScreen(),
    const LeaderBoard(),
    Account(userImage: 'assets/images/user.png',),
  ];
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Get.put(SettingsController().showExitPopup(context)) ,
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: activeIndex,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.window,
                ),
                label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.leaderboard_sharp,
                ),
                label: 'Leaderboard'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                ),
                label: 'Account')
          ],
          onTap: (index) {
            setState(() {
              activeIndex = index;
            });
          },
        ),
        body: lists.elementAt(activeIndex),
      ),
    );
  }
}

