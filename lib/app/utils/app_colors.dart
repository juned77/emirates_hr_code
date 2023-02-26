import 'package:flutter/material.dart';

class AppColors {
  static Color pantone = HexColor('#828080');
  static Color primaryColor = HexColor('#EF9FD9');
  static Color primaryColorDark = HexColor('#bb6fa7');
  static Color primaryColorLight = HexColor('#ffd1ff');
  static Color scaffoldBgColor = HexColor('#F2F2F2');
  static Color whiteLilac = HexColor('#E9E9E9');
}

class HexColor extends Color {
  HexColor(String hexColor) : super(_getColorFromHex(hexColor));

  static int _getColorFromHex(String hexColorString) {
    var hexColor = hexColorString;
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = 'FF$hexColor';
    }
    return int.parse(hexColor, radix: 16);
  }
}
