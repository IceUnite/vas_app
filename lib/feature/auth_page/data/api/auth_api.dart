import 'package:vas_app/feature/auth_page/data/models/token_model.dart';

abstract class AuthApi {
  Future<TokenModel> loginCommand({
    required String userName,
    required String password,
  });
}