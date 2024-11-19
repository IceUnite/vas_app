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
                : const SizedBox(),
          ),
          Positioned(
              left: 20,
              top: 10,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 200,
                    height: 70,
                    child: Text(
                      title!,
                      style: AppTypography.font18Regular.copyWith(
                        color: AppColors.white,
                      ),
                    ),
                  ),
                  // const SizedBox(height: 10),
                  SizedBox(
                    width: 137,
                    child: Text(
                      description!,
                      style: AppTypography.font18Regular.copyWith(color: AppColors.white, fontSize: 13),
                    ),
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
                style: AppButtonStyle.primaryStyleOrange.copyWith(
                  shape: WidgetStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),),
                  backgroundColor: const WidgetStatePropertyAll(AppColors.white)
                ),
                child: Text(btnText!, style: AppTypography.font12Regular.copyWith(color: AppColors.black, fontWeight: FontWeight.w700),),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
