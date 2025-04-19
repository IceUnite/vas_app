


import '../entities/user_entity.dart';

abstract class ProfileRepository {
  Future<UserEntity?> getUserInfo({
    required int? userId,
    required String? token,
  });
}
