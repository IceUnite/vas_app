import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vas_app/core/theme/app_colors.dart';
import 'package:vas_app/core/theme/typography.dart';
import 'package:vas_app/core/widgets/ods_alert.dart';

import '../../feature/auth_page/presentation/bloc/auth_bloc.dart';
import '../../feature/history_page/presentation/bloc/history_order_bloc.dart';
import '../../feature/order_page/presentation/bloc/order_bloc.dart';

class OrderTicketWidget extends StatefulWidget {
  final String titleText;
  final int documentId;
  final String description;
  final String status;
  final String? orderTime;
  final VoidCallback? onTap;

  const OrderTicketWidget({
    super.key,
    required this.titleText,
    required this.documentId,
    required this.description,
    required this.status,
    this.orderTime,
    this.onTap,
  });

  @override
  State<OrderTicketWidget> createState() => _OrderTicketWidgetState();
}

class _OrderTicketWidgetState extends State<OrderTicketWidget> {
  late AuthBloc authBloc;
  late OrderBloc orderBloc;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    authBloc = BlocProvider.of<AuthBloc>(context);
    orderBloc = BlocProvider.of<OrderBloc>(context);
  }

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
          onTap: () {
            final TextEditingController errorController = TextEditingController();
            ApeironSpaceDialog.showActionDialog(
              context,
              title: "Создать заявку на создание документа?",
              confirmText: "Да",
              closeText: 'Нет',
              onPressedConfirm: () {
                final userId = authBloc.state.userId;
                final token = authBloc.state.token;
                orderBloc.add(RegisterApplicationEvent(
                  userId: userId ?? 0,
                  token: token ?? '',
                  docId: widget.documentId,
                  userMessage: errorController.text,
                ));
                BlocProvider.of<HistoryOrderBloc>(context).add(
                  GetHistoryOrdersEvent(userId: userId ?? 0, token: token ?? ''),
                );
              },
              onPressedClosed: () {},
              showTextField: true,
              textFieldController: errorController,
            );
          },
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
                  crossAxisAlignment: CrossAxisAlignment.center,
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
                      crossAxisAlignment: CrossAxisAlignment.end,
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
