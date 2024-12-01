import 'package:flutter/material.dart';
import 'package:vas_app/feature/app/routing/route_path.dart';

class MyDataPage extends StatelessWidget {
  const MyDataPage({Key? key}) : super(key: key);
  static String name = RoutePath.myDataPagePath;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: const Icon(Icons.arrow_back_ios_new, size: 24,), onPressed: () { Navigator.of(context).pop(); },),

      ),
    );
  }
}
