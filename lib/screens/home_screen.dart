import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sudoku/model/user_model.dart';
import 'game_page.dart';

var starLength = '';
var starsCollected = 0;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  
  @override
  void initState() {
    setState(() {
      starLength = starsCollected.toString();
    });
    super.initState();
  }

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
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: 30,
                child: ListTile(
                  leading: const Icon(
                    Icons.star_rate_rounded,
                    color: Colors.amber,
                    size: 40,
                  ),
                  title: Text(
                    starsCollected.toString(),
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 220,
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
      ),
    );
  }

  Widget _difficultyButton(String text, int difficult) => ListTile(
        title: Text(
          text,
        ),
        tileColor: const Color.fromARGB(255, 235, 249, 244),
        onTap: () {
          Get.off(GamePage(difficult: difficult));
        },
      );

  void starCount(UserModel value) async {
    starLength = starsCollected.toString();
    UserModel(id:value.id ,star: value.star);

    

  }
}
