import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

enum NotificationType { error, warning, success }

class CustomNotificationWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final NotificationType type;
  final VoidCallback onClose;

  const CustomNotificationWidget({
    super.key,
    required this.title,
    required this.subtitle,
    required this.type,
    required this.onClose,
  });

  Color get backgroundColor {
    switch (type) {
      case NotificationType.error:
        return AppColors.red; // красный
      case NotificationType.warning:
        return AppColors.orange200; // жёлтый
      case NotificationType.success:
        return AppColors.green300; // зелёный
    }
  }

  Color get textColor {
    return Colors.white;
  }

  IconData get iconData {
    return Icons.info_outline;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 18),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(iconData, size: 30, color: textColor),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
