import 'package:flutter/widgets.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@immutable
@JsonSerializable()
class UserModel {
  final String? name;

  @JsonKey(name: 'middle_name')
  final String? middleName;

  @JsonKey(name: 'last_name')
  final String? lastName;

  final String? phone;
  final String? rank;
  final String? login;

  const UserModel({
    this.name,
    this.middleName,
    this.lastName,
    this.phone,
    this.rank,
    this.login,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
