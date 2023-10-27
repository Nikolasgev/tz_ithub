import 'package:flutter/material.dart';

class ThemeChanger extends ChangeNotifier {
  ThemeData _themeData;

  ThemeChanger(this._themeData);

  getTheme() => _themeData;

  setTheme(ThemeData theme) {
    _themeData = theme;
    notifyListeners();
  }
}



class Themes {
  static ThemeData lightTheme = ThemeData(
    primarySwatch: Colors.blueGrey,
    brightness: Brightness.light,
  );

  static ThemeData darkTheme = ThemeData(
    primarySwatch: Colors.indigo,
    brightness: Brightness.dark,
  );
}
