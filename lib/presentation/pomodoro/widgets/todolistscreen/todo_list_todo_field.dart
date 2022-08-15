import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:red_pandadoro/infrastructure/models/pomodoro_state.dart';
import 'package:red_pandadoro/presentation/pomodoro/edit_todo_screen.dart';

import '../../../../infrastructure/models/todo.dart';

class TodoListScreenToDoField extends StatefulWidget {
  const TodoListScreenToDoField(
      {Key? key,
      required this.themeData,
      required this.todoBox,
      required this.todo,
      required this.todoKey,
      required this.notifyParent,
      required this.pomodoroStateBox})
      : super(key: key);

  final ThemeData themeData;
  final Box todoBox;
  final Todo todo;
  final dynamic todoKey;
  final Function() notifyParent;
  final Box pomodoroStateBox;

  @override
  State<TodoListScreenToDoField> createState() =>
      _TodoListScreenToDoFieldState();
}

class _TodoListScreenToDoFieldState extends State<TodoListScreenToDoField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(top: 16.0),
      child: Container(
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
                            child: TextButton(
                              onPressed: () {
                                PomodoroState actualstate = widget
                                    .pomodoroStateBox
                                    .get("pomodoroState");
                                actualstate.todo = widget.todo;
                                widget.pomodoroStateBox
                                    .put("pomodoroState", actualstate);
                                widget.notifyParent();
                                Navigator.of(context)
                                    .popUntil((route) => route.isFirst);
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
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 170.0, top: 100),
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
                          child: IconButton(
                            icon: const Icon(Icons.check_outlined),
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
                    Spacer(),
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
                              onPressed: () => showDialog<String>(
                                context: context,
                                builder: (BuildContext context) => AlertDialog(
                                  title: const Text('AlertDialog Title'),
                                  content:
                                      const Text('AlertDialog description'),
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () {
                                        widget.todoBox.delete(widget.todoKey);
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
                                                    todoBox: widget.todoBox,
                                                    todokey: widget.todoKey,
                                                    notifyParent:
                                                        widget.notifyParent,
                                                    pomodoroStateBox:
                                                        widget.pomodoroStateBox,
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
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
