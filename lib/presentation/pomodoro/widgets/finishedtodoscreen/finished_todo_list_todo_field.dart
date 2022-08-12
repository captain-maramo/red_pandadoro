import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../../infrastructure/models/todo.dart';

class FinishedTodoListScreenToDoField extends StatelessWidget {
  const FinishedTodoListScreenToDoField(
      {Key? key,
      required this.themeData,
      required this.box,
      required this.todo,
      required this.todoKey})
      : super(key: key);

  final ThemeData themeData;
  final Box box;
  final Todo todo;
  final dynamic todoKey;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.all(16.0),
      child: Material(
        elevation: 16,
        child: Container(
          decoration: BoxDecoration(
              color: themeData.colorScheme.secondary,
              borderRadius: BorderRadius.circular(8)),
          child: SizedBox(
            height: 120,
            width: 300,
            child: Row(
              children: [
                SizedBox(
                  height: 120,
                  width: 200,
                  child: Center(
                    child: TextButton(
                      onPressed: () {
                        box.add(Todo(
                          done: false,
                          estimatedPomodoros: 1,
                          finishedPomodoros: 0,
                          taskName: 'Buttonpressed',
                        ));
                      },
                      child: Text(
                        todo.taskName,
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .button
                            ?.copyWith(fontSize: 36),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 60,
                        width: 95,
                        child: Center(
                          child: TextButton(
                            onPressed: () {
                              box.delete(todoKey);
                            },
                            child: Text(
                              "clear",
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .button
                                  ?.copyWith(fontSize: 36),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 60,
                        width: 95,
                        child: Center(
                          child: TextButton(
                            onPressed: () {
                              todo.done = !todo.done;
                              box.put(todoKey, todo);
                            },
                            child: Text(
                              "undo",
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .button
                                  ?.copyWith(fontSize: 36),
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
        ),
      ),
    );
  }
}
