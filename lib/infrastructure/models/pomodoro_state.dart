import 'package:hive/hive.dart';

import 'todo.dart';

part 'pomodoro_state.g.dart';

@HiveType(typeId: 2)
class PomodoroState {
  PomodoroState(
      {required this.todo,
      required this.state,
      required this.secondsLeft,
      required this.running,
      required this.pomodoroCount,
      });
  @HiveField(0)
  Todo todo;

  @HiveField(1)
  String state;

  @HiveField(2)
  int secondsLeft;

  @HiveField(3)
  bool running;

  @HiveField(4)
  int pomodoroCount;
}
