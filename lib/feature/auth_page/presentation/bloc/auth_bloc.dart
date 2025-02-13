import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:vas_app/core/repositories/auth_data_repository_impl.dart';
import 'package:vas_app/core/utils/shared_preference.dart';
import 'package:vas_app/feature/auth_page/domain/usecases/auth_usecase.dart';
import 'package:vas_app/main.dart';

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
    on<CheckTokenEvent>(_onCheckToken);
  }

  SharedPrefsRawProvider sharedPrefsRawProvider = SharedPrefsRawProvider(prefs);

  Future<void> _onLogin(CheckLoginPasswordEvent event, Emitter<AuthState> emit) async {
    emit(const AuthLoading());

    try {
      final data = await authUseCase.loginCommand(
        userName: event.login ?? '',
        password: event.password ?? '',
      );

      emit(AuthSuccess(token: data.token, userId: data.id)); // Успешная авторизация
      sharedPrefsRawProvider.setString(SharedKeyWords.accessTokenKey, data.token);
      sharedPrefsRawProvider.setInt(SharedKeyWords.userId, data.id);
    } catch (e) {
      emit(AuthFailure(errorMessage: e.toString(), userId: null));
      rethrow;
    }
  }

  Future<void> _onExite(ExiteEvent event, Emitter<AuthState> emit) async {
    //чистим кэш
    sharedPrefsRawProvider.removeKey(SharedKeyWords.accessTokenKey);
    sharedPrefsRawProvider.removeKey(SharedKeyWords.userId);
    emit(const AuthUnauthorized());
  }

  Future<void> _onCheckToken(CheckTokenEvent event, Emitter<AuthState> emit) async {
    try {
      // Получаем userId и token из SharedPreferences
      //TODO переделать хранение токена в secure storage
      final userId = sharedPrefsRawProvider.getInt(SharedKeyWords.userId);
      final token = sharedPrefsRawProvider.getString(SharedKeyWords.accessTokenKey);

      if (userId != null && token != null) {
        // Выполняем проверку токена
        await authUseCase.checkToken(userId: userId.toString(), token: token);

        // Если токен валиден, показываем успешный статус
        emit(AuthSuccess(token: token, userId: userId)); // Используйте реальный токен если нужно
      } else {
        // Если нет токена или id, то статус авторизации не выполнен
        emit(const AuthUnauthorized());
      }
    } on DioException catch (e) {
      // В случае ошибки, например, при невалидном токене
      emit(AuthFailure(errorMessage: e.toString(), userId: null));
    } catch (e) {
      emit(AuthFailure(errorMessage: e.toString(), userId: null));
    }
  }
}
