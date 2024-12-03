import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:vas_app/core/theme/typography.dart';
import 'package:vas_app/core/widgets/animated_list_item.dart';
import 'package:vas_app/core/widgets/order_ticket_widget.dart';
import 'package:vas_app/feature/app/routing/route_path.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({Key? key}) : super(key: key);

  static String name = RoutePath.orderScreenPath;

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  @override
  Widget build(BuildContext context) {
    final List<Widget> _orderWidgets = [
      OrderTicketWidget(
        titleText: 'Справка о составе семьи',
        description:
            'Получить данную справку можно в течение 1-2 дней (добавим либо инфу о том, сколько получать, либо краткое описание документа)',
        status: OrderStatus.doOrder,
        onTap: () {
        },
      ),
      OrderTicketWidget(
        titleText: 'Справка о составе семьи',
        description:
            'Получить данную справку можно в течение 1-2 дней (добавим либо инфу о том, сколько получать, либо краткое описание документа)',
        status: OrderStatus.doOrder,
        orderTime: '72 часа',
      ),
      OrderTicketWidget(
        titleText: 'Справка о составе семьи',
        description:
            'Получить данную справку можно в течение 1-2 дней (добавим либо инфу о том, сколько получать, либо краткое описание документа)',
        status: OrderStatus.doOrder,
        orderTime: '24 часа',
      ),
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView.builder(
          itemCount: _orderWidgets.length,
          itemBuilder: (context, index) {
            return AnimatedListItems(
              verticalOffset: 50.0,
              duration: const Duration(milliseconds: 600),
              children: [
                _orderWidgets[index],
              ],
            );
          },
        ),
      ),
    );
  }
}

class Document {
  final int id;
  final String name;
  final String description;
  final String status;

  Document({required this.id, required this.name, required this.description, required this.status});
  factory Document.fromJson(Map<String, dynamic> json) {
    return Document(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      status: json['status'],
    );
  }
}

Future<void> getDocuments() async {
  final dio = Dio();
  final uri = 'http://127.0.0.1:8000/documents';

  try {
    final response = await dio.get(uri);

    if (response.statusCode == 200) {
      List<dynamic> data = response.data;
      List<Document> documents = data.map((jsonItem) => Document.fromJson(jsonItem)).toList();

      print( response.data);
      for (var document in documents) {
        print('ID: ${document.id}, Name: ${document.name},Description : ${document.description} Status: ${document.status}');
      }
    } else {
      print('Ошибка при получении документов: ${response.statusCode}');
    }
  } catch (e) {
    print('Ошибка при выполнении запроса: $e');
  }
}
