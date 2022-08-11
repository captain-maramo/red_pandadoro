import 'package:flutter/material.dart';

import 'widgets/main_menu_drawer.dart';
import 'widgets/todo_bottom_nav_bar.dart';

class FinishedTodoScreen extends StatefulWidget {
  const FinishedTodoScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<FinishedTodoScreen> createState() => _FinishedTodoScreenState();
}

class _FinishedTodoScreenState extends State<FinishedTodoScreen> {
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
