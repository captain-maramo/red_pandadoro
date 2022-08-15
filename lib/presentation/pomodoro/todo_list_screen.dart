import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:red_pandadoro/infrastructure/models/pomodoro_state.dart';
import 'package:red_pandadoro/presentation/pomodoro/widgets/todolistscreen/todo_list_screen_body.dart';

import 'widgets/menu_drawer.dart';

class TodoListScreen extends StatefulWidget {
  const TodoListScreen(
      {Key? key,
      required this.title,
      required this.todoBox,
      required this.pomodoroStateBox})
      : super(key: key);

  final String title;
  final Box todoBox;
  final Box pomodoroStateBox;

  @override
  State<TodoListScreen> createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    PomodoroState pomodoroState = widget.pomodoroStateBox.get("pomodoroState");
    return Scaffold(
      appBar: AppBar(
        title: const Text("Red Pandadoro"),
      ),
      endDrawer: Drawer(
        child: MenuDrawer(
            todoBox: widget.todoBox, pomodoroStateBox: widget.pomodoroStateBox),
      ),
      body: TodoScreenBody(
        themeData: themeData,
        todoBox: widget.todoBox,
        pomodoroStateBox: widget.pomodoroStateBox,
      ),
    );
  }
}
