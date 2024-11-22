import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vas_app/core/theme/app_theme.dart';

class ThemeNotifier extends ChangeNotifier {
  bool _isDarkTheme = false;

  bool get isDarkTheme => _isDarkTheme;

  ThemeNotifier() {
    _loadTheme();
  }

  // Загружаем тему из SharedPreferences
  void _loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    _isDarkTheme = prefs.getBool('isDarkTheme') ?? false;
    notifyListeners();
  }

  // Переключаем тему
  void toggleTheme() async {
    _isDarkTheme = !_isDarkTheme;
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('isDarkTheme', _isDarkTheme);
    notifyListeners();
  }

  // Возвращаем текущую тему
  ThemeData get currentTheme => _isDarkTheme ? Themes.darkTheme : Themes.lightTheme;
}
