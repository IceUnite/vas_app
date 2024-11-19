import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vas_app/core/theme/typography.dart';

class Themes {
  static ThemeData get lightTheme => ThemeData(
    brightness: Brightness.light,
    fontFamily: 'Raleway',
    scaffoldBackgroundColor: AppColors.appBackground,
    primaryColor: AppColors.black,
    colorScheme: const ColorScheme.light(primary: AppColors.black),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: AppColors.white,
    ),
    canvasColor: AppColors.white,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.black,
        foregroundColor: AppColors.white,
        minimumSize: const Size(double.infinity, 61),
        textStyle: AppTypography.font16Regular,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
      ),
    ),
    appBarTheme: const AppBarTheme(
      elevation: 1,
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      backgroundColor: AppColors.black100,
      shadowColor: AppColors.black100,
      centerTitle: true,
    ),

    textTheme:const TextTheme(),
    inputDecorationTheme: const InputDecorationTheme(
      border: InputBorder.none,
      focusedBorder: InputBorder.none,
      enabledBorder: InputBorder.none,
      errorBorder: InputBorder.none,
      disabledBorder: InputBorder.none,
    ),
  );

  static ThemeData get darkTheme => lightTheme;
}

abstract class AppColors {
  static const Color white = Color(0xFFFFFFFF);
  static const Color white200 = Color(0xFFD7D7D7);
  static const Color white100 = Color(0xff0d6d6d6);
  static const Color white300 = Color(0xFFEAEAEA);
  static const Color white50 = Color(0xFFF4F4F4);

  static const Color appBackground = Color(0xFF262626);


  static const Color black50 = Color(0xFF262626);
  static const Color black100 = Color(0xFF1D1E1E);
  static const Color black200 = Color(0xffb1b1bcc);
  static const Color black = Color(0xFF141414);
  static const Color red = Color(0xFFEB5757);

  static const Color orange = Color(0xFFF37B7B);

  static const Color green = Color(0xFF1C545B);
  static const Color green100 = Color(0x0ff5b97b);
  static const Color green200 = Color(0xFF25B97B);
  static const Color green300 = Color(0xFFA8BFC2);
  static const Color green400 = Color(0xFF96B5B9);
  static const Color green500 = Color(0xFFD7E3E4);
  static const Color green600 = Color(0xFF87A0A4);

  static const Color light = Color(0xFFA8BFC2);
  static const gray = _Gray();



  static const Color orange100 = Color(0xFFFFCC00);
  static const Color orange200 = Color(0xFFFFD161);


  static const Color purple100 = Color(0xFFE6D7FF);
  static const Color red100 = Color(0x0ff37b7b);
  // static const Color orange100 = Color(0xFFFFAF50);
  static const Color blue100 = Color(0xFF49B2D3);

  static const gradientOrangeBackground = LinearGradient(
    colors: [
      Color(0xFFFFC529),
      Color(0xFFFCC842),
      Color(0xFFF9CA56),
    ],
    stops: [0.0, 0.55, 1.0],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );




}
class _Gray extends ColorSwatch<int> {
  static const _primary = 0xFF1A1A1A;

  const _Gray()
      : super(_primary, const <int, Color>{
    100: Color(_primary),
    90: Color(0xFF303033),
    80: Color(0xFF88868D),
    70: Color(0xFFA7AAAF),
    60: Color(0xFFD2D2D9),
    50: Color(0xFFE1E1E6),
    40: Color(0xFFEBEBF0),
    30: Color(0xFFF3F3F8),
    0: Color(0xFFFFFFFF),
  });

  Color get shade100 => this[100]!;

  Color get shade90 => this[90]!;

  Color get shade80 => this[80]!;

  Color get shade70 => this[70]!;

  Color get shade60 => this[60]!;

  Color get shade50 => this[50]!;

  Color get shade40 => this[40]!;

  Color get shade30 => this[30]!;

  Color get white => this[0]!;
}

