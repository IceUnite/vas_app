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
        '/default/log_user_login_post',
        data: {
          "username": userName,
          "password": password,
        },
      );

      // Проверяем успешный ответ
      if (response.statusCode == 200 && response.data != null) {
        return TokenModel.fromJson(response.data!);
      } else {
        throw Exception('Ошибка авторизации');
      }
    } catch (e) {
      throw Exception('Ошибка при выполнении запроса: $e');
    }
  }
}
