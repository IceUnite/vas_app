
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:vas_app/core/errors/error_handler.dart';
import 'package:vas_app/core/errors/exception.dart';
import 'package:vas_app/core/errors/failure.dart';
import 'package:vas_app/feature/auth_page/data/models/token_model.dart';
import 'package:vas_app/feature/auth_page/domain/entities/refresh_token_entitie.dart';
import 'package:vas_app/feature/auth_page/domain/repository/auth_repository.dart';

@lazySingleton
class AuthUseCase {
  final AuthRepository authRepository;

  const AuthUseCase({required this.authRepository});

  // Future<TokenBundleEntity?> init() => authRepository.init();

  /// Вход в систему
  Future<TokenModel> loginCommand({
    required String userName,
    required String password,
  }) async {
    try {
      final loginCommandData = await authRepository.loginCommand(userName: userName, password: password);
      return loginCommandData;
    } on DioException catch (e) {
       // Преобразование DioError в наше исключение
      Exception exception = ServerException(e.message.toString());
      // Обработка исключения с использованием ErrorHandler
      Failure failure = ErrorHandler.handleException(exception);
      // В зависимости от типа отказа, принимаем соответствующее решение
      // Например, можно возвращать разные результаты или вызывать callback с отказом
      if (failure is ServerFailure) {
        // Логика обработки отказа с ервера
      } else {
        // Логика обработки других типов отказов
      }
      throw failure;
    }
  }

  /// Выход из системы
  Future<void> logOut() async => authRepository.logout();

  /// Обновление токена
  // Future<JwtTokensDTOEntity?> refreshToken({
  //   required RefreshTokenEntitie refreshToken,
  // }) async =>
  //     authRepository.refreshToken(refreshToken: refreshToken);
}
