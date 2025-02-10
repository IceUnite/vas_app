import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:vas_app/core/internal/di/sl.dart';

@module
abstract class RegisterModule {
  @lazySingleton
  Dio dio() {
    final dio = Dio();

    // Добавляем интерсепторы
    dio.interceptors.add(AuthInterceptor(dio));

    return dio;
  }
}
