import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/internal/di/sl.dart';
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
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            context.goNamed(RoutePath.authScreenPath);
          },
          child: const Text('go to next page'),
        ),
      ),
    );
  }
}
