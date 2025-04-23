import 'package:flutter/widgets.dart';
import 'package:json_annotation/json_annotation.dart';
import 'user_model.dart';

part 'user_response_model.g.dart';

@immutable
@JsonSerializable()
class UserResponseModel {
  final int? code;
  final UserModel? data;

  const UserResponseModel({
    this.code,
    this.data,
  });

  factory UserResponseModel.fromJson(Map<String, dynamic> json) =>
      _$UserResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserResponseModelToJson(this);
}
