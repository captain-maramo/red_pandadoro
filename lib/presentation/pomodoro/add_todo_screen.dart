import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:red_pandadoro/presentation/pomodoro/widgets/addtodoscreen/add_todo_screen_body.dart';

import '../../infrastructure/models/pomodoro_state.dart';
import 'widgets/menu_drawer.dart';

class AddTodoScreen extends StatefulWidget {
  const AddTodoScreen(
      {Key? key,
      required this.title,
      required this.todoBox,
      required this.pomodoroStateBox})
      : super(key: key);

  final String title;
  final Box todoBox;
  final Box pomodoroStateBox;

  @override
  State<AddTodoScreen> createState() => _AddTodoScreenState();
}

class _AddTodoScreenState extends State<AddTodoScreen> {
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
          todoBox: widget.todoBox,
          pomodoroStateBox: widget.pomodoroStateBox,
        ),
      ),
      body: AddTodoScreenBody(
        todoBox: widget.todoBox,
        themeData: themeData,
      ),
    );
  }
}
