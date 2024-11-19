import 'package:flutter/material.dart';
import 'package:vas_app/core/theme/app_theme.dart';

class AppButtonStyle {
  const AppButtonStyle._();

  static final primaryStyleOrange = ButtonStyle(
    fixedSize: WidgetStateProperty.all(const Size(335, 58)),
    shape: WidgetStateProperty.all(RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16),
    )),
    textStyle: WidgetStateProperty.all(const TextStyle(color: AppColors.white)),
    backgroundColor: WidgetStateProperty.all(AppColors.orange200),
    elevation: const WidgetStatePropertyAll(5),
  );

  static final primaryStyleGreenOpacity = ButtonStyle(
    fixedSize: WidgetStateProperty.all(const Size(335, 58)),
    shape: WidgetStateProperty.all(RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(5),
    )),
    textStyle: WidgetStateProperty.all(const TextStyle(color: AppColors.green)),
    backgroundColor: WidgetStateProperty.all(AppColors.green300),
  );
}
