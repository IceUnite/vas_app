import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vas_app/core/resources/assets/resources.dart';
import 'package:vas_app/core/theme/app_colors.dart';
import 'routing/route_path.dart';

class InitScreen extends StatefulWidget {
  const InitScreen({super.key});

  static String name = RoutePath.init;

  @override
  State<InitScreen> createState() => _InitScreenState();
}

class _InitScreenState extends State<InitScreen> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // Инициализация GetIt
    // configureDependencies();

    // Навигация теперь будет корректно работать
    Future.microtask(() => context.goNamed(RoutePath.authScreenPath));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.white, // Цвет фона берется из темы
      body: Center(
        child: SizedBox(width: 150, height: 150, child: Image.asset(ImageAssets.logo)),
      ),
    );
  }
}
