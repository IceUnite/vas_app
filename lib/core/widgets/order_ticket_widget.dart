import 'package:flutter/material.dart';
import 'package:vas_app/core/theme/app_corners.dart';
import 'package:vas_app/core/theme/app_theme.dart';
import 'package:vas_app/core/theme/typography.dart';

enum OrderStatus {
  ready,
  rejected,
  inProgress,
  doOrder,
}

class OrderTicketWidget extends StatelessWidget {
  final String titleText;
  final String description;
  final OrderStatus status;
  final String? orderTime;

  const OrderTicketWidget({
    super.key,
    required this.titleText,
    required this.description,
    required this.status,
    this.orderTime,
  });

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
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.gray.shade50,
          borderRadius: AppCorners.radius5,
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
                      style: AppTypography.font18Regular
                          .copyWith(fontWeight: FontWeight.w700),
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
                              style: AppTypography.font8Regular
                                  .copyWith(fontWeight: FontWeight.bold),
                            )
                          : const SizedBox(),
                      Container(
                        decoration: BoxDecoration(
                          color: getColor(status),
                          borderRadius: AppCorners.radius15,
                        ),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 5.0, horizontal: 15),
                            child: Text(
                              getText(status),
                              style: AppTypography.font18Regular
                                  .copyWith(fontWeight: FontWeight.w700),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                description,
                style: AppTypography.font14Regular,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
