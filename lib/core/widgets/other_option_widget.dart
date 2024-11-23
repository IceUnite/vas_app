import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vas_app/core/theme/app_colors.dart';
import 'package:vas_app/core/theme/typography.dart';

import '../theme/app_theme.dart';

class OtherOptionWidget extends StatelessWidget {
  final String title;
  final String? description;
  final String subTitle;
  final String icon;
  final VoidCallback? onTap;

  const OtherOptionWidget({
    this.onTap,
    required this.title,
    this.description,
    required this.subTitle,
    required this.icon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final decoration = Theme.of(context).extension<ContainerDecorations>()?.containerDecorationShadow;

    return Container(
      height: 161,
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: decoration?.copyWith(borderRadius:BorderRadius.circular(24), color: AppColors.gray.shade40),

      child: InkWell(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: AppTypography.font22Regular.copyWith(fontSize: 18),
            ),
            if (description == null) ...[const Spacer()] else
              Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 25),
                  child: Text(
                    description!,
                    style: const TextStyle(
                      color: AppColors.green,
                    ),
                  ),
                ),
              ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  subTitle,
                  style: AppTypography.font12Regular.copyWith(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: AppColors.gray.shade80,
                  ),
                ),
                const Spacer(),
                ClipOval(
                  child: Container(
                    color: AppColors.white,
                    height: 60,
                    width: 60,
                    child: Center(
                      child: SizedBox(width: 34, height: 34, child: SvgPicture.asset(icon)),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
