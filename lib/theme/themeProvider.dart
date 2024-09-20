import 'package:flutter/material.dart';
import 'package:run_api/theme/darkTheme.dart';
import 'package:run_api/theme/lightTheme.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData _themeData = lightMode;

  // Renamed the getter to avoid conflict
  ThemeData get themeData => _themeData;
  bool get isDarkMode => _themeData == DarkMode;

  set themeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

  void toggleTheme() {
    if (_themeData == lightMode) {
      themeData = DarkMode;
    } else {
      themeData = lightMode;
    }
  }
}
