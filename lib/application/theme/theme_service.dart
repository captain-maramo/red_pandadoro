import 'dart:async';

import 'package:red_pandadoro/domain/repositories/theme_repository.dart';
import 'package:flutter/material.dart';

abstract class ThemeService extends ChangeNotifier {
  late bool isDarkmodeOn;
  late bool useSystemTheme;
  Future<void> toggleThemeMode();
  Future<void> toggleUseSystemTheme();
  Future<void> setThemeMode({required bool mode});
  Future<void> setUseSystemTheme({required bool systemTheme});
  Future<void> initMode();
}

class ThemeServiceImpl extends ChangeNotifier implements ThemeService {
  final ThemeRepository themeRepository;

  ThemeServiceImpl({required this.themeRepository});

  @override
  bool isDarkmodeOn = true;

  @override
  late bool useSystemTheme;

  @override
  Future<void> setThemeMode({required bool mode}) async {
    isDarkmodeOn = mode;
    notifyListeners();
    await themeRepository.setThemeMode(mode: isDarkmodeOn);
  }

  @override
  Future<void> toggleThemeMode() async {
    isDarkmodeOn = !isDarkmodeOn;
    await setThemeMode(mode: isDarkmodeOn);
  }

  @override
  Future<void> setUseSystemTheme({required bool systemTheme}) async {
    useSystemTheme = systemTheme;
    notifyListeners();
    await themeRepository.setUseSystemTheme(useSystemTheme: useSystemTheme);
  }

  @override
  Future<void> toggleUseSystemTheme() async {
    useSystemTheme = !useSystemTheme;
    await setUseSystemTheme(systemTheme: useSystemTheme);
  }

  @override
  Future<void> initMode() async {
    final useSystemThemeOrFailure = await themeRepository.getUseSystemTheme();

    await useSystemThemeOrFailure.fold((failure) async {
      await setUseSystemTheme(systemTheme: false);
    }, (useSystemTheme) async {
      await setUseSystemTheme(systemTheme: useSystemTheme);
    });

    final modeOrFailure = await themeRepository.getThemeMode();

    modeOrFailure.fold((failure) {
      setThemeMode(mode: true);
    }, (mode) {
      setThemeMode(mode: mode);
    });
  }
}
