import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vas_app/core/theme/app_colors.dart';
import 'package:vas_app/core/theme/typography.dart';
import 'package:vas_app/core/widgets/animated_list_item.dart';
import 'package:vas_app/core/widgets/order_ticket_widget.dart';
import 'package:vas_app/feature/app/routing/route_path.dart';
import 'package:vas_app/feature/auth_page/presentation/bloc/auth_bloc.dart';
import 'package:vas_app/feature/order_page/presentation/bloc/order_bloc.dart';

class GetOrderPage extends StatefulWidget {
  const GetOrderPage({Key? key}) : super(key: key);

  static String name = RoutePath.getOrderScreenPath;

  @override
  State<GetOrderPage> createState() => _GetOrderPageState();
}

class _GetOrderPageState extends State<GetOrderPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderBloc, OrderState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Заказать документ',
              style: AppTypography.font26Regular.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
            centerTitle: true,
          ),
          body: state is OrderLoading
              ? const Center(
                  child: CircularProgressIndicator(
                    color: AppColors.orange200,
                  ),
                )
              : RefreshIndicator(
                  color: AppColors.orange100,
                  onRefresh: () async {
                    final userId = context.read<AuthBloc>().state.userId;
                    final token = context.read<AuthBloc>().state.token;
                    context.read<OrderBloc>().add(GetOrdersEvent(userId: userId, token: token));
                  },
                  child: ListView.builder(
                    physics: const AlwaysScrollableScrollPhysics(),
                    itemCount: state.documents?.length ?? 0,
                    itemBuilder: (context, index) {
                      return AnimatedListItems(
                        verticalOffset: 50.0,
                        duration: const Duration(milliseconds: 600),
                        children: [
                          Padding(
                            padding: index == ((state.documents?.length ?? 1) - 1)
                                ? const EdgeInsets.only(bottom: 40.0, left: 20, right: 20)
                                : const EdgeInsets.symmetric(horizontal: 20),
                            child: OrderTicketWidget(
                              titleText: state.documents?[index]?.name ?? '',
                              description: state.documents?[index]?.description ?? '',
                              status: 'hours',
                              orderTime: state.documents?[index]?.minTime,
                              documentId: state.documents?[index]?.id ?? -1,
                              onTap: () {},
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
