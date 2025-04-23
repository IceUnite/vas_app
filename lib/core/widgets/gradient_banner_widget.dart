import 'package:flutter/material.dart';
import 'package:vas_app/core/theme/app_colors.dart';
import 'package:vas_app/core/theme/app_theme.dart';
import 'package:vas_app/core/theme/button_style.dart';
import 'package:vas_app/core/theme/typography.dart';

class GradientBannerWidget extends StatelessWidget {
  final String? imagePath;
  final String? title;
  final String? btnText;
  final String? description;
  final double width;
  final LinearGradient? gradient;
  final VoidCallback? onPress;

  const GradientBannerWidget({
    this.imagePath,
    this.gradient,
    this.description,
    this.btnText,
    this.title,
    this.onPress,
    required this.width,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // Значения по умолчанию для nullable полей
    final String displayTitle = title ?? '';
    final String displayDescription = description ?? '';
    final String displayBtnText = btnText ?? '';
    final containerDecorations = Theme.of(context).extension<ContainerDecorations>();
    final decoration = containerDecorations?.containerDecorationShadow;

    return Container(
      width: double.infinity,
      height: 180,
      decoration: const BoxDecoration(
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
        // borderRadius: BorderRadius.circular(25),
        gradient:  AppColors.gradientOrangeBackground,
      ),

      child: Stack(
        children: [
          // Отображение изображения, если оно указано
          if (imagePath != null)
            Positioned(

              right: 0,
              bottom: 0,
              child: Image(
                image: AssetImage(imagePath!),
                height: 180,
              ),
            ),
          Positioned(
            left: 20,
            top: 10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Заголовок
                SizedBox(
                  width: 200,
                  height: 70,
                  child: Text(
                    displayTitle,
                    style: AppTypography.font18Regular.copyWith(
                      color: AppColors.white,
                    ),
                  ),
                ),
                SizedBox(
                  width: 137,
                  child: Text(
                    displayDescription,
                    style: AppTypography.font18Regular.copyWith(
                      color: AppColors.white,
                      fontSize: 13,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 20,
            left: 20,
            child: SizedBox(
              height: 30,
              width: width,
              child: ElevatedButton(
                onPressed: onPress,
                style: AppButtonStyle.primaryStyleOrange.copyWith(
                  shape: WidgetStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  backgroundColor: const WidgetStatePropertyAll(AppColors.white),
                ),
                child: Text(
                  displayBtnText,
                  style: AppTypography.font12Regular.copyWith(
                    color: AppColors.black,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
