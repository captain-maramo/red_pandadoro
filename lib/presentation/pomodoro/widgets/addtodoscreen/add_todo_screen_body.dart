import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:red_pandadoro/infrastructure/models/todo.dart';

class AddTodoScreenBody extends StatelessWidget {
  const AddTodoScreenBody(
      {Key? key, required this.themeData, required this.box})
      : super(key: key);

  final ThemeData themeData;
  final Box box;

  @override
  Widget build(BuildContext context) {
    TextEditingController taskNameController = TextEditingController();
    TextEditingController pomodoroNumberController = TextEditingController();
    return Center(
      child: Column(children: [
        TextFormField(
            controller: taskNameController,
            decoration: const InputDecoration(labelText: "Task name")),
        TextFormField(
          controller: pomodoroNumberController,
          decoration: const InputDecoration(labelText: "Estimated Pomodoros"),
          keyboardType: TextInputType.number,
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.digitsOnly
          ], // Only numbers can be entered
        ),
        TextButton(
          onPressed: () {
            box.add(Todo(
                taskName: taskNameController.text,
                estimatedPomodoros: int.parse(pomodoroNumberController.text),
                finishedPomodoros: 0,
                done: false));
            Navigator.of(context).pop();
          },
          child: Text(
            'TestButton',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.button?.copyWith(fontSize: 36),
          ),
        ),
      ]),
    );
  }
}
