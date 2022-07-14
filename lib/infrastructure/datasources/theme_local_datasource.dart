import 'package:red_pandadoro/infrastructure/exceptions/exceptions.dart';
import 'package:shared_preferences/shared_preferences.dart';

const cachedThemeMode = 'CACHED_THEME_MODE';
const cachedUsedSystemTheme = 'CACHED_USE_SYSTEM_THEME';

abstract class ThemeLocalDatasource {
  Future<bool> getCachedThemeData();

  Future<bool> getUseSystemTheme();

  Future<void> cacheThemeData({required bool mode});
  Future<void> cacheUseSystemTheme({required bool useSystemTheme});
}

class ThemeLocalDatasourceImpl implements ThemeLocalDatasource {
  final SharedPreferences sharedPreferences;

  ThemeLocalDatasourceImpl({required this.sharedPreferences});

  @override
  Future<void> cacheThemeData({required bool mode}) {
    return sharedPreferences.setBool(cachedThemeMode, mode);
  }

  @override
  Future<bool> getCachedThemeData() {
    final modeBool = sharedPreferences.getBool(cachedThemeMode);

    if (modeBool != null) {
      return Future.value(modeBool);
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void> cacheUseSystemTheme({required bool useSystemTheme}) {
    return sharedPreferences.setBool(cachedUsedSystemTheme, useSystemTheme);
  }

  @override
  Future<bool> getUseSystemTheme() {
    final useSystemTheme = sharedPreferences.getBool(cachedUsedSystemTheme);

    if (useSystemTheme != null) {
      return Future.value(useSystemTheme);
    } else {
      throw CacheException();
    }
  }
}
