import 'package:flutter/material.dart';

import 'widgets/main_menu_drawer.dart';
import 'widgets/todo_bottom_nav_bar.dart';

class AddTodoScreen extends StatefulWidget {
  const AddTodoScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<AddTodoScreen> createState() => _AddTodoScreenState();
}

class _AddTodoScreenState extends State<AddTodoScreen> {
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
      body: Column(children: [
        TextFormField(
          decoration: const InputDecoration(
            border: UnderlineInputBorder(),
            labelText: 'Enter your username',
          ),
        ),
      ]),
      bottomNavigationBar: const TodoBottomNavBar(),
    );
  }
}
