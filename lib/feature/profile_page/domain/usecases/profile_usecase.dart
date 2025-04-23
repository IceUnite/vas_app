import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:vas_app/core/errors/error_handler.dart';
import 'package:vas_app/core/errors/exception.dart';
import 'package:vas_app/core/errors/failure.dart';


import '../../data/repository/profile_order_repository_impl.dart';
import '../entities/user_entity.dart';

@lazySingleton
class ProfileUseCase {
  final ProfileRepositoryImpl profileOrdersRepository;

  const ProfileUseCase({required this.profileOrdersRepository});

  Future<UserEntity?> getUserInfo({
    required int? userId,
    required String? token,
  }) async {
    try {
      final user = await profileOrdersRepository.getUserInfo(
        userId: userId,
        token: token,
      );
      return UserEntity.fromUserModel(user);
    } on DioException catch (e) {
      Exception exception = ServerException(e.message.toString());
      Failure failure = ErrorHandler.handleException(exception);
      throw failure;
    }
  }
}
