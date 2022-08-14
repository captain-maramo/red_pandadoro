import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:red_pandadoro/infrastructure/models/last_button_pressed.dart';

class ProgressCircleButton extends StatefulWidget {
  const ProgressCircleButton(
      {Key? key,
      required this.lastButtonPressedBox,
      required this.notifyParent,
      required this.color,
      required this.timerString,
      required this.percent})
      : super(key: key);

  final Box lastButtonPressedBox;
  final Function() notifyParent;
  final Color color;
  final String timerString;
  final double percent;

  @override
  State<ProgressCircleButton> createState() => _ProgressCircleButtonState();
}

class _ProgressCircleButtonState extends State<ProgressCircleButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        widget.lastButtonPressedBox.put(
            "lastButtonPressed", LastButtonPressed(buttonName: "start_pause"));
        widget.notifyParent();
      },
      style: ElevatedButton.styleFrom(
        fixedSize: const Size(300, 300),
        shape: const CircleBorder(),
      ),
      child: CircularPercentIndicator(
        radius: 150.0,
        lineWidth: 10.0,
        percent: widget.percent,
        center: Text(
          widget.timerString,
          style: const TextStyle(fontSize: 64),
        ),
        progressColor: widget.color,
        backgroundColor: Colors.black.withOpacity(0.5),
        backgroundWidth: 12.0,
      ),
    );
  }
}
