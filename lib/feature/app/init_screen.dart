import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vas_app/core/resources/assets/resources.dart';
import 'package:vas_app/core/theme/app_colors.dart';
import 'package:vas_app/feature/auth_page/presentation/bloc/auth_bloc.dart';
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

    // final authState = context.read<AuthBloc>().state;
    // bool isAuth = prefs.getBool('isAuth') ?? false;
    // if (authState.isAuth == true || isAuth == true) {
    //   // Если авторизован, переходим на основной экран
    //   Future.microtask(() => context.goNamed(RoutePath.mainScreenPath));
    // } else {
    //   // Если не авторизован, переходим на экран авторизации
      Future.microtask(() => context.goNamed(RoutePath.authScreenPath));
    // }
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
