import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vas_app/core/errors/api_exceptions.dart';

import 'package:vas_app/core/repositories/auth_data_repository_impl.dart';
import 'package:vas_app/feature/auth_page/domain/usecases/auth_usecase.dart';

part 'auth_event.dart';

part 'auth_state.dart';

@lazySingleton
@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthUseCase authUseCase;
  AuthDataRepositoryImpl authDataRepositoryImpl = AuthDataRepositoryImpl();

  AuthBloc({required this.authUseCase}) : super(const AuthInitial()) {
    on<ExiteEvent>(_onExite);
    on<CheckLoginPasswordEvent>(_onLogin);
  }

  Future<void> _onLogin(CheckLoginPasswordEvent event, Emitter<AuthState> emit) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    emit(const AuthLoading()); // Устанавливаем состояние загрузки

    try {
      final data = await authUseCase.loginCommand(
        userName: event.login ?? '',
        password: event.password ?? '',
      );

      emit(AuthSuccess(token: data.token)); // Успешная авторизация
      await prefs.setBool('isAuth', true);
    } catch (e) {
      rethrow;
      // String errorMessage = "Произошла ошибка";
      //
      // if (e is ApiException) {
      //   errorMessage = e.message ?? "Неизвестная ошибка";
    }
  }

  // if (event.login != state.trueLogin || event.password != state.truePassword) {
  //   emit(state.copyWith(isCorrect: false));
  //   GetIt.I<BotToastDi>().showNotification(
  //     icon: null,
  //     title: "Неверный логин или пароль",
  //   );
  // } else {
  //   emit(state.copyWith(isCorrect: true, isAuth: true));
  //   await prefs.setBool('isAuth', true);
  // }
  // }
  Future<void> _onExite(ExiteEvent event, Emitter<AuthState> emit) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // emit(state.copyWith(isCorrect: false, isAuth: false));
    await prefs.setBool('isAuth', false);
  }
}
