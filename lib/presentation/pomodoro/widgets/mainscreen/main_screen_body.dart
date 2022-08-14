import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'main_button_row.dart';
import 'main_four_pomodoro_prgogress_painter.dart';
import 'main_progress_circle_button.dart';
import 'main_todo_field.dart';

class MainScreenBody extends StatefulWidget {
  const MainScreenBody({Key? key, required this.themeData, required this.box})
      : super(key: key);

  final ThemeData themeData;
  final Box box;

  @override
  State<MainScreenBody> createState() => _MainScreenBodyState();
}

class _MainScreenBodyState extends State<MainScreenBody> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          MainScreenToDoField(
            themeData: widget.themeData,
            box: widget.box,
          ),
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
