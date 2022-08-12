import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:red_pandadoro/presentation/pomodoro/todo_list_screen.dart';

class MainScreenToDoField extends StatelessWidget {
  const MainScreenToDoField(
      {Key? key, required this.themeData, required this.box})
      : super(key: key);

  final ThemeData themeData;
  final Box box;

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
                              box: box,
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
