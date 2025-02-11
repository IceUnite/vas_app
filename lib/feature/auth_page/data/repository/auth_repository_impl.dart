import 'package:injectable/injectable.dart';
import 'package:vas_app/feature/auth_page/data/api/service/auth_service_api.dart';
import 'package:vas_app/feature/auth_page/domain/entities/refresh_token_entitie.dart';
import 'package:vas_app/feature/auth_page/domain/repository/auth_repository.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl extends AuthRepository {
  AuthRepositoryImpl({required this.authServiceApi});

  final AuthApiDioService authServiceApi;

  @override
  Future<TokenEntity> loginCommand({
    required String userName,
    required String password,
  }) async {
    final tokenModel = await authServiceApi.loginCommand(userName: userName, password: password);
    return TokenEntity(
      code: tokenModel.code,
      id: tokenModel.id,
      token: tokenModel.token,
    );
  }

  @override
  Future<void> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }

  @override
  Future<dynamic> refreshToken({required refreshToken}) {
    // TODO: implement refreshToken
    throw UnimplementedError();
  }
}
