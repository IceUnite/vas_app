import 'package:flutter/material.dart';
import 'package:vas_app/core/theme/app_colors.dart';
import 'package:vas_app/core/theme/app_corners.dart';
import 'package:vas_app/core/theme/typography.dart';

class MyDataTextField extends StatelessWidget {
  final String text;

  const MyDataTextField({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: Container(
        width: double.infinity,
        height: 60,
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.only(left: 15),
        decoration: BoxDecoration(
          color: AppColors.gray.shade30,
          borderRadius: AppCorners.radius15,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5), // Цвет тени
              spreadRadius: 0, // Радиус размытия
              blurRadius: 1, // Радиус размытия тени
              offset: const Offset(
                0,
                2,
              ), // Смещение тени (горизонтальное, вертикальное)
            ),
          ],
        ),
        child: Text(
          text,
          style: AppTypography.font16Regular.copyWith(
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
