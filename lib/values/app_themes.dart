import 'package:flutter/material.dart';

const kColorPrimary = Color(0xFF8E97FD);
const kColorLightYellow = Color(0xFFFFECCC);
const kColorLightGrey = Color(0xFFEBEAEC);
const kColorDarkGrey = Color(0xFF3F414E);

const dPrimaryColor = Color(0xFF2AFD92);
const dBlackColor = Color(0xFF000000);
const dWhileColor = Color(0xFFFFFFFF);
const dGreyLightColor = Color(0xFFB4B4B4);
// const dGreyLightColor = Color(0xFF8A8A8A);
const dGreyDarkColor = Color(0xFF212121);

double getHeight(double sysVar, double size) {
  double calc = size / 1000;
  return sysVar * calc;
}

double getTextSize(double sysVar, double size) {
  double calc = size / 10;
  return sysVar * calc;
}

// 30/26/22/18/16/14
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
