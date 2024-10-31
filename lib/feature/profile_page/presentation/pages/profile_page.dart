import 'package:flutter/material.dart';
import 'package:vas_app/feature/app/routing/route_path.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);
  static String name = RoutePath.profileScreenPath;

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('Профиль'),),
    );
  }
}
