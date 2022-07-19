import 'package:flutter/material.dart';

import 'widgets/main_menu_drawer.dart';
import 'widgets/main_screen_body.dart';

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
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Add',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'List',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Done',
          ),
        ],
        currentIndex: 0,
        onTap: (__) {},
      ),
    );
  }
}
