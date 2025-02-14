import 'package:flutter/widgets.dart';
import 'package:json_annotation/json_annotation.dart';

part 'history_document_model.g.dart';

@immutable
@JsonSerializable()
class HistoryDocumentModel {
  final String id;
  @JsonKey(name: 'id_user')
  final int idUser;
  final String status;
  final String description;
  final String date;
  @JsonKey(name: 'created_at')
  final String createdAt;
  @JsonKey(name: 'updated_at')
  final String updatedAt;

  const HistoryDocumentModel({
    required this.id,
    required this.idUser,
    required this.status,
    required this.description,
    required this.date,
    required this.createdAt,
    required this.updatedAt,
  });

  factory HistoryDocumentModel.fromJson(Map<String, dynamic> json) {
    return HistoryDocumentModel(
      id: json['id'] as String? ?? '',  // Поставим пустую строку, если значение null
      idUser: json['id_user'] as int? ?? 0,  // Поставим 0, если id_user равен null
      status: json['status'] as String? ?? '',
      description: json['description'] as String? ?? '',
      date: json['date'] as String? ?? '',
      createdAt: json['created_at'] as String? ?? '',
      updatedAt: json['updated_at'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() => _$HistoryDocumentModelToJson(this);
}
