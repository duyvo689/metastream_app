import 'package:flutter/material.dart';
import './app_colors.dart';
import './app_fonts.dart';

// class FontFamily {
//   static const sen = 'Sen';
// }

class AppStyles {
  static const TextStyle TitleHome1 = TextStyle(
      fontFamily: AppFonts.muli,
      fontSize: 20,
      color: AppColors.thirdColor,
      fontWeight: FontWeight.bold);

  static const TextStyle TitleHome2 = TextStyle(
      fontFamily: AppFonts.muli,
      fontSize: 20,
      color: AppColors.textPrimaryColor,
      fontWeight: FontWeight.bold);

  static const TextStyle nameCard = TextStyle(
      fontFamily: AppFonts.muli,
      fontSize: 16,
      color: AppColors.textPrimaryColor,
      fontWeight: FontWeight.w400);

  static const TextStyle desCard = TextStyle(
      fontFamily: AppFonts.muli,
      fontSize: 14,
      color: AppColors.desColor,
      fontWeight: FontWeight.w400);
}
