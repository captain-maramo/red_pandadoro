import 'package:flutter/material.dart';

import 'widgets/main_menu_drawer.dart';
import 'widgets/main_screen_body.dart';
import 'widgets/todo_bottom_nav_bar.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key, required this.title}) : super(key: key);

  final String title;

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
      endDrawer: const Drawer(
        child: MainMenuDrawer(),
      ),
      body: MainScreenBody(themeData: themeData),
    );
  }
}
