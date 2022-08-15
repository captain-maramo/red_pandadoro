import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:red_pandadoro/infrastructure/models/pomodoro_state.dart';
import 'package:red_pandadoro/presentation/pomodoro/todo_list_screen.dart';

import '../../../../infrastructure/models/todo.dart';

class MainScreenToDoField extends StatefulWidget {
  const MainScreenToDoField(
      {Key? key,
      required this.themeData,
      required this.todoBox,
      required this.state,
      required this.pomodoroStateBox})
      : super(key: key);

  final ThemeData themeData;
  final Box todoBox;
  final String state;
  final Box pomodoroStateBox;

  @override
  State<MainScreenToDoField> createState() => _MainScreenToDoFieldState();
}

class _MainScreenToDoFieldState extends State<MainScreenToDoField> {
  String stateBasedTextSwitch() {
    switch (widget.state) {
      case "pomodoro":
        PomodoroState todo = widget.pomodoroStateBox.get("pomodoroState");
        if (todo.todo.taskName != "") {
          return todo.todo.taskName;
        } else {
          return "Click to choose task";
        }
      case "short_break":
        return "Take a short break";
      case "long_break":
        return "Take a long break";
      default:
        return "Click to choose task";
    }
  }

  refresh() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: widget.pomodoroStateBox.listenable(),
        builder: (context, box, child) {
          return Padding(
            padding: const EdgeInsetsDirectional.all(16.0),
            child: Material(
              elevation: 16,
              child: Container(
                decoration: BoxDecoration(
                    color: widget.themeData.colorScheme.secondary,
                    borderRadius: BorderRadius.circular(8)),
                child: SizedBox(
                  height: 120,
                  width: 300,
                  child: Center(
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TodoListScreen(
                                    title: 'Red Pandadoro',
                                    todoBox: widget.todoBox,
                                    pomodoroStateBox: widget.pomodoroStateBox,
                                  )),
                        );
                      },
                      child: Text(
                        stateBasedTextSwitch(),
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .button
                            ?.copyWith(fontSize: 36),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }
}
