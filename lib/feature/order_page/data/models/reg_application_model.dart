import 'package:json_annotation/json_annotation.dart';

part 'reg_application_model.g.dart';

@JsonSerializable()
class RegApplicationModel {
  final String message;

  RegApplicationModel({required this.message});

  factory RegApplicationModel.fromJson(Map<String, dynamic> json) =>
      _$RegApplicationModelFromJson(json);

  Map<String, dynamic> toJson() => _$RegApplicationModelToJson(this);
}
