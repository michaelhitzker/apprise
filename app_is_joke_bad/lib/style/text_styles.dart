import 'package:flutter/cupertino.dart';

class SGTextStyle {
  static TextStyle body({Color? color = CupertinoColors.black}) {
    return TextStyle(
        fontFamily: "Lexend",
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: color);
  }

  static TextStyle bodyBold({Color? color = CupertinoColors.black}) {
    return TextStyle(
        fontFamily: "Lexend",
        fontSize: 12,
        fontWeight: FontWeight.bold,
        color: color);
  }

  static TextStyle title({Color? color = CupertinoColors.black}) {
    return TextStyle(
        fontFamily: "Lexend",
        fontSize: 14,
        fontWeight: FontWeight.bold,
        color: color);
  }

  static TextStyle bodyLarge({Color? color = CupertinoColors.black}) {
    return TextStyle(
        fontFamily: "Lexend",
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: color);
  }

  static TextStyle header({Color? color = CupertinoColors.black}) {
    return TextStyle(
        fontFamily: "Lexend",
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: color);
  }
}
