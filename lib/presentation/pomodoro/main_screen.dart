import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'widgets/menu_drawer.dart';
import 'widgets/mainscreen/main_screen_body.dart';

class MainScreen extends StatefulWidget {
  const MainScreen(
      {Key? key,
      required this.title,
      required this.todoBox,
      required this.pomodoroStateBox,
      required this.lastButtonPressedBox})
      : super(key: key);

  final String title;
  final Box todoBox;
  final Box pomodoroStateBox;
  final Box lastButtonPressedBox;

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      endDrawer: Drawer(
        child: MenuDrawer(
            todoBox: widget.todoBox, pomodoroStateBox: widget.pomodoroStateBox),
      ),
      body: MainScreenBody(
          themeData: themeData,
          todoBox: widget.todoBox,
          pomodoroStateBox: widget.pomodoroStateBox,
          lastButtonPressedBox: widget.lastButtonPressedBox),
    );
  }
}
