import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:red_pandadoro/presentation/pomodoro/widgets/finishedtodoscreen/finished_todo_list_todo_field.dart';

import '../../../../infrastructure/models/todo.dart';

class FinishedTodoScreenBody extends StatefulWidget {
  const FinishedTodoScreenBody(
      {Key? key, required this.themeData, required this.todoBox})
      : super(key: key);

  final ThemeData themeData;
  final Box todoBox;

  @override
  State<FinishedTodoScreenBody> createState() => _FinishedTodoScreenBodyState();
}

class _FinishedTodoScreenBodyState extends State<FinishedTodoScreenBody> {
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
            return !now.done
                ? Container()
                : FinishedTodoListScreenToDoField(
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
