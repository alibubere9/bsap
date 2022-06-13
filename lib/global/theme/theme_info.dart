import 'package:classified_app/const/colors.dart';
import 'package:flutter/material.dart';

class Themes {
  static ThemeData lightThemeData = ThemeData(
    brightness: Brightness.light,
    accentColor: ConstColor.accentColor,
    primaryColor: ConstColor.primaryColor,
    appBarTheme: AppBarTheme(
      color: Colors.transparent,
      elevation: 0,
      brightness: Brightness.light,
      iconTheme: IconThemeData(
        color: ConstColor.primaryColor,
      ),
    ),
  );

  static ThemeData darkThemeData = ThemeData(
    snackBarTheme: SnackBarThemeData(
      contentTextStyle: TextStyle(
        color: Colors.white,
      ),
    ),
    backgroundColor: ConstColor.bgDark,
    scaffoldBackgroundColor: ConstColor.bgDark,
    cardColor: ConstColor.bgDark,
    canvasColor: ConstColor.bgDark,
    brightness: Brightness.dark,
    accentColor: ConstColor.accentColor,
    primaryColor: ConstColor.primaryColor,
    appBarTheme: AppBarTheme(
      brightness: Brightness.dark,
      color: Colors.transparent,
      elevation: 0,
      iconTheme: IconThemeData(
        color: ConstColor.primaryColor,
      ),
    ),
  );
}
