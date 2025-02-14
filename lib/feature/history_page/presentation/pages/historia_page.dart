import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:vas_app/core/theme/typography.dart';
import 'package:vas_app/core/widgets/animated_list_item.dart';
import 'package:vas_app/core/widgets/order_ticket_widget.dart';
import 'package:vas_app/feature/app/routing/route_path.dart';
import 'package:vas_app/feature/auth_page/presentation/bloc/auth_bloc.dart';
import 'package:vas_app/feature/history_page/presentation/bloc/history_order_bloc.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  static String name = RoutePath.historyScreenPath;

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  void initState() {
    super.initState();
    final userId = context.read<AuthBloc>().state.userId;
    final token = context.read<AuthBloc>().state.token;
    context.read<HistoryOrderBloc>().add(GetHistoryOrdersEvent(userId: userId, token: token));
  }

  @override
  Widget build(BuildContext context) {
    // final List<Map<String, dynamic>> _items = [
    //   {
    //     'title': 'Справка о составе семьи',
    //     'description':
    //     'Получить данную справку можно в течение 1-2 дней (добавим либо инфу о том, сколько получать, либо краткое описание документа)',
    //     'status': OrderStatus.ready,
    //   },
    //   {
    //     'title': 'Справка о составе семьи',
    //     'description':
    //     'Получить данную справку можно в течение 1-2 дней (добавим либо инфу о том, сколько получать, либо краткое описание документа)',
    //     'status': OrderStatus.rejected
    //   },
    //   {
    //     'title': 'Справка о составе семьи',
    //     'description':
    //     'Получить данную справку можно в течение 1-2 дней (добавим либо инфу о том, сколько получать, либо краткое описание документа)',
    //     'status': OrderStatus.inProgress,
    //   },
    //   {
    //     'title': 'Справка о составе семьи',
    //     'description':
    //     'Получить данную справку можно в течение 1-2 дней (добавим либо инфу о том, сколько получать, либо краткое описание документа)',
    //     'status': OrderStatus.errored,
    //   },
    // ];

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
      body: ListView.builder(
        itemCount: state.historyOrderData?.length ?? 0,
        itemBuilder: (context, index) {
          final item = state.historyOrderData?[index];
          return AnimatedListItems(
            verticalOffset: 50.0,
            duration: const Duration(milliseconds: 600),
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 20),
                child: OrderTicketWidget(
                  titleText: state.historyOrderData?[index]?.document?.name ?? '',
                  description: state.historyOrderData?[index]?.document?.description  ?? '',
                  status: state.historyOrderData?[index]?.status ?? '',
                ),
              ),
            ],
          );
        },
      ),
    );
  },
);
  }
}
