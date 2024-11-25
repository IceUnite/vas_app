import 'package:flutter/material.dart';
import 'package:vas_app/core/theme/app_colors.dart';
import 'package:vas_app/core/theme/typography.dart';

class ConfirmAlert extends StatelessWidget {
  final String label;
  final Widget? icon;
  final VoidCallback? onCancel;
  final VoidCallback? onConfirm;

  const ConfirmAlert({
    super.key,
    required this.label,
    this.icon,
    this.onCancel,
    this.onConfirm,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: 25 + 16,
      ),
      constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width * .9,
        maxHeight: MediaQuery.of(context).size.height * .5,
        minHeight: 250
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 8,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: AppColors.gray.shade70,
        border: Border.all(
          color: AppColors.gray.shade90, // Цвет рамки
          width: 3.0, // Толщина рамки
        ),
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, .08),
            offset: Offset(0.0, 4.0),
            blurRadius: 8,
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    label,
                    textAlign: TextAlign.center,
                    style: AppTypography.font32Regular.copyWith(
                      color: AppColors.white,
                      fontWeight: FontWeight.w700
                    ),
                    maxLines: 3,
                  ),
                ),
              ),
            ],
          ),
          const Spacer(),
          Column(
            children: [
              ElevatedButton(
                onPressed: () {
                  onConfirm;
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green.shade300, // Легкий красный цвет
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                ),
                child: Text(
                  'Да, я подтверждаю заказ',
                  style: AppTypography.font14Regular.copyWith(
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              // Кнопка "Отмена"
              ElevatedButton(
                onPressed: onCancel,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red.shade300, // Легкий красный цвет
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                ),
                child: Text(
                  'Отмена',
                  style: AppTypography.font14Regular.copyWith(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
