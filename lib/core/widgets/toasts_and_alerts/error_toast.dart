import 'package:flutter/material.dart';
import 'package:vas_app/core/theme/app_colors.dart';
import 'package:vas_app/core/theme/typography.dart';

class ErrorToast extends StatelessWidget {
  final String label;
  final Widget? icon;
  final VoidCallback? onCancel;

  const ErrorToast({super.key, required this.label, this.icon, this.onCancel});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: 25 + 16,
      ),
      constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width * .9,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 8,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: AppColors.gray.shade40,
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, .08),
            offset: Offset(0.0, 4.0),
            blurRadius: 8,
          )
        ],
      ),
      child: Row(
        children: [
          icon ??
              const CircleAvatar(
                radius: 8,
                backgroundColor: AppColors.redLight,
              ),
          const SizedBox(
            width: 8,
          ),
          Container(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.6,
            ),
            child: Text(
              label,
              style: AppTypography.font16Regular.copyWith(
                color: AppColors.black,
              ),
              maxLines: 30,
            ),
          ),
          const Spacer(),
          IconButton(
            onPressed: () {
              onCancel!();
            },
            icon: const Icon(Icons.close),
          )
        ],
      ),
    );
  }
}
