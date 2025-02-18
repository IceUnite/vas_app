import 'package:equatable/equatable.dart';

class RegApplicationResponseEntity extends Equatable {
  final int? code;
  final RegApplicationEntity? data;

  const RegApplicationResponseEntity({
    this.code,
    this.data,
  });

  @override
  List<Object?> get props => [code, data];
}

class RegApplicationEntity extends Equatable {
  final String? message;

  const RegApplicationEntity({this.message});

  RegApplicationEntity copyWith({
    String? message,
  }) {
    return RegApplicationEntity(
      message: message ?? this.message,
    );
  }

  @override
  List<Object?> get props => [message];
}
