import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:vas_app/core/resources/assets/resources.dart';
import 'package:vas_app/core/theme/app_theme.dart';
import 'package:vas_app/core/theme/button_style.dart';
import 'package:vas_app/core/theme/typography.dart';
import 'package:vas_app/feature/app/routing/route_path.dart';
import 'package:vas_app/feature/auth_page/presentation/bloc/auth_bloc.dart';

class AuthPage extends StatelessWidget {
  AuthPage({Key? key}) : super(key: key);

  static String name = RoutePath.authScreenPath;
  final TextEditingController _loginController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

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
                  child: Image.asset(ImageAssets.logo),
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
  }
}
