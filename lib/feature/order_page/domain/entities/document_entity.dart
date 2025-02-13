import 'package:equatable/equatable.dart';

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

class DocumentEntity extends Equatable {
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

  DocumentEntity copyWith({
    int? id,
    String? name,
    String? description,
    String? minTime,
  }) {
    return DocumentEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      minTime: minTime ?? this.minTime,
    );
  }

  @override
  List<Object?> get props => [id, name, description, minTime];
}
