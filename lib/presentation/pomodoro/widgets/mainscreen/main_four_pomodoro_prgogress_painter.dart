import 'package:flutter/material.dart';

class FourPomodoroProgressPainter extends CustomPainter {
  int pomodoroCount;

  Color color;

  FourPomodoroProgressPainter(
      {required this.pomodoroCount, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    var paint1 = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke;
    var paint2 = Paint()
      ..color = color
      ..style = PaintingStyle.fill;
    paint1.strokeWidth = 1.5;
    if (pomodoroCount > 0) {
      canvas.drawCircle(const Offset(-75, 40), 8, paint2);
    }
    canvas.drawCircle(const Offset(-75, 40), 8, paint1);

    canvas.drawLine(const Offset(-67, 40), const Offset(-33, 40), paint1);
    if (pomodoroCount > 1) {
      canvas.drawCircle(const Offset(-25, 40), 8, paint2);
    }
    canvas.drawCircle(const Offset(-25, 40), 8, paint1);

    canvas.drawLine(const Offset(-17, 40), const Offset(17, 40), paint1);
    if (pomodoroCount > 2) {
      canvas.drawCircle(const Offset(25, 40), 8, paint2);
    }
    canvas.drawCircle(const Offset(25, 40), 8, paint1);

    canvas.drawLine(const Offset(33, 40), const Offset(67, 40), paint1);
    if (pomodoroCount > 3) {
      canvas.drawCircle(const Offset(75, 40), 8, paint2);
    }
    canvas.drawCircle(const Offset(75, 40), 8, paint1);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
