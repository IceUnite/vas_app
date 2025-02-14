import 'package:flutter/material.dart';
import 'package:vas_app/core/theme/app_colors.dart';
import 'package:vas_app/core/theme/typography.dart';
import 'package:vas_app/core/widgets/ods_alert.dart';

class OrderTicketWidget extends StatefulWidget {
  final String titleText;
  final String description;
  final String status;
  final String? orderTime;
  VoidCallback? onTap;

  OrderTicketWidget({
    super.key,
    required this.titleText,
    required this.description,
    required this.status,
    this.orderTime,
    this.onTap,
  });

  @override
  State<OrderTicketWidget> createState() => _OrderTicketWidgetState();
}

class _OrderTicketWidgetState extends State<OrderTicketWidget> {
  Color getColor(String status) {
    switch (status) {
      case "ready":
        return AppColors.green200;
      case "cancelled":
        return AppColors.red;
      case "error":
        return AppColors.red;
      case "in work":
        return AppColors.orange200;
      case "completed":
        return AppColors.green200;
      default:
        return AppColors.orange200;
    }
  }

  String getText(String status) {
    switch (status) {
      case "ready":
        return 'Выполнено';
      case "cancelled":
        return 'Отменено';
      case "error":
        return 'Ошибка';
      case "in work":
        return 'В обработке';
      case "completed":
        return 'Завершено';
      case "hours":
        return 'часов';
      default:
        return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: InkWell(
        onTap: () {
          ApeironSpaceDialog.showActionDialog(
            context,
            title: "Подтверждение заказа документа",
            confirmText: 'Подтвердить',
            onPressedConfirm: () {
              widget.onTap?.call();
            },
            onPressedClosed: () {},
          );
        },
        child: IntrinsicHeight(
          child: Container(
            constraints: const BoxConstraints(
              minHeight: 180.0,
              maxHeight: 240.0,
            ),
            decoration: BoxDecoration(
              color: Theme.of(context).brightness == Brightness.dark
                  ? AppColors.gray.shade90 // Для темной темы
                  : AppColors.gray.shade40,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.25),
                  offset: const Offset(4, 4),
                  blurRadius: 5.0,
                  spreadRadius: 0.25,
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text(
                          textAlign: TextAlign.start,
                          widget.titleText,
                          style: AppTypography.font16Regular.copyWith(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        children: [
                          if (widget.status == 'hours')
                            Text(
                              'Время выполнения',
                              style: AppTypography.font10Regular.copyWith(fontWeight: FontWeight.bold),
                            ),
                          Container(
                            width: 95,
                            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 6),
                            margin: const EdgeInsets.only(top: 5),
                            decoration: BoxDecoration(
                              color: getColor(widget.status),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Text(
                                '${widget.orderTime ?? ''} ${getText(widget.status)}',
                                style: AppTypography.font12Regular
                                    .copyWith(fontWeight: FontWeight.w700, color: AppColors.black),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text(
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    widget.description,
                    style: AppTypography.font14Regular,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
