import 'package:flutter/material.dart';

import 'widgets/main_menu_drawer.dart';
import 'widgets/todo_bottom_nav_bar.dart';

class TodoListScreen extends StatefulWidget {
  const TodoListScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<TodoListScreen> createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      endDrawer: const Drawer(
        child: MainMenuDrawer(),
      ),
      body: const Placeholder(),
      bottomNavigationBar: const TodoBottomNavBar(),
    );
  }
}
