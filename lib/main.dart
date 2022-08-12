import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:red_pandadoro/application/theme/theme_service.dart';
import 'package:red_pandadoro/infrastructure/models/todo.dart';
import 'package:red_pandadoro/theme.dart';

import 'package:provider/provider.dart';
import 'injection.dart' as di; // di == dependency injection

import 'presentation/pomodoro/main_screen.dart';

late Box box;

void testDataToBox() {}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  await di.sl<ThemeService>().initMode();
  await Hive.initFlutter();
  Hive.registerAdapter<Todo>(TodoAdapter());
  box = await Hive.openBox<Todo>('todoBox');

  runApp(
    ChangeNotifierProvider(
      create: (context) => di.sl<ThemeService>(),
      child: MyApp(box: box),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.box}) : super(key: key);

  final Box box;

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
            box: box,
          ),
        );
      },
    );
  }
}
