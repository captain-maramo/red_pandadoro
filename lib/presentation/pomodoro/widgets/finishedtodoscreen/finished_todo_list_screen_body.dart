import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:red_pandadoro/presentation/pomodoro/widgets/finishedtodoscreen/finished_todo_list_todo_field.dart';

import '../../../../infrastructure/models/todo.dart';

class FinishedTodoScreenBody extends StatefulWidget {
  const FinishedTodoScreenBody(
      {Key? key, required this.themeData, required this.box})
      : super(key: key);

  final ThemeData themeData;
  final Box box;

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
          itemCount: widget.box.length,
          itemBuilder: (BuildContext context, int index) {
            Todo now = widget.box.getAt(index);
            return !now.done
                ? Container()
                : FinishedTodoListScreenToDoField(
                    themeData: widget.themeData,
                    box: widget.box,
                    todo: widget.box.getAt(index),
                    todoKey: widget.box.keyAt(index),
                    notifyParent: refresh,
                  );
          }),
    );
  }
}
