import 'package:flutter/widgets.dart';
import 'package:json_annotation/json_annotation.dart';

part 'token_model.g.dart';

@immutable
@JsonSerializable()
class TokenModel {
  final String token;

  const TokenModel({
    required this.token,
  });

  factory TokenModel.fromJson(Map<String, dynamic> json) =>
      _$TokenModelFromJson(json);

  Map<String, dynamic> toJson() => _$TokenModelToJson(this);
}
