import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'widgets/menu_drawer.dart';
import 'widgets/mainscreen/main_screen_body.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key, required this.title, required this.box})
      : super(key: key);

  final String title;
  final Box box;

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
        child: MenuDrawer(box: widget.box),
      ),
      body: MainScreenBody(themeData: themeData, box: widget.box),
    );
  }
}
