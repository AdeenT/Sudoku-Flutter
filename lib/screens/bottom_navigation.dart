import 'package:flutter/material.dart';
import 'package:sudoku/screens/account.dart';
import 'package:sudoku/screens/home_screen.dart';
import 'package:sudoku/screens/leaderboard.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  List<Widget> lists = [
    const HomeScreen(),
    const LeaderBoard(),
    Account(userImage: '',),
  ];
  int activeIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    );
  }
}
