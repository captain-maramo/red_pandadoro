import 'package:flutter/material.dart';

class FourPomodoroProgressPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint1 = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke;
    paint1.strokeWidth = 1.0;
    canvas.drawCircle(const Offset(-75, 40), 8, paint1);
    canvas.drawLine(const Offset(-67, 40), const Offset(-33, 40), paint1);
    canvas.drawCircle(const Offset(-25, 40), 8, paint1);
    canvas.drawLine(const Offset(-17, 40), const Offset(17, 40), paint1);
    canvas.drawCircle(const Offset(25, 40), 8, paint1);
    canvas.drawLine(const Offset(33, 40), const Offset(67, 40), paint1);
    canvas.drawCircle(const Offset(75, 40), 8, paint1);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
