import 'package:flutter/material.dart';

// ignore: constant_identifier_names
enum ThemeType { Light, Dark }

// var height = MediaQuery.of(context).size.height;

class ThemeModel extends ChangeNotifier {
  ThemeData currentTheme = lightTheme;
  ThemeType _themeType = ThemeType.Dark;

  toggleTheme() {
    if (_themeType == ThemeType.Dark) {
      currentTheme = lightTheme;
      _themeType = ThemeType.Light;
      return notifyListeners();
    }

    if (_themeType == ThemeType.Light) {
      currentTheme = darkTheme;
      _themeType = ThemeType.Dark;
      return notifyListeners();
    }
  }
}

ThemeData darkTheme = ThemeData(
  primaryColor: const Color(0xff1f655d),
  textTheme: const TextTheme(
    subtitle1: TextStyle(color: Color(0xff40bf7a)),
    subtitle2: TextStyle(color: Colors.white),
    headline1: TextStyle(color: Color(0xff40bf7a)),
  ),
  appBarTheme: const AppBarTheme(color: Color(0xff1f655d)),
);

ThemeData lightTheme = ThemeData(
  primaryColor: const Color(0xffdedede),
  textTheme: const TextTheme(
      subtitle1: TextStyle(color: Colors.black54),
      subtitle2: TextStyle(color: Colors.grey),
      headline1: TextStyle(color: Colors.white)),
  backgroundColor: const Color(0xffcecece),
  appBarTheme: const AppBarTheme(
      color: Color(0xff1fFE4d),
      actionsIconTheme: IconThemeData(color: Colors.white)),
);
