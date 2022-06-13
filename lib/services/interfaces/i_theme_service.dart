import 'package:flutter/material.dart';

abstract class IThemeService {
  ThemeMode get theme;
  bool get isDark;
  Future<void> setTheme(bool isDark);
}
