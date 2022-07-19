import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../application/theme/theme_service.dart';

class MainMenuDrawer extends StatefulWidget {
  const MainMenuDrawer({Key? key}) : super(key: key);

  @override
  State<MainMenuDrawer> createState() => _MainMenuDrawerState();
}

class _MainMenuDrawerState extends State<MainMenuDrawer> {
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
          onTap: () {},
        ),
        ListTile(
          leading: Icon(Icons.format_list_bulleted,
              color: themeData.iconTheme.color),
          title: const Text('Show Task List'),
          onTap: () {},
        ),
        ListTile(
          leading: Icon(Icons.checklist, color: themeData.iconTheme.color),
          title: const Text('Finished Tasks'),
          onTap: () {},
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
          onPressed: () {},
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
