import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:red_pandadoro/infrastructure/models/todo.dart';

class AddTodoScreenBody extends StatelessWidget {
  const AddTodoScreenBody(
      {Key? key, required this.themeData, required this.todoBox})
      : super(key: key);

  final ThemeData themeData;
  final Box todoBox;

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
          onPressed: () async {
            int newkey = await todoBox.add(Todo(
                taskName: taskNameController.text,
                estimatedPomodoros: int.parse(pomodoroNumberController.text),
                finishedPomodoros: 0,
                done: false,
                todoKey: "placeholder"));
            Todo newTodo = todoBox.get(newkey);
            newTodo.todoKey = newkey;
            todoBox.put(newkey, newTodo);
            // ignore: use_build_context_synchronously
            Navigator.of(context).pop();
          },
          child: Text(
            'Add',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.button?.copyWith(fontSize: 36),
          ),
        ),
      ]),
    );
  }
}
