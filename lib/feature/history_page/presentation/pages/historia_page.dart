import 'package:flutter/material.dart';
import 'package:vas_app/feature/app/routing/route_path.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({Key? key}) : super(key: key);
  static String name = RoutePath.historyScreenPath;


  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('История'),),
    );
  }
}
