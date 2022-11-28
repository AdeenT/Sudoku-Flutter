import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'game_page.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: const Text(
          'Sudoku+',
          style: TextStyle(
              color: Colors.black87, fontSize: 26, fontWeight: FontWeight.w600),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 250,
            ),
            const Align(
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.only(right: 150),
                child: Text(
                  'Apt',
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 32,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
            const Text(
              'Sudoku+',
              style: TextStyle(
                  color: Colors.black87,
                  fontSize: 32,
                  fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 200,
            ),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Center(
                        child: Text('Choose Difficulty'),
                      ),
                      content: SizedBox(
                        height: 224,
                        child: Column(
                          children: [
                            _difficultyButton('Beginner', 1),
                            _difficultyButton('Easy', 2),
                            _difficultyButton('Medium', 3),
                            _difficultyButton('Hard', 4),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.blue),
              ),
              child: const Text(
                'New Game',
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _difficultyButton(String text, int difficult) => ListTile(
        title: Text(
          text,
        ),
        tileColor: const Color.fromARGB(255, 235, 249, 244),
        onTap: () {
          Get.to(GamePage(difficult: difficult));
        },
      );
}
