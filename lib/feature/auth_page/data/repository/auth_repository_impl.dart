
import 'package:injectable/injectable.dart';
import 'package:vas_app/feature/auth_page/data/api/service/auth_service_api.dart';
import 'package:vas_app/feature/auth_page/data/models/token_model.dart';
import 'package:vas_app/feature/auth_page/domain/repository/auth_repository.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl extends AuthRepository {
  AuthRepositoryImpl({required this.authServiceApi});

  final AuthApiDioService authServiceApi;

  @override
  Future<TokenModel> loginCommand({
    required String userName,
    required String password,
  }) async {
    return await authServiceApi.loginCommand(userName: userName, password: password);
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


  // @override
  // Future<JwtTokensDTOEntity?> refreshToken({required RefreshTokenEntitie refreshToken}) {
  //   // TODO: implement refreshToken
  //   throw UnimplementedError();
  // }
}
