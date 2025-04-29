import 'package:flutter/material.dart';
import 'package:vas_app/core/theme/typography.dart';

class TextBlockWidget extends StatelessWidget {
  final String? text;
  final String hintText;
  final IconData? icon;

  const TextBlockWidget({
    super.key,
    this.text,
    this.hintText = '',
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final isDarkTheme = Theme.of(context).brightness == Brightness.dark;
    final displayText = (text == null || text!.isEmpty) ? hintText : text!;
    final textColor = (text == null || text!.isEmpty)
        ? (isDarkTheme ? Colors.white70 : Colors.grey)
        : (isDarkTheme ? Colors.white : Colors.black);
    final lineColor = isDarkTheme ? Colors.white24 : Colors.grey.shade300;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start, // <-- важное исправление
            children: [
              if (icon != null) ...[
                Icon(icon, size: 20, color: textColor),
                const SizedBox(width: 10),
              ],
              Expanded(
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  child: Align(
                    alignment: Alignment.centerLeft, // <-- ключевое
                    child: Text(
                      displayText,
                      key: ValueKey(displayText),
                      style: AppTypography.font16Regular.copyWith(),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 1,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                lineColor,
                lineColor.withOpacity(0),
              ],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ),
        ),
      ],
    );
  }
}
