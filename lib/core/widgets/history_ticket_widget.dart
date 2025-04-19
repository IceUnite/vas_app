import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:vas_app/core/theme/app_colors.dart';
import 'package:vas_app/core/theme/typography.dart';

import '../resources/assets/resources.dart';

class HistoryTicketWidget extends StatefulWidget {
  final String titleText;
  final String description;
  final String errorMessage;
  final String status;
  final String? updateTime;
  final String? createdTime;
  final VoidCallback? onTap;

  const HistoryTicketWidget({
    super.key,
    required this.titleText,
    required this.description,
    required this.errorMessage,
    required this.status,
    this.createdTime,
    this.updateTime,
    this.onTap,
  });

  @override
  State<HistoryTicketWidget> createState() => _HistoryTicketWidgetState();
}

class _HistoryTicketWidgetState extends State<HistoryTicketWidget> {
  Color getColor(String status) {
    switch (status) {
      case "ready":
      case "completed":
        return AppColors.green200;
      case "cancelled":
      case "error":
        return AppColors.red;
      case "in work":
        return AppColors.orange200;
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

  String cleanErrorMessage(String message) {
    // Убираем лишние пробелы в начале и в конце строки, а также заменяем множественные пробелы и переносы на один пробел
    return message.trim().replaceAll(RegExp(r'\s+'), ' ');
  }

  @override
  Widget build(BuildContext context) {
    final backgroundColor = Theme.of(context).brightness == Brightness.dark
        ? AppColors.gray.shade90
        : AppColors.gray.shade40;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: widget.onTap,
          child: Container(
            constraints: const BoxConstraints(minHeight: 100.0),
            decoration: BoxDecoration(
              color: backgroundColor,
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
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Text(
                        widget.titleText,
                        style: AppTypography.font16Regular.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
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
                              '${getText(widget.status)}',
                              style: AppTypography.font12Regular.copyWith(
                                fontWeight: FontWeight.w700,
                                color: AppColors.black,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Text(
                  widget.description,
                  style: AppTypography.font14Regular,
                ),
                if (widget.errorMessage.isNotEmpty) ...[
                  const SizedBox(height: 10),
                  Container(
                    margin: const EdgeInsets.all(8),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: const Color(0xFFE7DFFF),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        SvgPicture.asset(VectorAssets.message, width: 30, height: 30),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            'Сообщение от оператора: ${cleanErrorMessage(widget.errorMessage)}',
                            style: AppTypography.font14Regular.copyWith(color: AppColors.black),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
                if (widget.createdTime != '' || widget.updateTime != '') ... [
                  SizedBox(height: 10),
                  Column(
                    children: [
                      Center(
                        child: Text(
                          widget.createdTime != null && widget.createdTime!.isNotEmpty
                              ? "Заявка создана: ${DateFormat('d MMMM y', 'ru_RU')
                              .format(DateTime.parse(widget.createdTime!))}"
                              : '',
                          style: AppTypography.font10Regular.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Center(
                        child: Text(
                          widget.updateTime != null && widget.updateTime!.isNotEmpty && widget.updateTime != widget.createdTime
                              ? "Статус заявки изменен: ${DateFormat('d MMMM y', 'ru_RU')
                              .format(DateTime.parse(widget.updateTime!))}"
                              : '',
                          style: AppTypography.font10Regular.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ]
              ],
            ),
          ),
        ),
      ),
    );
  }
}
