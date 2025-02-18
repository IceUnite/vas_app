// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_document_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HistoryDocumentModel _$HistoryDocumentModelFromJson(
        Map<String, dynamic> json) =>
    HistoryDocumentModel(
      code: (json['code'] as num?)?.toInt(),
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => HistoryDataModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$HistoryDocumentModelToJson(
        HistoryDocumentModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'data': instance.data,
    };
