import 'package:flutter/material.dart';
import 'package:vas_app/core/theme/typography.dart';
import 'package:vas_app/core/widgets/animated_list_item.dart';
import 'package:vas_app/core/widgets/order_ticket_widget.dart';
import 'package:vas_app/feature/app/routing/route_path.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  static String name = RoutePath.historyScreenPath;

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> _items = [
      {
        'title': 'Справка о составе семьи',
        'description':
        'Получить данную справку можно в течение 1-2 дней (добавим либо инфу о том, сколько получать, либо краткое описание документа)',
        'status': OrderStatus.inProgress,
      },
      {
        'title': 'Справка о составе семьи',
        'description':
        'Получить данную справку можно в течение 1-2 дней (добавим либо инфу о том, сколько получать, либо краткое описание документа)',
        'status': OrderStatus.inProgress,
      },
      {
        'title': 'Справка о составе семьи',
        'description':
        'Получить данную справку можно в течение 1-2 дней (добавим либо инфу о том, сколько получать, либо краткое описание документа)',
        'status': OrderStatus.inProgress,
      },
    ];

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
        itemCount: _items.length,
        itemBuilder: (context, index) {
          final item = _items[index];
          return AnimatedListItems(
            verticalOffset: 50.0,
            duration: const Duration(milliseconds: 600),
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 20),
                child: OrderTicketWidget(
                  titleText: item['title'] as String,
                  description: item['description'] as String,
                  status: item['status'] as OrderStatus,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
