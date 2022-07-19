import 'package:flutter/material.dart';

import 'package:red_pandadoro/application/theme/theme_service.dart';
import 'package:red_pandadoro/theme.dart';

import 'package:provider/provider.dart';
import 'injection.dart' as di; // di == dependency injection

import 'presentation/pomodoro/main_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  await di.sl<ThemeService>().initMode();
  runApp(
    ChangeNotifierProvider(
      create: (context) => di.sl<ThemeService>(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
          home: const MainScreen(title: 'Red Pandadoro'),
        );
      },
    );
  }
}
