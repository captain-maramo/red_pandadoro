import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'dart:async';

class ProgressCircleButton extends StatefulWidget {
  const ProgressCircleButton({
    Key? key,
  }) : super(key: key);
  @override
  State<ProgressCircleButton> createState() => _ProgressCircleButtonState();
}

class _ProgressCircleButtonState extends State<ProgressCircleButton> {
  int secondsLeft = 10;
  String secondsToMinAndSeconds() {
    int mins = secondsLeft ~/ 60;
    int seconds = secondsLeft % 60;
    if (seconds < 10) {
      return "$mins:0$seconds";
    }
    return "$mins:$seconds";
  }

  bool _isRunning = false;
  @override
  Widget build(BuildContext context) {
    String timerString = secondsToMinAndSeconds();

    return ElevatedButton(
      onPressed: () {
        _isRunning = !_isRunning;
        Timer.periodic(const Duration(seconds: 1), (Timer timer) {
          setState(() {
            if (secondsLeft > 0 && _isRunning) {
              secondsLeft--;
            } else {
              timer.cancel();
              secondsLeft = 1500;
            }
          });
        });
      },
      style: ElevatedButton.styleFrom(
        fixedSize: const Size(300, 300),
        shape: const CircleBorder(),
      ),
      child: CircularPercentIndicator(
        radius: 150.0,
        lineWidth: 10.0,
        percent: 1 - secondsLeft / 1500,
        center: Text(
          timerString,
          style: const TextStyle(fontSize: 64),
        ),
        progressColor: const Color.fromRGBO(46, 125, 50, 1),
        backgroundColor: Colors.black,
        backgroundWidth: 12.0,
      ),
    );
  }
}
