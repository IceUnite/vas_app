import 'package:flutter/material.dart';
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
    return Container(
      width: double.infinity,
      height: 180,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        gradient: gradient ?? AppColors.gradientOrangeBackground,
      ),
      child: Stack(
        children: [
          Positioned(
            right: 10,
            bottom: 0,
            child: imagePath != null
                ? Image(
              image: AssetImage(imagePath!),
              height: 180,
            )
                : SizedBox(),
          ),
          Positioned(
              left: 20,
              top: 10,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title!,
                    style: AppTypography.font24Regular.copyWith(
                      color: AppColors.white,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    description!,
                    style: AppTypography.font18Regular.copyWith(color: AppColors.white, fontSize: 13),
                  ),
                ],
              )),
          Positioned(
            bottom: 20,
            left: 20,
            child: SizedBox(
              height: 30,
              width: width,
              child: ElevatedButton(
                onPressed: onPress,
                style: AppButtonStyle.primaryStyleOrange,
                child: Text(btnText!),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
