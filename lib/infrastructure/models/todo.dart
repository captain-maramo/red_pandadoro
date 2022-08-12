import 'package:hive/hive.dart';

part 'todo.g.dart';

@HiveType(typeId: 1)
class Todo {
  Todo(
      {required this.taskName,
      required this.estimatedPomodoros,
      required this.finishedPomodoros,
      required this.done});
  @HiveField(0)
  String taskName;

  @HiveField(1)
  int estimatedPomodoros;

  @HiveField(2)
  int finishedPomodoros;

  @HiveField(3)
  bool done;
}
