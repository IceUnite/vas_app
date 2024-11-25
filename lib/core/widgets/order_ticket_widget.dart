import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:vas_app/core/errors/bot_toast.dart';
import 'package:vas_app/core/theme/app_colors.dart';
import 'package:vas_app/core/theme/typography.dart';

enum OrderStatus { ready, rejected, inProgress, doOrder }

class OrderTicketWidget extends StatelessWidget {
  final String titleText;
  final String description;
  final OrderStatus status;
  final String? orderTime;
  VoidCallback? ontap;

  OrderTicketWidget(
      {super.key,
      required this.titleText,
      required this.description,
      required this.status,
      this.orderTime,
      this.ontap});

  Color getColor(OrderStatus status) {
    switch (status) {
      case OrderStatus.ready:
        return AppColors.green200;
      case OrderStatus.rejected:
        return AppColors.red;
      case OrderStatus.inProgress:
        return AppColors.orange200;
      case OrderStatus.doOrder:
        return AppColors.orange200;
    }
  }

  String getText(OrderStatus status) {
    switch (status) {
      case OrderStatus.ready:
        return 'Выполнено';
      case OrderStatus.rejected:
        return 'Отменено';
      case OrderStatus.inProgress:
        return 'В обработке';
      case OrderStatus.doOrder:
        return orderTime ?? '48 часов';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: InkWell(
        onTap: () {
          GetIt.I<BotToastDi>().showConfirmDialog(
            icon: null,
            title: "Неверный логин или пароль",
            onConfirm: () {},
            subTitle: 'subTitle', context: context,
          );
        },
        child: Container(
          constraints: const BoxConstraints(
            minHeight: 180.0,
          ),
          decoration: BoxDecoration(
            color: AppColors.gray.shade40,
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Text(
                        titleText,
                        style: AppTypography.font18Regular.copyWith(fontWeight: FontWeight.w700),
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Column(
                      children: [
                        status.name == 'doOrder'
                            ? Text(
                                'Время выполнения',
                                style: AppTypography.font10Regular.copyWith(fontWeight: FontWeight.bold),
                              )
                            : const SizedBox(),
                        Container(
                          constraints: status.name == 'doOrder'
                              ? const BoxConstraints(minWidth: 100)
                              : const BoxConstraints(minWidth: 120),
                          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                          margin: const EdgeInsets.only(top: 5),
                          decoration: BoxDecoration(
                            color: getColor(status),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text(
                              getText(status),
                              style: AppTypography.font16Regular.copyWith(fontWeight: FontWeight.w700),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  description,
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
