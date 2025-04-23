import 'package:equatable/equatable.dart';
import 'package:vas_app/feature/profile_page/data/models/user_response_model.dart';
import 'user_entity.dart';

class UserResponseEntity extends Equatable {
  final int? code;
  final UserEntity? data;

  const UserResponseEntity({
    this.code,
    this.data,
  });

  factory UserResponseEntity.fromModel(UserResponseModel model) {
    return UserResponseEntity(
      code: model.code,
      data: UserEntity.fromModel(model.data),
    );
  }

  @override
  List<Object?> get props => [code, data];
}
