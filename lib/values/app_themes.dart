import 'package:flutter/material.dart';

class PrimaryFont {
  static String fontFamily = 'HelveticaNeue';
  static TextStyle medium(double size) {
    return TextStyle(
        fontFamily: fontFamily, fontWeight: FontWeight.w600, fontSize: size);
  }

  static TextStyle light(double size) {
    return TextStyle(
        fontFamily: fontFamily, fontWeight: FontWeight.w500, fontSize: size);
  }

  static TextStyle thin(double size) {
    return TextStyle(
        fontFamily: fontFamily, fontWeight: FontWeight.w100, fontSize: size);
  }
}
