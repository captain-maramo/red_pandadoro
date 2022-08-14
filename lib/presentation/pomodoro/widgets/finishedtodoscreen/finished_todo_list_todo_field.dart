import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../../infrastructure/models/todo.dart';

class FinishedTodoListScreenToDoField extends StatefulWidget {
  const FinishedTodoListScreenToDoField(
      {Key? key,
      required this.themeData,
      required this.todoBox,
      required this.todo,
      required this.todoKey,
      required this.notifyParent})
      : super(key: key);

  final ThemeData themeData;
  final Box todoBox;
  final Todo todo;
  final dynamic todoKey;
  final Function() notifyParent;

  @override
  State<FinishedTodoListScreenToDoField> createState() =>
      _FinishedTodoListScreenToDoFieldState();
}

class _FinishedTodoListScreenToDoFieldState
    extends State<FinishedTodoListScreenToDoField> {
  @override
  Widget build(BuildContext context) {
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
            child: Row(
              children: [
                SizedBox(
                  height: 120,
                  width: 200,
                  child: Center(
                    child: TextButton(
                      onPressed: () {
                        widget.todoBox.add(Todo(
                          done: false,
                          estimatedPomodoros: 1,
                          finishedPomodoros: 0,
                          taskName: 'Buttonpressed',
                        ));
                        widget.notifyParent();
                      },
                      child: Text(
                        widget.todo.taskName,
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
                              widget.todoBox.delete(widget.todoKey);
                              widget.notifyParent();
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
                              widget.todo.done = !widget.todo.done;
                              widget.todoBox.put(widget.todoKey, widget.todo);
                              widget.notifyParent();
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
