import 'dart:async';
import 'package:classified_app/environment/tester.dart';
import 'package:classified_app/services/interfaces/i_theme_service.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

const ThemeConst = 'isDark';

class ThemeService implements IThemeService {
  final SharedPreferences sharedPreferences;
  ThemeService(
    this.sharedPreferences,
  );

  ThemeMode get theme => _getTheme();

  ThemeMode _getTheme() {
    bool? isDark = sharedPreferences.getBool(ThemeConst);
    if (Tester.verify()) {
      if (isDark == null || !isDark) {
        setTheme(false);
        return ThemeMode.light;
      } else {
        setTheme(true);
        return ThemeMode.dark;
      }
    }
    setTheme(false);
    return ThemeMode.light;
  }

  Future<void> setTheme(bool isDark) {
    return sharedPreferences.setBool(ThemeConst, isDark);
  }

  bool get isDark => theme == ThemeMode.dark;
}
