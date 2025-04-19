import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vas_app/core/theme/app_colors.dart';
import 'package:vas_app/core/theme/typography.dart';
import 'package:vas_app/core/widgets/animated_list_item.dart';
import 'package:vas_app/core/widgets/order_ticket_widget.dart';
import 'package:vas_app/feature/app/routing/route_path.dart';
import 'package:vas_app/feature/auth_page/presentation/bloc/auth_bloc.dart';
import 'package:vas_app/feature/history_page/presentation/bloc/history_order_bloc.dart';

import '../../../../core/widgets/history_ticket_widget.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  static String name = RoutePath.orderScreenPath;

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  @override
  void initState() {
    super.initState();
    // final userId = context.read<AuthBloc>().state.userId;
    // final token = context.read<AuthBloc>().state.token;
    // context.read<HistoryOrderBloc>().add(GetHistoryOrdersEvent(userId: userId, token: token));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HistoryOrderBloc, HistoryOrderState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'История заказов',
              style: AppTypography.font26Regular.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
            centerTitle: true,
          ),
          body: state is HistoryOrderLoading
              ? const Center(
                  child: CircularProgressIndicator(
                    color: AppColors.orange200,
                  ),
                )
              : RefreshIndicator(
                  onRefresh: () async {
                    final userId = context.read<AuthBloc>().state.userId;
                    final token = context.read<AuthBloc>().state.token;
                    context.read<HistoryOrderBloc>().add(GetHistoryOrdersEvent(userId: userId, token: token));
                  },
                  child: ListView.builder(
                    physics:
                        const AlwaysScrollableScrollPhysics(), // важно для работы RefreshIndicator при пустом списке
                    itemCount: state.activeOrders?.length ?? 0,
                    itemBuilder: (context, index) {
                      final item = state.activeOrders?[index];
                      return AnimatedListItems(
                        verticalOffset: 50.0,
                        duration: const Duration(milliseconds: 600),
                        children: [
                          Padding(
                            padding: index == ((state.activeOrders?.length ?? 1) - 1)
                                ? const EdgeInsets.only(bottom: 40.0, left: 20, right: 20)
                                : const EdgeInsets.symmetric(horizontal: 20),
                            child: HistoryTicketWidget(
                              titleText: item?.document?.name ?? '',
                              description: item?.document?.description ?? '',
                              errorMessage: item?.description ?? '',
                              status: item?.status ?? '',
                              createdTime: item?.createdAt ?? '',
                              updateTime: item?.updatedAt ?? '',

                              // orderTime: item?.createdAt
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
        );
      },
    );
  }
}
