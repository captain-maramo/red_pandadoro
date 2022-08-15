import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:red_pandadoro/presentation/pomodoro/add_and_list_screen.dart';
import 'package:red_pandadoro/presentation/pomodoro/add_todo_screen.dart';
import 'package:red_pandadoro/presentation/pomodoro/finished_todo_screen.dart';

import '../../../application/theme/theme_service.dart';
import '../todo_list_screen.dart';

class MenuDrawer extends StatefulWidget {
  const MenuDrawer(
      {Key? key, required this.todoBox, required this.pomodoroStateBox})
      : super(key: key);

  final Box todoBox;
  final Box pomodoroStateBox;

  @override
  State<MenuDrawer> createState() => _MenuDrawerState();
}

class _MenuDrawerState extends State<MenuDrawer> {
  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Column(
      // Important: Remove any padding from the ListView.
      children: <Widget>[
        Padding(
          padding: const EdgeInsetsDirectional.only(
              start: 16.0, top: 32.0, end: 8.0, bottom: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Spacer(),
              const Center(
                child: Text(
                  "Menu",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              const Spacer(),
              Align(
                alignment: const Alignment(0.9, 0.9),
                child: IconButton(
                  icon: Icon(
                    Icons.close,
                    size: 32,
                    color: themeData.iconTheme.color,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
            ],
          ),
        ),
        const Divider(
          height: 1,
          thickness: 1,
        ),
        ListTile(
          leading: Icon(Icons.add, color: themeData.iconTheme.color),
          title: const Text('Add New Task'),
          onTap: () {
            Navigator.of(context).popUntil((route) => route.isFirst);
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => AddAndListScreen(
                        title: 'Red Pandadoro',
                        todoBox: widget.todoBox,
                        pomodoroStateBox: widget.pomodoroStateBox,
                        index: 0,
                      )),
            );
          },
        ),
        ListTile(
          leading: Icon(Icons.format_list_bulleted,
              color: themeData.iconTheme.color),
          title: const Text('Show Task List'),
          onTap: () {
            Navigator.of(context).popUntil((route) => route.isFirst);
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => AddAndListScreen(
                        title: 'Red Pandadoro',
                        todoBox: widget.todoBox,
                        pomodoroStateBox: widget.pomodoroStateBox,
                        index: 1,
                      )),
            );
          },
        ),
        ListTile(
          leading: Icon(Icons.checklist, color: themeData.iconTheme.color),
          title: const Text('Finished Tasks'),
          onTap: () {
            Navigator.of(context).popUntil((route) => route.isFirst);
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => AddAndListScreen(
                        title: 'Red Pandadoro',
                        todoBox: widget.todoBox,
                        pomodoroStateBox: widget.pomodoroStateBox,
                        index: 2,
                      )),
            );
          },
        ),
        const Divider(
          height: 1,
          thickness: 1,
        ),
        const Spacer(),
        IconButton(
          icon: const Icon(
            Icons.info_outline,
            size: 40,
          ),
          onPressed: () => showDialog<String>(
            context: context,
            builder: (BuildContext context) => AlertDialog(
              backgroundColor: themeData.primaryColorDark,
              elevation: 12,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.0))),
              content: TextButton(
                  onPressed: () => Navigator.pop(context, 'OK'),
                  child: Text(
                    'Version 0.0.1\nAuthor Mark Morgan',
                    textAlign: TextAlign.center,
                    style: themeData.textTheme.caption,
                  )),
            ),
          ),
        ),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: IconButton(
            icon: Provider.of<ThemeService>(context, listen: false).isDarkmodeOn
                ? const Icon(
                    Icons.light_mode_outlined,
                    size: 40,
                  )
                : const Icon(
                    Icons.dark_mode_outlined,
                    size: 40,
                  ),
            onPressed: () {
              setState(() {
                Provider.of<ThemeService>(context, listen: false)
                    .toggleThemeMode();
              });
            },
          ),
        ),
      ],
    );
  }
}
