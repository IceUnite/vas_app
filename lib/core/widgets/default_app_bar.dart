import 'package:flutter/material.dart';
import 'package:vas_app/core/theme/app_theme.dart';

class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String titleText;
  final Widget? leading;
  final VoidCallback? onLeadingTap;
  final List<Widget>? actions;
  final Widget? icon;
  final bool? centerTitle;

  const DefaultAppBar({
    super.key,
    required this.titleText,
    this.leading,
    this.onLeadingTap,
    this.actions,
    this.icon,
    this.centerTitle,
  });

  @override
  Widget build(BuildContext context) => AppBar(
        titleSpacing: 0,
        title: Text(
          titleText,
          style: const TextStyle(
            color: AppColors.black,
            fontWeight: FontWeight.w400,
            fontSize: 28,
          ),
        ),
        centerTitle: centerTitle,
        leading: const Row(
          children: [],
        ),
        actions: actions,
      );
  @override
  Size get preferredSize => const Size.fromHeight(54.0);
}
