import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:red_pandadoro/presentation/pomodoro/widgets/edittodoscreen/edit_todo_screen_body.dart';

import 'widgets/menu_drawer.dart';
import 'widgets/todo_bottom_nav_bar.dart';

class EditTodoScreen extends StatefulWidget {
  const EditTodoScreen({
    Key? key,
    required this.title,
    required this.box,
    required this.todokey,
    required this.notifyParent,
  }) : super(key: key);

  final String title;
  final Box box;
  final dynamic todokey;
  final Function() notifyParent;

  @override
  State<EditTodoScreen> createState() => _EditTodoScreenState();
}

class _EditTodoScreenState extends State<EditTodoScreen> {
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
      body: EditTodoScreenBody(
          box: widget.box,
          themeData: themeData,
          todokey: widget.todokey,
          notifyParent: widget.notifyParent),
      bottomNavigationBar: const TodoBottomNavBar(),
    );
  }
}
