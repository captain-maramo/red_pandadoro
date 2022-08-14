import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:red_pandadoro/presentation/pomodoro/widgets/todolistscreen/todo_list_screen_body.dart';

import 'widgets/menu_drawer.dart';
import 'widgets/todo_bottom_nav_bar.dart';

class TodoListScreen extends StatefulWidget {
  const TodoListScreen({Key? key, required this.title, required this.todoBox})
      : super(key: key);

  final String title;
  final Box todoBox;

  @override
  State<TodoListScreen> createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Red Pandadoro"),
      ),
      endDrawer: Drawer(
        child: MenuDrawer(todoBox: widget.todoBox),
      ),
      body: TodoScreenBody(
        themeData: themeData,
        todoBox: widget.todoBox,
      ),
      bottomNavigationBar: const TodoBottomNavBar(),
    );
  }
}
