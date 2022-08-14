import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:red_pandadoro/infrastructure/models/todo.dart';

class EditTodoScreenBody extends StatelessWidget {
  const EditTodoScreenBody({
    Key? key,
    required this.themeData,
    required this.todoBox,
    required this.todokey,
    required this.notifyParent,
  }) : super(key: key);

  final ThemeData themeData;
  final Box todoBox;
  final dynamic todokey;
  final Function() notifyParent;

  @override
  Widget build(BuildContext context) {
    Todo oldVersion = todoBox.get(todokey);
    TextEditingController taskNameController =
        TextEditingController(text: oldVersion.taskName);
    TextEditingController pomodoroNumberController =
        TextEditingController(text: oldVersion.estimatedPomodoros.toString());
    TextEditingController donePomodoroNumberController =
        TextEditingController(text: oldVersion.finishedPomodoros.toString());
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
        TextFormField(
          controller: donePomodoroNumberController,
          decoration:
              const InputDecoration(labelText: "Done Pomodoros Pomodoros"),
          keyboardType: TextInputType.number,
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.digitsOnly
          ], // Only numbers can be entered
        ),
        TextButton(
          onPressed: () {
            todoBox.put(
                todokey,
                Todo(
                    taskName: taskNameController.text,
                    estimatedPomodoros:
                        int.parse(pomodoroNumberController.text),
                    finishedPomodoros:
                        int.parse(donePomodoroNumberController.text),
                    done: false));
            notifyParent();
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
