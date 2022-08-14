import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:red_pandadoro/application/theme/theme_service.dart';
import 'package:red_pandadoro/infrastructure/models/pomodoro_state.dart';
import 'package:red_pandadoro/infrastructure/models/todo.dart';
import 'package:red_pandadoro/theme.dart';

import 'package:provider/provider.dart';
import 'injection.dart' as di; // di == dependency injection

import 'presentation/pomodoro/main_screen.dart';

late Box todoBox;
late Box pomodoroStateBox;

void testDataToBox() {}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  await di.sl<ThemeService>().initMode();
  await Hive.initFlutter();
  Hive.registerAdapter<Todo>(TodoAdapter());
  Hive.registerAdapter<PomodoroState>(PomodoroStateAdapter());
  todoBox = await Hive.openBox<Todo>('todoBox');
  pomodoroStateBox = await Hive.openBox<Todo>('pomodoroStateBox');

  runApp(
    ChangeNotifierProvider(
      create: (context) => di.sl<ThemeService>(),
      child: MyApp(todoBox: todoBox),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.todoBox}) : super(key: key);

  final Box todoBox;

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeService>(
      builder: (context, themeService, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: themeService.useSystemTheme
              ? ThemeMode.system
              : themeService.isDarkmodeOn
                  ? ThemeMode.dark
                  : ThemeMode.light,
          home: MainScreen(
            title: "Red Pandadoro",
            todoBox: todoBox,
          ),
        );
      },
    );
  }
}
