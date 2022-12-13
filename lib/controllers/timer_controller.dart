import 'dart:async';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:sudoku/controllers/game_controller.dart';

class TimerController extends GetxController {
  final controller = Get.put(GameController());
  // ignore: unused_field
  Timer? _timer;

  int remainingSeconds = 1;
  final time = '00.00'.obs;

  @override
  void onReady() {
    _startTimer(900);
    super.onReady();
  }
  
  _startTimer(int seconds) {
    const duration = Duration(seconds: 1);
    remainingSeconds = seconds;
    _timer = Timer.periodic(duration, (Timer timer) {
      if (remainingSeconds == 0) {
        timer.cancel();
        return showGameOverDialog("Game Over!");
      } else if (controller.isComplete()) {
       return timer.cancel();
      } else {
        int minutes = remainingSeconds ~/ 60;
        int seconds = (remainingSeconds % 60);
        time.value =
            "${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}";
        remainingSeconds--;
      }
    });
  }

  void showGameOverDialog(String text) => Get.defaultDialog(
        title: text,
        content: SizedBox(
          height: 50,
          child: TextButton(
            onPressed: () => Get.back(),
            child: const Text('Start New Game'),
          ),
        ),
      );
}
