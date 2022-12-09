import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:sudoku/model/login_model.dart';

class LeaderBoard extends StatelessWidget {
  const LeaderBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text(
          'Top Players',
          style: TextStyle(
              color: Colors.white, fontSize: 26, fontWeight: FontWeight.w600),
        ),
        backgroundColor: Colors.blue,
      ),
    );
  }
}
