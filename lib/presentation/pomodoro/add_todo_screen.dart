import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:red_pandadoro/presentation/pomodoro/widgets/addtodoscreen/add_todo_screen_body.dart';

import 'widgets/menu_drawer.dart';
import 'widgets/todo_bottom_nav_bar.dart';

class AddTodoScreen extends StatefulWidget {
  const AddTodoScreen({Key? key, required this.title, required this.box})
      : super(key: key);

  final String title;
  final Box box;

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
      endDrawer: Drawer(
        child: MenuDrawer(
          box: widget.box,
        ),
      ),
      body: AddTodoScreenBody(
        box: widget.box,
        themeData: themeData,
      ),
      bottomNavigationBar: const TodoBottomNavBar(),
    );
  }
}
