import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:red_pandadoro/infrastructure/models/pomodoro_state.dart';
import 'package:red_pandadoro/main.dart';
import 'package:red_pandadoro/presentation/pomodoro/todo_list_screen.dart';

import '../../../../infrastructure/models/todo.dart';
import '../../add_and_list_screen.dart';

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

  Widget stateBasedToDoField() {
    PomodoroState pomodoroState = widget.pomodoroStateBox.get("pomodoroState");
    if ((widget.state == "pomodoro" &&
            stateBasedTextSwitch() == "Click to choose task") ||
        widget.state != "pomodoro") {
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
                          builder: (context) => AddAndListScreen(
                                title: 'Red Pandadoro',
                                todoBox: widget.todoBox,
                                pomodoroStateBox: widget.pomodoroStateBox,
                                index: 1,
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
    } else if (pomodoroState.running) {
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
      );
    } else {
      PomodoroState todo = widget.pomodoroStateBox.get("pomodoroState");
      return Padding(
        padding: const EdgeInsetsDirectional.all(16.0),
        child: SizedBox(
          height: 120,
          width: 500,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: Material(
                  elevation: 16,
                  child: Container(
                    decoration: BoxDecoration(
                        color: widget.themeData.colorScheme.secondary,
                        borderRadius: BorderRadius.circular(8)),
                    child: SizedBox(
                      height: 120,
                      width: 200,
                      child: Center(
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AddAndListScreen(
                                        title: 'Red Pandadoro',
                                        todoBox: widget.todoBox,
                                        pomodoroStateBox:
                                            widget.pomodoroStateBox,
                                        index: 1,
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
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5),
                child: Column(
                  children: [
                    Material(
                      elevation: 16,
                      child: Container(
                        decoration: BoxDecoration(
                            color: widget.themeData.colorScheme.secondary,
                            borderRadius: BorderRadius.circular(8)),
                        child: SizedBox(
                          height: 58,
                          width: 95,
                          child: IconButton(
                            icon: const Icon(Icons.check_outlined),
                            iconSize: 55,
                            onPressed: () {
                              PomodoroState todo =
                                  widget.pomodoroStateBox.get("pomodoroState");
                              todo.todo.done = !todo.todo.done;
                              widget.todoBox.put(todo.todo.todoKey, todo.todo);
                              widget.pomodoroStateBox.put(
                                  'pomodoroState',
                                  PomodoroState(
                                    todo: Todo(
                                        taskName: "",
                                        estimatedPomodoros: 4,
                                        finishedPomodoros: 2,
                                        done: false,
                                        todoKey: -1),
                                    state: todo.state,
                                    secondsLeft: todo.secondsLeft,
                                    running: false,
                                    pomodoroCount: todo.pomodoroCount,
                                  ));
                            },
                          ),
                        ),
                      ),
                    ),
                    Spacer(),
                    Center(
                      child: Material(
                        elevation: 16,
                        child: Container(
                          decoration: BoxDecoration(
                              color: widget.themeData.colorScheme.secondary,
                              borderRadius: BorderRadius.circular(8)),
                          child: SizedBox(
                            height: 58,
                            width: 95,
                            child: Center(
                              child: Text(
                                "${todo.todo.finishedPomodoros}/${todo.todo.estimatedPomodoros}",
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
                  ],
                ),
              ),
            ],
          ),
        ),
      );
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
          return stateBasedToDoField();
        });
  }
}
