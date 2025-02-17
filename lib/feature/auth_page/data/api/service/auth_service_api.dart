import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:vas_app/feature/auth_page/data/api/auth_api.dart';
import 'package:vas_app/feature/auth_page/data/models/token_model.dart';

@lazySingleton
class AuthApiDioService implements AuthApi {
  final Dio dio;

  AuthApiDioService(this.dio);

  @override
  Future<TokenModel> loginCommand({
    required String userName,
    required String password,
  }) async {
    try {
      final response = await dio.post<Map<String, dynamic>>(
        '/login',
        queryParameters: {
          "log": userName,
          "password": password,
        },
      );
      if (response.data != null) {
        return TokenModel.fromJson(response.data!);
      } else {
        throw Exception('Ошибка авторизации');
      }
    } catch (e) {
      throw Exception('Ошибка при выполнении запроса: $e');
    }
  }

  @override
  Future<void> checkToken({
    required String userId,
    required String token,
  }) async {
    try {
      final response = await dio.post(
        '/check_token',
        queryParameters: {
          "id": userId,
          "token": token,
        },
      );
      if (response.statusCode == 204 || response.statusCode == 200 ) {
        print("Токен действителен");
      } else {
        throw Exception('Ошибка проверки токена');
      }
    } catch (e) {
      throw Exception('Ошибка при выполнении запроса: $e');
    }
  }

}
