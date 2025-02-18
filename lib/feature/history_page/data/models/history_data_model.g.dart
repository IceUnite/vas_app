// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HistoryDataModel _$HistoryDataModelFromJson(Map<String, dynamic> json) =>
    HistoryDataModel(
      id: (json['id'] as num?)?.toInt(),
      idUser: (json['id_user'] as num?)?.toInt(),
      idDoc: (json['id_doc'] as num?)?.toInt(),
      status: json['status'] as String?,
      description: json['description'] as String?,
      date: json['date'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      document: json['document'] == null
          ? null
          : DocumentModel.fromJson(json['document'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$HistoryDataModelToJson(HistoryDataModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'id_user': instance.idUser,
      'id_doc': instance.idDoc,
      'status': instance.status,
      'description': instance.description,
      'date': instance.date,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'document': instance.document,
    };
