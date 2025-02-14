import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vas_app/core/theme/app_colors.dart';
import 'package:vas_app/core/theme/typography.dart';

class Themes {
  static ThemeData get lightTheme => ThemeData(
    brightness: Brightness.light,
    fontFamily: 'Raleway',
    scaffoldBackgroundColor: AppColors.white,
    primaryColor: AppColors.white,
    colorScheme: const ColorScheme.light(primary: AppColors.white),
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
      elevation: 0,
      // systemOverlayStyle: SystemUiOverlayStyle(
        // statusBarColor: Colors.transparent, // Прозрачный статус-бар
        // statusBarIconBrightness: Brightness.dark, // Темные значки
      // ),
      backgroundColor: AppColors.white,
      shadowColor: AppColors.white,
      centerTitle: true,
    ),
    textTheme: const TextTheme(),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(12),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(12),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(12),
      ),
      errorBorder: InputBorder.none,
      disabledBorder: InputBorder.none,
    ),
    extensions: const <ThemeExtension<dynamic>>[
      ContainerDecorations(),
    ],
  );

  static ThemeData get darkTheme => lightTheme.copyWith(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.black100,
    primaryColor: AppColors.black100,
    colorScheme: const ColorScheme.dark(
      primary: AppColors.black100,
      onPrimary: AppColors.white,
      surface: AppColors.black,
      onSurface: AppColors.white,
    ),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: AppColors.green, // Подсветка курсора
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.green,
        foregroundColor: AppColors.black,
        minimumSize: const Size(double.infinity, 61),
        textStyle: AppTypography.font16Regular,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
      ),
    ),
    appBarTheme:  AppBarTheme(
      elevation: 0,
      // systemOverlayStyle: SystemUiOverlayStyle(
      //   statusBarColor: AppColors.black, // Черный статус-бар
      //   statusBarIconBrightness: Brightness.light, // Светлые значки
      // ),
      backgroundColor: AppColors.gray.shade90,
      shadowColor: AppColors.black100,
      centerTitle: true,
    ),
    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        color: AppColors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      bodySmall: TextStyle(
        color: AppColors.white,
        fontSize: 16,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(12),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(12),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(12),
      ),
      errorBorder: InputBorder.none,
      disabledBorder: InputBorder.none,
    ),
    extensions: const <ThemeExtension<dynamic>>[
      ContainerDecorations(),
    ],
  );
}

class ContainerDecorations extends ThemeExtension<ContainerDecorations> {
  final BoxDecoration containerDecorationShadow;

  const ContainerDecorations({
    this.containerDecorationShadow = const BoxDecoration(
      color: Color(0xFFE1E1E6),
      borderRadius: BorderRadius.all(Radius.circular(12)),
      boxShadow: [
        BoxShadow(
          color: Colors.black26,
          offset: Offset(4, 4),
          blurRadius: 5.0,
          spreadRadius: 0.25,
        ),
      ],
    ),
  });

  @override
  ContainerDecorations copyWith({BoxDecoration? containerDecoration}) {
    return ContainerDecorations(
      containerDecorationShadow: containerDecoration ?? this.containerDecorationShadow,
    );
  }

  @override
  ContainerDecorations lerp(
      ThemeExtension<ContainerDecorations>? other, double t) {
    if (other is! ContainerDecorations) return this;
    return ContainerDecorations(
      containerDecorationShadow: BoxDecoration.lerp(
          containerDecorationShadow, other.containerDecorationShadow, t)!,
    );
  }
}
