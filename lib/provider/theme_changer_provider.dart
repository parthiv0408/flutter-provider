import 'package:flutter/material.dart';

class ThemeChangerProvider extends ChangeNotifier {
  var _themeMode = ThemeMode.light;

  ThemeMode get theme => _themeMode;

  void setTheme(themeMode) {
    _themeMode = themeMode;
    notifyListeners();
  }
}
