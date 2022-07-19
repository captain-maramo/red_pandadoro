import 'package:flutter/material.dart';

class TodoBottomNavBar extends StatelessWidget {
  const TodoBottomNavBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.add),
          label: 'Add',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.list),
          label: 'List',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.school),
          label: 'Done',
        ),
      ],
      currentIndex: 0,
      onTap: (__) {},
    );
  }
}
