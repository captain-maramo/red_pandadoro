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

  bool _isRunning = true;
  @override
  Widget build(BuildContext context) {
    String timer = secondsToMinAndSeconds();

    return ElevatedButton(
      onPressed: () {
        Timer.periodic(const Duration(seconds: 1), (Timer timer) {
          if (!_isRunning) {
            timer.cancel();
          }
          setState(() {
            if (secondsLeft > 0) {
              secondsLeft--;
            } else {
              timer.cancel();
              secondsLeft = 1500;
            }
          });
        });
        super.initState();
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
          timer,
          style: const TextStyle(fontSize: 64),
        ),
        progressColor: const Color.fromRGBO(46, 125, 50, 1),
        backgroundColor: Colors.black,
        backgroundWidth: 12.0,
      ),
    );
  }
}
