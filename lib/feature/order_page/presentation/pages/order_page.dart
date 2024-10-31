import 'package:flutter/material.dart';
import 'package:vas_app/feature/app/routing/route_path.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({Key? key}) : super(key: key);
  static String name = RoutePath.orderScreenPath;


  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('Заказы'),),
    );
  }
}
