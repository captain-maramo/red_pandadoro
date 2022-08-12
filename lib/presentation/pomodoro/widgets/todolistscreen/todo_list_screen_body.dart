import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:red_pandadoro/presentation/pomodoro/widgets/todolistscreen/todo_list_todo_field.dart';

import '../../../../infrastructure/models/todo.dart';

class TodoScreenBody extends StatelessWidget {
  const TodoScreenBody({Key? key, required this.themeData, required this.box})
      : super(key: key);

  final ThemeData themeData;
  final Box box;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView.builder(
          itemCount: box.length,
          itemBuilder: (BuildContext context, int index) {
            Todo now = box.getAt(index);
            return now.done
                ? Container()
                : TodoListScreenToDoField(
                    themeData: themeData,
                    box: box,
                    todo: box.getAt(index),
                    todoKey: box.keyAt(index),
                  );
          }),
    );
  }
}
