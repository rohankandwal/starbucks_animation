import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:starbuck_animation_redesign/utils/app_constants.dart';

class FontConstants {
  FontConstants._();

  static TextStyle fontBoldStyle(
      {double fontSize = 12.0,
      Color fontColor = Colors.white,
      double height = 1,
      double letterSpacing = 0,
      bool isUnderline = false}) {
    return _headlineFontStyle(
      fontSize: fontSize,
      fontColor: fontColor,
      fontWeight: FontWeight.w700,
      decoration: isUnderline ? TextDecoration.underline : TextDecoration.none,
      height: height,
      letterSpacing: letterSpacing,
      //letterSpacing: -0.10
    );
  }

  static TextStyle fontRegularStyle(
      {double fontSize = 12.0,
      Color fontColor = Colors.white,
      double height = 1,
      double letterSpacing = 0,
      bool isUnderline = false}) {
    return _headlineFontStyle(
      fontSize: fontSize,
      fontColor: fontColor,
      fontWeight: FontWeight.w400,
      decoration: isUnderline ? TextDecoration.underline : TextDecoration.none,
      height: height,
      letterSpacing: letterSpacing,
      //letterSpacing: -0.10
    );
  }

  static TextStyle fontMediumStyle(
      {double fontSize = 12.0,
      Color fontColor = Colors.white,
      double height = 1,
      double letterSpacing = 0,
      bool isUnderline = false}) {
    return _headlineFontStyle(
      fontSize: fontSize,
      fontColor: fontColor,
      fontWeight: FontWeight.w500,
      decoration: isUnderline ? TextDecoration.underline : TextDecoration.none,
      //letterSpacing: -0.10
    );
  }

  static TextStyle fontItalicStyle(
      {double fontSize = 12.0,
      Color fontColor = Colors.white,
      bool isUnderline = false}) {
    return _headlineFontStyle(
      fontSize: fontSize,
      fontColor: fontColor,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.italic,
      decoration: isUnderline ? TextDecoration.underline : TextDecoration.none,
      //letterSpacing: -0.10
    );
  }

  static TextStyle _headlineFontStyle({
    double fontSize = 12.0,
    Color fontColor = Colors.white,
    FontWeight fontWeight = FontWeight.normal,
    TextDecoration decoration = TextDecoration.none,
    double letterSpacing = 0,
    FontStyle fontStyle = FontStyle.normal,
    double wordSpacing = 0,
    Color backgroundColor = Colors.transparent,
    double height = 1,
  }) {
    final Paint paint = Paint();
    paint.color = backgroundColor;
    return GoogleFonts.notoSans(
      color: fontColor,
      fontSize: fontSize,
      fontWeight: fontWeight,
      decoration: decoration,
      letterSpacing: letterSpacing,
      fontStyle: fontStyle,
      wordSpacing: wordSpacing,
      decorationColor: AppColors.light_grey,
      decorationThickness: .8,
      decorationStyle: TextDecorationStyle.solid,
      height: height,
      background: paint,
    );
  }
}
