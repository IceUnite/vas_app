

import 'package:vas_app/feature/auth_page/data/models/token_model.dart';

abstract class AuthRepository {
  Future<TokenModel> loginCommand({
    required String userName,
    required String password,
  });

  // Future<JwtTokensDTOEntity?> refreshToken({
  //   required RefreshTokenEntitie refreshToken,
  // });

  Future<void> logout();
}
