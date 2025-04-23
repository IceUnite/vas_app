import 'package:injectable/injectable.dart';
import 'package:vas_app/feature/profile_page/data/api/profile_order_service_api.dart';
import 'package:vas_app/feature/profile_page/data/models/user_model.dart';



@LazySingleton()
class ProfileRepositoryImpl {
  final ProfileServiceApi profileOrderServiceApi;

  ProfileRepositoryImpl({required this.profileOrderServiceApi});


  Future<UserModel?> getUserInfo({
    required int? userId,
    required String? token,
  }) async {
    final userResponse = await profileOrderServiceApi.getUser(
      userId: userId ?? 0,
      token: token ?? '',
    );
    return userResponse.data;
  }
}
