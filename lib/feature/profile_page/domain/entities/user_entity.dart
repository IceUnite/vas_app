import 'package:equatable/equatable.dart';
import 'package:vas_app/feature/profile_page/data/models/user_model.dart';

class UserEntity extends Equatable {
  final String? name;
  final String? middleName;
  final String? lastName;
  final String? phone;
  final String? rank;
  final String? login;

  const UserEntity({
    this.name,
    this.middleName,
    this.lastName,
    this.phone,
    this.rank,
    this.login,
  });

  factory UserEntity.fromModel(UserModel? model) {
    return UserEntity(
      name: model?.name,
      middleName: model?.middleName,
      lastName: model?.lastName,
      phone: model?.phone,
      rank: model?.rank,
      login: model?.login,
    );
  }
  // Метод преобразования из UserModel в UserEntity
  factory UserEntity.fromUserModel(UserModel? model) {
    if (model == null) return const UserEntity();

    return UserEntity(
      name: model.name,
      middleName: model.middleName,
      lastName: model.lastName,
      phone: model.phone,
      rank: model.rank,
      login: model.login,
    );
  }
  @override
  List<Object?> get props => [name, middleName, lastName, phone, rank, login];
}
