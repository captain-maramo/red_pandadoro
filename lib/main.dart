import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:red_pandadoro/application/theme/theme_service.dart';
import 'package:red_pandadoro/infrastructure/models/last_button_pressed.dart';
import 'package:red_pandadoro/infrastructure/models/pomodoro_state.dart';
import 'package:red_pandadoro/infrastructure/models/todo.dart';
import 'package:red_pandadoro/theme.dart';

import 'package:provider/provider.dart';
import 'injection.dart' as di; // di == dependency injection

import 'presentation/pomodoro/main_screen.dart';

late Box todoBox;
late Box pomodoroStateBox;
late Box lastButtonPressedBox;

void testDataToBox() {}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  await di.sl<ThemeService>().initMode();
  await Hive.initFlutter();
  Hive.registerAdapter<Todo>(TodoAdapter());
  Hive.registerAdapter<PomodoroState>(PomodoroStateAdapter());
  Hive.registerAdapter<LastButtonPressed>(LastButtonPressedAdapter());
  lastButtonPressedBox =
      await Hive.openBox<LastButtonPressed>('lastButtonPressedBox');
  todoBox = await Hive.openBox<Todo>('todoBox');
  pomodoroStateBox = await Hive.openBox<PomodoroState>('pomodoroStateBox');
  pomodoroStateBox.put(
      'pomodoroState',
      PomodoroState(
        todo: Todo(
            taskName: "",
            estimatedPomodoros: 4,
            finishedPomodoros: 2,
            done: false,
            todoKey: -1),
        state: "pomodoro",
        secondsLeft: 10,
        running: false,
        pomodoroCount: 2,
      ));
  lastButtonPressedBox.put(
      "lastButtonPressed", LastButtonPressed(buttonName: "buttonName"));

  runApp(
    ChangeNotifierProvider(
      create: (context) => di.sl<ThemeService>(),
      child: MyApp(todoBox: todoBox, pomodoroStateBox: pomodoroStateBox),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.todoBox, required this.pomodoroStateBox})
      : super(key: key);

  final Box todoBox;
  final Box pomodoroStateBox;

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
            pomodoroStateBox: pomodoroStateBox,
            lastButtonPressedBox: lastButtonPressedBox,
          ),
        );
      },
    );
  }
}
