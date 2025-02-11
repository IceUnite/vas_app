import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:vas_app/core/resources/assets/resources.dart';
import 'package:vas_app/core/theme/app_colors.dart';
import 'package:vas_app/core/theme/button_style.dart';
import 'package:vas_app/core/theme/typography.dart';
import 'package:vas_app/feature/app/routing/route_path.dart';
import 'package:vas_app/feature/auth_page/presentation/bloc/auth_bloc.dart';
import 'package:provider/provider.dart';
import 'package:vas_app/core/theme/theme_notifier.dart';

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

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    );

    // Устанавливаем анимацию на повторение
    _animationController.repeat(reverse: true); // Анимация будет повторяться бесконечно
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
    return Consumer<ThemeNotifier>(
      builder: (context, themeNotifier, child) {
        final isDarkTheme = themeNotifier.isDarkTheme;

        return Scaffold(
          backgroundColor: isDarkTheme ? AppColors.black : AppColors.white,
          body: BlocListener<AuthBloc, AuthState>(
            listener: (context, state) {
              //TODO переделать на токен
              if (state is AuthSuccess) {
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
                      padding: const EdgeInsets.only(bottom: 40, top: 100, left: 60, right: 60),
                      child: AnimatedBuilder(
                        animation: _animationController,
                        builder: (context, child) {
                          double angle = _animationController.value * 2.0 * 3.141592653589793;
                          return LayoutBuilder(
                            builder: (context, constraints) {
                              // Ограничиваем размеры логотипа
                              double maxSize = 200;
                              double logoSize = constraints.maxWidth < maxSize ? constraints.maxWidth : maxSize;

                              return Transform(
                                transform: Matrix4.identity()
                                  ..setEntry(3, 2, 0.001) // Перспектива
                                  ..rotateY(angle), // Вращение вокруг оси Y
                                alignment: Alignment.center,
                                child: Container(
                                  width: logoSize,
                                  height: logoSize,
                                  child: SvgPicture.asset(
                                    ImageAssets.logo,
                                    color: AppColors.orange200,
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                    Text(
                      'Вход',
                      style: AppTypography.font24Regular.copyWith(
                        fontWeight: FontWeight.w800,
                        color: isDarkTheme ? AppColors.white : AppColors.black,
                      ),
                    ),
                    const SizedBox(height: 40),
                    TextFormField(
                      controller: _loginController,
                      decoration: InputDecoration(
                        hintText: 'Введите логин',
                        hintStyle: TextStyle(color: Colors.grey.shade400),
                        filled: true,
                        fillColor: isDarkTheme ? Colors.grey.shade700 : Colors.grey.shade200,
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
                        fillColor: isDarkTheme ? Colors.grey.shade700 : Colors.grey.shade200,
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
      },
    );
  }
}
