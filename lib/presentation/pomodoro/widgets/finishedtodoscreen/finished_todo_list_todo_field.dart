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
      padding: const EdgeInsetsDirectional.only(top: 16.0, start: 16.0),
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
                    child: Stack(
                      children: [
                        Center(
                          child: Text(
                            widget.todo.taskName,
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .button
                                ?.copyWith(fontSize: 36),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 170.0, top: 100),
                          child: Text(
                            "${widget.todo.finishedPomodoros}/${widget.todo.estimatedPomodoros}",
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .button
                                ?.copyWith(fontSize: 15),
                          ),
                        ),
                      ],
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
                        child: Center(
                          child: IconButton(
                            icon: const Icon(Icons.delete),
                            iconSize: 55,
                            onPressed: () {
                              widget.todoBox.delete(widget.todoKey);
                              widget.notifyParent();
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
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
                          child: IconButton(
                            icon: const Icon(Icons.undo),
                            iconSize: 55,
                            onPressed: () {
                              widget.todo.done = !widget.todo.done;
                              widget.todoBox.put(widget.todoKey, widget.todo);
                              widget.notifyParent();
                            },
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
