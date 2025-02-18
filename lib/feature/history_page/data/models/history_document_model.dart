import 'package:json_annotation/json_annotation.dart';
import 'history_data_model.dart';

part 'history_document_model.g.dart';

@JsonSerializable()
class HistoryDocumentModel {
  final int? code;
  final List<HistoryDataModel>? data;

  HistoryDocumentModel({
    this.code,
    this.data,
  });

  factory HistoryDocumentModel.fromJson(Map<String, dynamic> json) => _$HistoryDocumentModelFromJson(json);

  Map<String, dynamic> toJson() => _$HistoryDocumentModelToJson(this);
}
