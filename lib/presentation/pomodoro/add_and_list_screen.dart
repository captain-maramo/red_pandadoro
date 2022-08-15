import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:red_pandadoro/main.dart';
import 'package:red_pandadoro/presentation/pomodoro/todo_list_screen.dart';
import 'package:red_pandadoro/presentation/pomodoro/widgets/addtodoscreen/add_todo_screen_body.dart';

import '../../infrastructure/models/pomodoro_state.dart';
import 'add_todo_screen.dart';
import 'finished_todo_screen.dart';
import 'widgets/menu_drawer.dart';

class AddAndListScreen extends StatefulWidget {
  AddAndListScreen(
      {Key? key,
      required this.title,
      required this.todoBox,
      required this.pomodoroStateBox,
      required this.index})
      : super(key: key);

  final String title;
  final Box todoBox;
  final Box pomodoroStateBox;
  int index;

  @override
  State<AddAndListScreen> createState() => _AddAndListScreenState();
}

class _AddAndListScreenState extends State<AddAndListScreen> {
  final screens = [
    AddTodoScreen(
      pomodoroStateBox: pomodoroStateBox,
      title: 'Red Pandadoro',
      todoBox: todoBox,
    ),
    TodoListScreen(
      pomodoroStateBox: pomodoroStateBox,
      title: 'Red Pandadoro',
      todoBox: todoBox,
    ),
    FinishedTodoScreen(
      pomodoroStateBox: pomodoroStateBox,
      title: 'Red Pandador',
      todoBox: todoBox,
    )
  ];
  Color stateColorSwitch(String state) {
    switch (state) {
      case "pomodoro":
        return const Color.fromRGBO(46, 125, 50, 1);
      case "short_break":
        return const Color.fromRGBO(21, 101, 192, 1);
      case "long_break":
        return const Color.fromRGBO(156, 37, 249, 1);
      default:
        return const Color.fromRGBO(46, 125, 50, 1);
    }
  }

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    PomodoroState pomodoroState = widget.pomodoroStateBox.get("pomodoroState");

    return Scaffold(
        endDrawer: Drawer(
          child: MenuDrawer(
            todoBox: widget.todoBox,
            pomodoroStateBox: widget.pomodoroStateBox,
          ),
        ),
        body: screens[widget.index],
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: stateColorSwitch(pomodoroState.state),
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
          currentIndex: widget.index,
          onTap: (index) {
            widget.index = index;
            setState(() {});
          },
        ));
  }
}
