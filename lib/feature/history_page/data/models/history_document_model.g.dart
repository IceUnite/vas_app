// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_document_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HistoryDocumentModel _$HistoryDocumentModelFromJson(
        Map<String, dynamic> json) =>
    HistoryDocumentModel(
      id: json['id'] as String,
      idUser: (json['id_user'] as num).toInt(),
      status: json['status'] as String,
      description: json['description'] as String,
      date: json['date'] as String,
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
    );

Map<String, dynamic> _$HistoryDocumentModelToJson(
        HistoryDocumentModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'id_user': instance.idUser,
      'status': instance.status,
      'description': instance.description,
      'date': instance.date,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
