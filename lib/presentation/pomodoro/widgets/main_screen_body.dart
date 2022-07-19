import 'package:flutter/material.dart';

import 'button_row.dart';
import 'four_pomodoro_prgogress_painter.dart';
import 'progress_circle_button.dart';
import 'todo_field.dart';

class MainScreenBody extends StatelessWidget {
  const MainScreenBody({
    Key? key,
    required this.themeData,
  }) : super(key: key);

  final ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          ToDoField(themeData: themeData),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: ProgressCircleButton(),
          ),
          CustomPaint(
            painter: FourPomodoroProgressPainter(),
          ),
          const Spacer(),
          const ButtonRow(),
          const Spacer(),
        ],
      ),
    );
  }
}
