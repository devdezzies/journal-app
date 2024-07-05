import 'package:flutter/material.dart';
import 'package:journal/core/theme/themes.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData _currentTheme = AppTheme.lightMode;

  ThemeData get themeData => _currentTheme;

  set themeData(ThemeData theme) {
    _currentTheme = theme; 
    notifyListeners();
  }

  void toggleTheme() {
    if (_currentTheme == AppTheme.lightMode) {
      themeData = AppTheme.darkMode;
    } else {
      themeData = AppTheme.lightMode;
    }
  }
}