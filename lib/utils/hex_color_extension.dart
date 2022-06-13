import 'dart:ui';

import 'package:flutter/material.dart';

extension ColorExtensions on Color {
  /// String is in the format "aabbcc" or "ffaabbcc" with an optional leading "#".
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    int colorValue;
    try {
      colorValue = int.parse(buffer.toString(), radix: 16);
    } on FormatException {
      colorValue = 0xff000000;
    }
    return Color(colorValue);
  }

  /// Prefixes a hash sign if [leadingHashSign] is set to `true` (default is `true`).
  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
      '${alpha.toRadixString(16).padLeft(2, '0')}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';

  // static Color ifPiped(String fullMessage) {
  //   Color color = Themes.lightThemeData.primaryColor;
  //   List<String> list = fullMessage.split("|");

  //   list.forEach((element) {
  //     if (list.indexOf(element) != 0 && element.trim().startsWith("R")) {
  //       color = Colors.red.shade900;
  //     }
  //   });
  //   return color;
  // }
}
