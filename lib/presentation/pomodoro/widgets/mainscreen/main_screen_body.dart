import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:red_pandadoro/infrastructure/models/last_button_pressed.dart';
import 'package:red_pandadoro/infrastructure/models/pomodoro_state.dart';
import 'package:red_pandadoro/infrastructure/models/todo.dart';
import 'package:red_pandadoro/main.dart';
import 'dart:async';

import 'main_button_row.dart';
import 'main_four_pomodoro_prgogress_painter.dart';
import 'main_progress_circle_button.dart';
import 'main_todo_field.dart';

class MainScreenBody extends StatefulWidget {
  const MainScreenBody(
      {Key? key,
      required this.themeData,
      required this.todoBox,
      required this.pomodoroStateBox,
      required this.lastButtonPressedBox})
      : super(key: key);

  final ThemeData themeData;
  final Box todoBox;
  final Box pomodoroStateBox;
  final Box lastButtonPressedBox;

  @override
  State<MainScreenBody> createState() => _MainScreenBodyState();
}

class _MainScreenBodyState extends State<MainScreenBody> {
  PomodoroState pushPomodoroState(PomodoroState pomodoroState) {
    widget.pomodoroStateBox.put("pomodoroState", pomodoroState);
    return widget.pomodoroStateBox.get("pomodoroState");
  }

  PomodoroState pausePomodoro(PomodoroState pomodoroState) {
    return PomodoroState(
      todo: Todo(
          taskName: pomodoroState.todo.taskName,
          estimatedPomodoros: pomodoroState.todo.estimatedPomodoros,
          finishedPomodoros: pomodoroState.todo.finishedPomodoros,
          done: pomodoroState.todo.done,
          todoKey: pomodoroState.todo.todoKey),
      state: pomodoroState.state,
      secondsLeft: pomodoroState.secondsLeft,
      running: pomodoroState.running,
      pomodoroCount: pomodoroState.pomodoroCount,
    );
  }

  PomodoroState setNextPomodoroState(PomodoroState pomodoroState) {
    PomodoroState nextState = PomodoroState(
      todo: Todo(
          taskName: pomodoroState.todo.taskName,
          estimatedPomodoros: pomodoroState.todo.estimatedPomodoros,
          finishedPomodoros: pomodoroState.todo.finishedPomodoros,
          done: pomodoroState.todo.done,
          todoKey: pomodoroState.todo.todoKey),
      state: pomodoroState.state,
      secondsLeft: pomodoroState.secondsLeft,
      running: pomodoroState.running,
      pomodoroCount: pomodoroState.pomodoroCount,
    );
    if (pomodoroState.state == "pomodoro") {
      if (pomodoroState.pomodoroCount == 3) {
        nextState.pomodoroCount = 4;
        nextState.state = "long_break";
        nextState.secondsLeft = 1200;
      } else {
        nextState.pomodoroCount++;
        nextState.state = "short_break";
        nextState.secondsLeft = 300;
      }
    } else if (pomodoroState.state == "long_break") {
      nextState.pomodoroCount = 0;

      nextState.state = "pomodoro";
      nextState.secondsLeft = 1500;
    } else {
      nextState.state = "pomodoro";
      nextState.secondsLeft = 1500;
    }
    return nextState;
  }

  PomodoroState rewindPomodoroState(PomodoroState pomodoroState) {
    PomodoroState nextState = PomodoroState(
      todo: Todo(
          taskName: pomodoroState.todo.taskName,
          estimatedPomodoros: pomodoroState.todo.estimatedPomodoros,
          finishedPomodoros: pomodoroState.todo.finishedPomodoros,
          done: pomodoroState.todo.done,
          todoKey: pomodoroState.todo.todoKey),
      state: pomodoroState.state,
      secondsLeft: pomodoroState.secondsLeft,
      running: pomodoroState.running,
      pomodoroCount: pomodoroState.pomodoroCount,
    );
    if (pomodoroState.state == "pomodoro") {
      nextState.secondsLeft = 1500;
    } else if (pomodoroState.state == "long_break") {
      nextState.secondsLeft = 1200;
    } else if (pomodoroState.state == "short_break") {
      nextState.secondsLeft = 300;
    }
    return nextState;
  }

  String secondsToMinAndSeconds(int secondsLeft) {
    int mins = secondsLeft ~/ 60;
    int seconds = secondsLeft % 60;
    if (seconds < 10) {
      return "$mins:0$seconds";
    }
    return "$mins:$seconds";
  }

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

  double percentCalculatorBasedOnState(int secondsLeft, String state) {
    switch (state) {
      case "pomodoro":
        return 1 - secondsLeft / 1500;
      case "short_break":
        return 1 - secondsLeft / 300;
      case "long_break":
        return 1 - secondsLeft / 1200;
      default:
        return 1 - secondsLeft / 1500;
    }
  }

  refresh() {
    PomodoroState pomodoroState = widget.pomodoroStateBox.get("pomodoroState");
    LastButtonPressed lastButtonPressed =
        widget.lastButtonPressedBox.get("lastButtonPressed");
    String buttonName = lastButtonPressed.buttonName;

    if (buttonName == "start_pause" ||
        buttonName == "rewind" ||
        buttonName == "forward") {
      pomodoroState.running = !pomodoroState.running;
      Timer.periodic(const Duration(seconds: 1), (Timer timer) {
        setState(() {
          if (buttonName == "forward") {
            timer.cancel();
            pomodoroState =
                pushPomodoroState(setNextPomodoroState(pomodoroState));
          } else if (pomodoroState.secondsLeft > 0 && pomodoroState.running) {
            pomodoroState.secondsLeft--;
          } else if (pomodoroState.secondsLeft > 0 && !pomodoroState.running) {
            timer.cancel();
            if (buttonName == "rewind") {
              pomodoroState =
                  pushPomodoroState(rewindPomodoroState(pomodoroState));
            } else {
              pomodoroState = pushPomodoroState(pausePomodoro(pomodoroState));
            }
          } else {
            pomodoroState.running = !pomodoroState.running;
            timer.cancel();
            pomodoroState =
                pushPomodoroState(setNextPomodoroState(pomodoroState));
            if (pomodoroState.state != "pomodoro") {
              pomodoroState.todo.finishedPomodoros++;
              pushPomodoroState(pomodoroState);
              todoBox.put(pomodoroState.todo.todoKey, pomodoroState.todo);
            }
          }
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    PomodoroState pomodoroState = widget.pomodoroStateBox.get("pomodoroState");

    return Center(
      child: Column(
        children: <Widget>[
          MainScreenToDoField(
            themeData: widget.themeData,
            todoBox: widget.todoBox,
            state: pomodoroState.state,
            pomodoroStateBox: widget.pomodoroStateBox,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ProgressCircleButton(
              lastButtonPressedBox: widget.lastButtonPressedBox,
              notifyParent: refresh,
              color: stateColorSwitch(pomodoroState.state),
              percent: percentCalculatorBasedOnState(
                  pomodoroState.secondsLeft, pomodoroState.state),
              timerString: secondsToMinAndSeconds(pomodoroState.secondsLeft),
            ),
          ),
          CustomPaint(
            painter: FourPomodoroProgressPainter(
                pomodoroCount: pomodoroState.pomodoroCount,
                color: stateColorSwitch(pomodoroState.state)),
          ),
          const Spacer(),
          MainButtonRow(
            lastButtonPressedBox: widget.lastButtonPressedBox,
            notifyParent: refresh,
            backgroundColor: stateColorSwitch(pomodoroState.state),
            timerIsRunning: pomodoroState.running,
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
