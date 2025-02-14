import 'package:equatable/equatable.dart';

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
  final String? status;
  final String? description;
  final String? date;
  final String? createdAt;
  final String? updatedAt;

  const HistoryDocumentEntity({
    this.id,
    this.idUser,
    this.status,
    this.description,
    this.date,
    this.createdAt,
    this.updatedAt,
  });

  HistoryDocumentEntity copyWith({
    int? id,
    int? idUser,
    String? status,
    String? description,
    String? date,
    String? createdAt,
    String? updatedAt,
  }) {
    return HistoryDocumentEntity(
      id: id ?? this.id,
      idUser: idUser ?? this.idUser,
      status: status ?? this.status,
      description: description ?? this.description,
      date: date ?? this.date,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  List<Object?> get props => [
    id,
    idUser,
    status,
    description,
    date,
    createdAt,
    updatedAt,
  ];
}
