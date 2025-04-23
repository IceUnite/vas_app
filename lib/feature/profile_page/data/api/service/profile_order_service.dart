import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../models/user_response_model.dart';
import '../profile_order_service_api.dart';

@lazySingleton
class ProfileServiceApiImpl implements ProfileServiceApi {
  final Dio dio;

  ProfileServiceApiImpl(this.dio);

  @override
  Future<UserResponseModel> getUser({
    required int userId,
    required String token,
  }) async {
    final response = await dio.get<Map<String, dynamic>>(
      '/users/get_user',
      queryParameters: {
        "id_user": userId,
        "token": token,
      },
    );

    if (response.statusCode == 200 && response.data != null) {
      return UserResponseModel.fromJson(response.data!);
    } else {
      throw Exception('Ошибка получения пользователя');
    }
  }
}
