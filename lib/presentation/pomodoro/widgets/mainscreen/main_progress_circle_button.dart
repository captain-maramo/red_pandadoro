import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class ProgressCircleButton extends StatelessWidget {
  const ProgressCircleButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        fixedSize: const Size(300, 300),
        shape: const CircleBorder(),
      ),
      child: CircularPercentIndicator(
        radius: 150.0,
        lineWidth: 10.0,
        percent: 1.0,
        center: const Text(
          "25:00",
          style: TextStyle(fontSize: 64),
        ),
        progressColor: const Color.fromRGBO(46, 125, 50, 1),
        backgroundColor: Colors.black,
        backgroundWidth: 12.0,
      ),
    );
  }
}
