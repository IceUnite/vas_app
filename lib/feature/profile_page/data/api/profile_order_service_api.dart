
import '../models/user_response_model.dart';

abstract class ProfileServiceApi {
  Future<UserResponseModel> getUser({
    required int userId,
    required String token,
  });
}
