import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'widgets/menu_drawer.dart';
import 'widgets/todo_bottom_nav_bar.dart';

class FinishedTodoScreen extends StatefulWidget {
  const FinishedTodoScreen({Key? key, required this.title, required this.box})
      : super(key: key);

  final String title;
  final Box box;

  @override
  State<FinishedTodoScreen> createState() => _FinishedTodoScreenState();
}

class _FinishedTodoScreenState extends State<FinishedTodoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      endDrawer: Drawer(
        child: MenuDrawer(
          box: widget.box,
        ),
      ),
      body: const Placeholder(),
      bottomNavigationBar: const TodoBottomNavBar(),
    );
  }
}
