import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:vas_app/core/errors/bot_toast.dart';
import 'package:vas_app/core/resources/assets/resources.dart';
import 'package:vas_app/core/theme/app_colors.dart';
import 'package:vas_app/core/theme/button_style.dart';
import 'package:vas_app/core/theme/typography.dart';
import 'package:vas_app/feature/app/routing/route_path.dart';
import 'package:vas_app/feature/auth_page/presentation/bloc/auth_bloc.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  static String name = RoutePath.authScreenPath;

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> with SingleTickerProviderStateMixin {
  final TextEditingController _loginController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  late AnimationController _animationController;
  bool _isForward = true; // Флаг для отслеживания направления анимации

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    );

    // Добавляем обработчик для изменения направления
    _animationController.addListener(() {
      if (_isForward && _animationController.value >= 0.25) {
        _animationController.reverse();
        _isForward = false;
      } else if (!_isForward && _animationController.value <= 0) {
        _animationController.forward();
        _isForward = true;
      }
    });

    _animationController.forward(); // Запуск анимации
  }

  @override
  void dispose() {
    _animationController.dispose();
    _loginController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state.isCorrect == true) {
            context.goNamed(RoutePath.mainScreenPath);
          }
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 40, top: 60, left: 60, right: 60),
                  child: AnimatedBuilder(
                    animation: _animationController,
                    builder: (context, child) {
                      double angle = _animationController.value * 2.0 * 3.141592653589793;
                      return Transform(
                        transform: Matrix4.identity()
                          ..setEntry(3, 2, 0.001) // Перспектива
                          ..rotateY(angle), // Вращение вокруг оси Y
                        alignment: Alignment.center,
                        child: Container(child: Image.asset(ImageAssets.logo)),
                      );
                    },
                  ),
                ),
                Text(
                  'Вход',
                  style: AppTypography.font24Regular.copyWith(
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 40),
                TextFormField(
                  controller: _loginController,
                  decoration: InputDecoration(
                    hintText: 'Введите логин',
                    hintStyle: TextStyle(color: Colors.grey.shade400),
                    filled: true,
                    fillColor: Colors.grey.shade200,
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    hintText: 'Введите пароль',
                    hintStyle: TextStyle(color: Colors.grey.shade400),
                    filled: true,
                    fillColor: Colors.grey.shade200,
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  obscureText: true,
                ),
                const SizedBox(height: 40),
                Center(
                  child: ElevatedButton(
                    style: AppButtonStyle.primaryStyleOrange,
                    onPressed: () {
                      context.read<AuthBloc>().add(
                        CheckLoginPasswordEvent(
                          // login: '1111',
                          // password: '1111'
                          login: _loginController.text,
                          password: _passwordController.text,
                        ),
                      );
                    },
                    child: Text(
                      'Войти',
                      style: AppTypography.font24Regular.copyWith(
                        color: AppColors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
