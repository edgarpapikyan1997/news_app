import 'package:flutter/material.dart';
import '../themes/app_colors.dart';
import '../themes/app_fonts.dart';

extension BuildContextExtensions on BuildContext {
  ThemeData get theme => Theme.of(this);

  MediaQueryData get media => MediaQuery.of(this);

  double get height => media.size.height;

  double get bodyHeight => height - 100;

  double get width => media.size.width;

  double get topPadding => media.padding.top;

  double get bottomPadding => media.padding.bottom;

  bool get isDarkMode => media.platformBrightness == Brightness.dark;
}

extension ThemeDataHelper on ThemeData {
  TextStyle get headline1 => const TextStyle(
      color: AppColors.grey,
      fontFamily: FontFamily.SFProDisplay,
      fontSize: 12,
      height: 1.20,
      fontWeight: FontWeight.w400);

  TextStyle get headline2 => const TextStyle(
        color: AppColors.lightBlue,
        fontFamily: FontFamily.SFProDisplay,
        fontWeight: FontWeight.w400,
        fontSize: 14,
        height: 1.20,
      );

  TextStyle get headline3 => const TextStyle(
        color: AppColors.grey,
        fontFamily: FontFamily.SFProDisplay,
        fontWeight: FontWeight.w400,
        fontSize: 16,
        height: 1.20,
      );

  TextStyle get headline4 => const TextStyle(
        color: AppColors.grey,
        fontFamily: FontFamily.SFProDisplay,
        fontWeight: FontWeight.w400,
        fontSize: 18,
        height: 1.20,
      );

  TextStyle get headline5 => const TextStyle(
        fontFamily: FontFamily.SFProDisplay,
        color: AppColors.black,
        fontWeight: FontWeight.w400,
        fontSize: 20,
        height: 1.20,
      );

  TextStyle get headline6 => const TextStyle(
        fontFamily: FontFamily.SFProDisplay,
        color: AppColors.darkGrey,
        fontWeight: FontWeight.w400,
        fontSize: 28,
        height: 1.20,
      );
}

// usage example: context.h3.regular.white
extension TextStyleHelpers on TextStyle {
  TextStyle get white => copyWith(color: AppColors.white);

  TextStyle get grey => copyWith(color: AppColors.grey);

  TextStyle get lightGrey => copyWith(color: AppColors.greyLightMax);

  TextStyle get darkGrey => copyWith(color: AppColors.darkGrey);

  TextStyle get black => copyWith(color: AppColors.black);

  TextStyle get errorRed => copyWith(color: AppColors.errorRed);

  TextStyle size([double? fontSize]) => copyWith(fontSize: fontSize);

  TextStyle get regular => copyWith(fontWeight: FontWeight.w400);

  TextStyle get medium => copyWith(fontWeight: FontWeight.w500);

  TextStyle get semiBold => copyWith(fontWeight: FontWeight.w600);

  TextStyle get bold => copyWith(fontWeight: FontWeight.w700);
}
