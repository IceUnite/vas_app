import 'package:flutter/widgets.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:vas_app/feature/history_page/data/models/document_model.dart';

part 'history_data_model.g.dart';

@immutable
@JsonSerializable()
class HistoryDataModel {
  final int id;
  @JsonKey(name: 'id_user')
  final int idUser;
  @JsonKey(name: 'id_doc')
  final int idDoc;
  final String status;
  final String description;
  final String date;
  @JsonKey(name: 'created_at')
  final String createdAt;
  @JsonKey(name: 'updated_at')
  final String updatedAt;
  final DocumentModel document;

  const HistoryDataModel({
    required this.id,
    required this.idUser,
    required this.idDoc,
    required this.status,
    required this.description,
    required this.date,
    required this.createdAt,
    required this.updatedAt,
    required this.document,
  });

  factory HistoryDataModel.fromJson(Map<String, dynamic> json) => _$HistoryDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$HistoryDataModelToJson(this);
}
