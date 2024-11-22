import 'package:flutter/material.dart';
import 'package:vas_app/core/theme/typography.dart';
import 'package:vas_app/core/widgets/order_ticket_widget.dart';
import 'package:vas_app/feature/app/routing/route_path.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({
    super.key,
  });

  static String name = RoutePath.historyScreenPath;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text(
          'История заказов',
          style: AppTypography.font26Regular.copyWith(
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
        leading: const Icon(
          Icons.arrow_back_ios,
          color: Colors.black,
          size: 20,
        ),
      ),
      body: SizedBox()
      // body: Padding(
      //   padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 15.0),
      //   child: ListView(
      //     children: const [
      //       OrderTicketWidget(
      //         titleText: 'Справка о составе семьи',
      //         description:
      //             'Получить данную справку можно в течении 1-2 дней (добавим либо инфу о том сколько получать либо краткое описание документа)',
      //         status: OrderStatus.inProgress,
      //       ),
      //       OrderTicketWidget(
      //         titleText: 'Справка о составе семьи',
      //         description:
      //             'Получить данную справку можно в течении 1-2 дней (добавим либо инфу о том сколько получать либо краткое описание документа)',
      //         status: OrderStatus.rejected,
      //       ),
      //       OrderTicketWidget(
      //         titleText: 'Справка о составе семьи',
      //         description:
      //             'Заберите справку до 14.12.2024 в кабинете 4022',
      //         status: OrderStatus.ready,
      //       ),
      //
      //     ],
      //   ),
      // ),
    );
  }
}


