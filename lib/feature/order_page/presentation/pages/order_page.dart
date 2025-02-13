import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vas_app/core/theme/typography.dart';
import 'package:vas_app/core/widgets/animated_list_item.dart';
import 'package:vas_app/core/widgets/order_ticket_widget.dart';
import 'package:vas_app/feature/app/routing/route_path.dart';
import 'package:vas_app/feature/auth_page/presentation/bloc/auth_bloc.dart';
import 'package:vas_app/feature/order_page/presentation/bloc/order_bloc.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({Key? key}) : super(key: key);

  static String name = RoutePath.orderScreenPath;

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {

  @override
  void initState() {
    final userId = context.read<AuthBloc>().state.userId;
    final token = context.read<AuthBloc>().state.token;
    context.read<OrderBloc>().add(GetOrdersEvent(userId: userId, token: token));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<OrderBloc, OrderState>(
  builder: (context, state) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Заказ документа',
          style: AppTypography.font26Regular.copyWith(
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView.builder(
          itemCount: state.documents.length,
          itemBuilder: (context, index) {
            return AnimatedListItems(
              verticalOffset: 50.0,
              duration: const Duration(milliseconds: 600),
              children: [
                OrderTicketWidget(
                  titleText: state.documents[index].name ?? '',
                  description:state.documents[index].description ?? '',
                  status: OrderStatus.doOrder,
                  onTap: () {
                  },
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
