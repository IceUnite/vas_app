import 'package:flutter/widgets.dart';
import 'package:json_annotation/json_annotation.dart';

part 'document_model.g.dart';

@immutable
@JsonSerializable()
class DocumentModel {
  final int id;
  final String name;
  final String description;
  @JsonKey(name: 'min_time') // Указываем соответствие ключа в JSON
  final String minTime;

  const DocumentModel({
    required this.id,
    required this.name,
    required this.description,
    required this.minTime,
  });

  factory DocumentModel.fromJson(Map<String, dynamic> json) =>
      _$DocumentModelFromJson(json);

  Map<String, dynamic> toJson() => _$DocumentModelToJson(this);
}
