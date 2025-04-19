import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vas_app/core/resources/assets/resources.dart';
import 'package:vas_app/core/theme/app_colors.dart';
import 'package:vas_app/feature/auth_page/presentation/bloc/auth_bloc.dart';
import '../history_page/presentation/bloc/history_order_bloc.dart';
import '../order_page/presentation/bloc/order_bloc.dart';
import 'routing/route_path.dart';

class InitScreen extends StatefulWidget {
  const InitScreen({super.key});

  static String name = RoutePath.init;

  @override
  State<InitScreen> createState() => _InitScreenState();
}

class _InitScreenState extends State<InitScreen> {
  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final userId = prefs.getInt('userId');
    final token = prefs.getString('accessToken');

    if (userId != null && token != null) {
      // Вызов события для проверки токена
      context.read<AuthBloc>().add(CheckTokenEvent(userId: userId, token: token));

      // Слушаем изменения состояния блока
      context.read<AuthBloc>().stream.listen((state) {
        if (state is AuthSuccess) {
          // Если токен валидный, переходим на основной экран
          // Сразу загружаем данные для отображения на экранах в приложении
          context.read<OrderBloc>().add(GetOrdersEvent(userId: userId, token: token));
          context.read<HistoryOrderBloc>().add(GetHistoryOrdersEvent(userId: userId, token: token));
          Future.microtask(() => context.goNamed(RoutePath.mainScreenPath));
        } else if (state is AuthUnauthorized || state is AuthFailure) {
          // Если не авторизован, переходим на экран авторизации
          Future.microtask(() => context.goNamed(RoutePath.authScreenPath));
        }
      });
    } else {
      // Если нет токена или userId, сразу переходим на экран авторизации
      Future.microtask(() => context.goNamed(RoutePath.authScreenPath));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white, // Цвет фона берется из темы
      body: Center(
        child: SizedBox(
          width: 150,
          height: 150,
          child: SvgPicture.asset(
            ImageAssets.logo,
            color: AppColors.orange200,
          ),
        ),
      ),
    );
  }
}
