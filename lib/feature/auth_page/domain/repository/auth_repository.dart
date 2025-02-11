
import 'package:vas_app/feature/auth_page/domain/entities/refresh_token_entitie.dart';

abstract class AuthRepository {
  Future<TokenEntity> loginCommand({
    required String userName,
    required String password,
  });

  // Future<JwtTokensDTOEntity?> refreshToken({
  //   required RefreshTokenEntitie refreshToken,
  // });

  Future<void> logout();
}
