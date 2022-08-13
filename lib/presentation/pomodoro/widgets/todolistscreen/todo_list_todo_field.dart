import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:red_pandadoro/presentation/pomodoro/edit_todo_screen.dart';

import '../../../../infrastructure/models/todo.dart';

class TodoListScreenToDoField extends StatefulWidget {
  const TodoListScreenToDoField(
      {Key? key,
      required this.themeData,
      required this.box,
      required this.todo,
      required this.todoKey,
      required this.notifyParent})
      : super(key: key);

  final ThemeData themeData;
  final Box box;
  final Todo todo;
  final dynamic todoKey;
  final Function() notifyParent;

  @override
  State<TodoListScreenToDoField> createState() =>
      _TodoListScreenToDoFieldState();
}

class _TodoListScreenToDoFieldState extends State<TodoListScreenToDoField> {
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
                        widget.box.add(Todo(
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
                      Center(
                        child: SizedBox(
                          height: 60,
                          width: 95,
                          child: Center(
                            child: IconButton(
                              icon: const Icon(Icons.check_outlined),
                              iconSize: 55,
                              onPressed: () {
                                widget.todo.done = !widget.todo.done;
                                widget.box.put(widget.todoKey, widget.todo);
                                widget.notifyParent();
                              },
                            ),
                          ),
                        ),
                      ),
                      Center(
                        child: SizedBox(
                          height: 60,
                          width: 95,
                          child: Center(
                            child: IconButton(
                              onPressed: () => showDialog<String>(
                                context: context,
                                builder: (BuildContext context) => AlertDialog(
                                  title: const Text('AlertDialog Title'),
                                  content:
                                      const Text('AlertDialog description'),
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () {
                                        widget.box.delete(widget.todoKey);
                                        widget.notifyParent();
                                        Navigator.pop(context, 'Delete');
                                      },
                                      child: Text(
                                        'Delete',
                                        style: Theme.of(context)
                                            .textTheme
                                            .button
                                            ?.copyWith(fontSize: 20),
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context, 'Edit');
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  EditTodoScreen(
                                                    title: 'Red Pandadoro',
                                                    box: widget.box,
                                                    todokey: widget.todoKey,
                                                    notifyParent:
                                                        widget.notifyParent,
                                                  )),
                                        );
                                      },
                                      child: Text(
                                        'Edit',
                                        style: Theme.of(context)
                                            .textTheme
                                            .button
                                            ?.copyWith(fontSize: 20),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              icon: const Icon(Icons.more_vert),
                              iconSize: 55,
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
