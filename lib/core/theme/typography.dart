import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class AppTypography {

  static TextStyle _nunito({FontWeight? fontWeight, double? fontSize, double? letterSpacing, double? height}) =>
      GoogleFonts.nunito(fontWeight: fontWeight, fontSize: fontSize, letterSpacing: letterSpacing, height: height).copyWith(
        fontFeatures: <FontFeature>[
          const FontFeature.enable('lnum'),
          const FontFeature.enable('pnum'),
          const FontFeature.disable('liga'),
        ],
      );

  static TextStyle _raleway({FontWeight? fontWeight, double? fontSize, double? letterSpacing, double? height}) =>
      GoogleFonts.raleway(fontWeight: fontWeight, fontSize: fontSize, letterSpacing: letterSpacing, height: height).copyWith(
        fontFeatures: <FontFeature>[
          const FontFeature.enable('lnum'),
          const FontFeature.enable('pnum'),
          const FontFeature.disable('liga'),
        ],
      );
  static TextStyle get font8Regular => _nunito(fontSize: 8);
  static TextStyle get font10Regular => _nunito(fontSize: 10);
  static TextStyle get font12Regular => _nunito(fontSize: 12);
  static TextStyle get font14Regular => _nunito(fontSize: 14);
  static TextStyle get font16Regular => _nunito(fontSize: 16);
  static TextStyle get font18Regular => _nunito(fontSize: 18);
  static TextStyle get font20Regular => _nunito(fontSize: 20);
  static TextStyle get font22Regular => _nunito(fontSize: 22);
  static TextStyle get font24Regular => _nunito(fontSize: 24);
  static TextStyle get font26Regular => _nunito(fontSize: 26);
  static TextStyle get font28Regular => _nunito(fontSize: 28);
  static TextStyle get font30Regular => _nunito(fontSize: 30);
  static TextStyle get font32Regular => _nunito(fontSize: 32);
  // Продолжите для других размеров шрифта аналогичным образом

  static TextStyle get textTitle => _nunito(fontWeight: FontWeight.w600, fontSize: 24, height: 32 / 24, letterSpacing: 0);
}

extension Weights on TextStyle {
  TextStyle get regular => copyWith(fontWeight: FontWeight.w400);
  TextStyle get medium => copyWith(fontWeight: FontWeight.w500);
  TextStyle get semibold => copyWith(fontWeight: FontWeight.w600);
  TextStyle get bold => copyWith(fontWeight: FontWeight.w700);
  TextStyle get heavy => copyWith(fontWeight: FontWeight.w800);
}
