import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:red_pandadoro/presentation/pomodoro/widgets/todolistscreen/todo_list_screen_body.dart';

import 'widgets/menu_drawer.dart';
import 'widgets/todo_bottom_nav_bar.dart';

class TodoListScreen extends StatefulWidget {
  const TodoListScreen({Key? key, required this.title, required this.box})
      : super(key: key);

  final String title;
  final Box box;

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
        child: MenuDrawer(box: widget.box),
      ),
      body: TodoScreenBody(
        themeData: themeData,
        box: widget.box,
      ),
      bottomNavigationBar: const TodoBottomNavBar(),
    );
  }
}
