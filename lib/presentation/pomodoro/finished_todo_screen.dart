import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:red_pandadoro/main.dart';
import 'package:red_pandadoro/presentation/pomodoro/widgets/finishedtodoscreen/finished_todo_list_screen_body.dart';

import '../../infrastructure/models/pomodoro_state.dart';
import 'widgets/menu_drawer.dart';

class FinishedTodoScreen extends StatefulWidget {
  const FinishedTodoScreen(
      {Key? key,
      required this.title,
      required this.todoBox,
      required this.pomodoroStateBox})
      : super(key: key);

  final String title;
  final Box todoBox;
  final Box pomodoroStateBox;

  @override
  State<FinishedTodoScreen> createState() => _FinishedTodoScreenState();
}

class _FinishedTodoScreenState extends State<FinishedTodoScreen> {
  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    PomodoroState pomodoroState = widget.pomodoroStateBox.get("pomodoroState");

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      endDrawer: Drawer(
        child: MenuDrawer(
            todoBox: widget.todoBox, pomodoroStateBox: widget.pomodoroStateBox),
      ),
      body: FinishedTodoScreenBody(
        todoBox: todoBox,
        themeData: themeData,
      ),
    );
  }
}
