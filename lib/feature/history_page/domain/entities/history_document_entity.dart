import 'package:equatable/equatable.dart';
import 'package:vas_app/feature/history_page/data/models/document_model.dart';

class HistoryDocumentListEntity extends Equatable {
  final int? code;
  final List<HistoryDocumentEntity?>? data;

  const HistoryDocumentListEntity({
    this.code,
    this.data,
  });

  @override
  List<Object?> get props => [code, data];
}

class HistoryDocumentEntity extends Equatable {
  final int? id;
  final int? idUser;
  final int? idDoc;
  final String? status;
  final String? description;
  final String? date;
  final String? createdAt;
  final String? updatedAt;
  final DocumentEntity? document;

  const HistoryDocumentEntity({
    this.id,
    this.idUser,
    this.idDoc,
    this.status,
    this.description,
    this.date,
    this.createdAt,
    this.updatedAt,
    this.document,
  });

  HistoryDocumentEntity copyWith({
    int? id,
    int? idUser,
    int? idDoc,
    String? status,
    String? description,
    String? date,
    String? createdAt,
    String? updatedAt,
    DocumentEntity? document,
  }) {
    return HistoryDocumentEntity(
      id: id ?? this.id,
      idDoc: idDoc ?? this.idDoc,
      idUser: idUser ?? this.idUser,
      status: status ?? this.status,
      description: description ?? this.description,
      date: date ?? this.date,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      document: document ?? this.document,
    );
  }

  @override
  List<Object?> get props => [
    id,
    idUser,
    idDoc,
    status,
    description,
    date,
    createdAt,
    updatedAt,
    document,
  ];
}

class DocumentListEntity extends Equatable {
  final int? code;
  final List<DocumentEntity?>? data;

  const DocumentListEntity({
    this.code,
    this.data,
  });

  @override
  List<Object?> get props => [code, data];
}

class DocumentEntity {
  final int? id;
  final String? name;
  final String? description;
  final String? minTime;

  const DocumentEntity({
    this.id,
    this.name,
    this.description,
    this.minTime,
  });

  factory DocumentEntity.fromDocumentModel(DocumentModel? documentModel) {
      return DocumentEntity(
        id: documentModel?.id,
        name: documentModel?.name,
        description: documentModel?.description,
        minTime: documentModel?.minTime,
      );
    }
  }

