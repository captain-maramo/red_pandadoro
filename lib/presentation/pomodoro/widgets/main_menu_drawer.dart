import 'package:flutter/material.dart';

class MainMenuDrawer extends StatelessWidget {
  const MainMenuDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  icon: const Icon(
                    Icons.close,
                    size: 32,
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
          iconColor: Colors.white,
          textColor: Colors.white,
          selectedColor: Colors.white,
          leading: const Icon(Icons.add),
          title: const Text('Add New Task'),
          onTap: () {},
        ),
        ListTile(
          iconColor: Colors.white,
          textColor: Colors.white,
          selectedColor: Colors.white,
          leading: const Icon(Icons.format_list_bulleted),
          title: const Text('Show Task List'),
          onTap: () {},
        ),
        ListTile(
          iconColor: Colors.white,
          textColor: Colors.white,
          selectedColor: Colors.white,
          leading: const Icon(Icons.checklist),
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
            icon: const Icon(
              Icons.light_mode_outlined,
              size: 40,
            ),
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}
