import 'package:flutter/material.dart';
import './app_colors.dart';
import './app_fonts.dart';

// class FontFamily {
//   static const sen = 'Sen';
// }

class AppStyles {
  // ignore: constant_identifier_names
  static const TextStyle TitleHome1 = TextStyle(
      fontFamily: AppFonts.helveticaNeue,
      fontSize: 20,
      color: AppColors.dPrimaryColor,
      fontWeight: FontWeight.bold);

  // ignore: constant_identifier_names
  static const TextStyle TitleHome2 = TextStyle(
      fontFamily: AppFonts.helveticaNeue,
      fontSize: 20,
      color: AppColors.dWhileColor,
      fontWeight: FontWeight.bold);

  static const TextStyle nameCard = TextStyle(
      fontFamily: AppFonts.helveticaNeue,
      fontSize: 16,
      color: AppColors.dWhileColor,
      fontWeight: FontWeight.w400);

//DETAIL NFT
  // ignore: constant_identifier_names
  static const TextStyle details_cart_left_nft_style = TextStyle(
      fontFamily: AppFonts.helveticaNeue,
      fontWeight: FontWeight.w500,
      fontSize: 14,
      color: AppColors.dWhileColor);

  // ignore: constant_identifier_names
  static const TextStyle details_cart_right_nft_style = TextStyle(
      fontFamily: AppFonts.helveticaNeue,
      fontWeight: FontWeight.w400,
      fontSize: 14,
      color: AppColors.dGreyLightColor);

  // ignore: constant_identifier_names
  static const TextStyle about_profile_label_style = TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 18,
      overflow: TextOverflow.ellipsis,
      color: AppColors.dPrimaryDarkColor);

  // ignore: constant_identifier_names
  static const TextStyle about_profile_title_style = TextStyle(
      fontWeight: FontWeight.w400, fontSize: 18, color: AppColors.dWhileColor);
}
