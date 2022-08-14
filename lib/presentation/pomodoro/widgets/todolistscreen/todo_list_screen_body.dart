import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:red_pandadoro/presentation/pomodoro/widgets/todolistscreen/todo_list_todo_field.dart';

import '../../../../infrastructure/models/todo.dart';

class TodoScreenBody extends StatefulWidget {
  const TodoScreenBody(
      {Key? key, required this.themeData, required this.todoBox})
      : super(key: key);

  final ThemeData themeData;
  final Box todoBox;

  @override
  State<TodoScreenBody> createState() => _TodoScreenBodyState();
}

class _TodoScreenBodyState extends State<TodoScreenBody> {
  refresh() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView.builder(
          itemCount: widget.todoBox.length,
          itemBuilder: (BuildContext context, int index) {
            Todo now = widget.todoBox.getAt(index);
            return now.done
                ? Container()
                : TodoListScreenToDoField(
                    themeData: widget.themeData,
                    todoBox: widget.todoBox,
                    todo: widget.todoBox.getAt(index),
                    todoKey: widget.todoBox.keyAt(index),
                    notifyParent: refresh,
                  );
          }),
    );
  }
}
