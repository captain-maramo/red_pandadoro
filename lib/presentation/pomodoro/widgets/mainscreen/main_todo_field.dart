import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:red_pandadoro/presentation/pomodoro/todo_list_screen.dart';

class MainScreenToDoField extends StatelessWidget {
  const MainScreenToDoField(
      {Key? key, required this.themeData, required this.todoBox})
      : super(key: key);

  final ThemeData themeData;
  final Box todoBox;

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
            child: Center(
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => TodoListScreen(
                              title: 'Red Pandadoro',
                              todoBox: todoBox,
                            )),
                  );
                },
                child: Text(
                  'Click to choose task',
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .button
                      ?.copyWith(fontSize: 36),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
