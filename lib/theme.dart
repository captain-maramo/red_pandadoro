import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static final Color _lightPrimaryColor = Colors.grey.shade100;
  static const Color _lightOnPrimaryColor = Colors.black;
  static const Color _lightPrimaryColorLight = Color.fromRGBO(255, 255, 255, 1);
  static const Color _lightPrimaryColorDark = Color.fromRGBO(194, 194, 194, 1);
  static const Color _lightTextColorPrimary = Colors.black;
  static const Color _lightIconColor = Colors.black;
  static const Color _lightSelectedIconColor = Color.fromRGBO(46, 125, 50, 1);

  static final Color _darkPrimaryColor = Colors.blueGrey.shade800;
  static const Color _darkOnPrimaryColor = Colors.white;
  static const Color _darkPrimaryColorLight = Color.fromRGBO(98, 114, 123, 1);
  static const Color _darkPrimaryColorDark = Color.fromRGBO(16, 31, 39, 1);
  static const Color _darkTextColorPrimary = Colors.white;
  static const Color _darkIconColor = Colors.white;
  static const Color _darkSelectedIconColor = Color.fromRGBO(46, 125, 50, 1);

  static final ThemeData lightTheme = ThemeData(
    canvasColor: _lightPrimaryColor,
    scaffoldBackgroundColor: _lightPrimaryColor,
    iconTheme: const IconThemeData(
      color: _lightIconColor,
    ),
    appBarTheme: const AppBarTheme(
      color: _lightPrimaryColorDark,
      iconTheme: IconThemeData(
        color: _lightIconColor,
      ),
    ),
    colorScheme: ColorScheme.light(
      primary: _lightPrimaryColor,
      secondary: _lightPrimaryColorLight,
      onPrimary: _lightOnPrimaryColor,
      primaryContainer: _lightPrimaryColor,
    ),
    textTheme: _lightTextTheme,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: _lightPrimaryColorDark,
      unselectedIconTheme: IconThemeData(color: _lightIconColor),
      selectedIconTheme: IconThemeData(color: _lightSelectedIconColor),
      showSelectedLabels: false,
      showUnselectedLabels: false,
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    canvasColor: _darkPrimaryColor,
    scaffoldBackgroundColor: _darkPrimaryColor,
    iconTheme: const IconThemeData(
      color: _darkIconColor,
    ),
    appBarTheme: const AppBarTheme(
      color: _darkPrimaryColorDark,
      iconTheme: IconThemeData(
        color: _darkIconColor,
      ),
    ),
    colorScheme: ColorScheme.dark(
      primary: _darkPrimaryColor,
      secondary: _darkPrimaryColorLight,
      onPrimary: _darkOnPrimaryColor,
      primaryContainer: _darkPrimaryColorLight,
    ),
    textTheme: _darkTextTheme,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: _darkPrimaryColorDark,
      unselectedIconTheme: IconThemeData(color: _darkIconColor),
      selectedIconTheme: IconThemeData(color: _darkSelectedIconColor),
      showSelectedLabels: false,
      showUnselectedLabels: false,
    ),
  );

  static const TextStyle _lightHeadingText = TextStyle(
    color: _lightTextColorPrimary,
    fontFamily: "RobotoCondensed",
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle _lightBodyText = TextStyle(
    color: _lightTextColorPrimary,
    fontFamily: "RobotoCondensed",
    fontStyle: FontStyle.italic,
    fontWeight: FontWeight.bold,
    fontSize: 16,
  );

  static const TextStyle _lightTodoText = TextStyle(
    color: _lightTextColorPrimary,
    fontFamily: "RobotoCondensed",
    fontWeight: FontWeight.normal,
    fontSize: 36,
  );

  static const TextTheme _lightTextTheme = TextTheme(
    headline1: _lightHeadingText,
    bodyText1: _lightBodyText,
    button: _lightTodoText,
  );

  static const TextStyle _darkHeadingText = TextStyle(
    color: _darkTextColorPrimary,
    fontFamily: "RobotoCondensed",
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle _darkBodyText = TextStyle(
    color: _darkTextColorPrimary,
    fontFamily: "RobotoCondensed",
    fontStyle: FontStyle.italic,
    fontWeight: FontWeight.bold,
    fontSize: 16,
  );

  static const TextStyle _darkTodoText = TextStyle(
    color: _darkTextColorPrimary,
    fontFamily: "RobotoCondensed",
    fontWeight: FontWeight.normal,
    fontSize: 36,
  );

  static const TextTheme _darkTextTheme = TextTheme(
    headline1: _darkHeadingText,
    bodyText1: _darkBodyText,
    button: _darkTodoText,
  );
}
