part of 'order_bloc.dart';

@immutable
class OrderState extends Equatable {
  const OrderState({
    this.documents = const [],
    this.errorMessage,
    this.isLoading = false,
  });

  final List<DocumentEntity> documents;
  final String? errorMessage;
  final bool isLoading;

  @override
  List<Object?> get props => [documents, errorMessage, isLoading];

  OrderState copyWith({
    List<DocumentEntity>? documents,
    String? errorMessage,
    bool? isLoading,
  }) {
    return OrderState(
      documents: documents ?? this.documents,
      errorMessage: errorMessage ?? this.errorMessage,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

final class OrderInitial extends OrderState {
  const OrderInitial() : super();
}

final class OrderLoading extends OrderState {
  const OrderLoading() : super(isLoading: true);
}

final class OrderSuccess extends OrderState {
  const OrderSuccess({required List<DocumentEntity> documents})
      : super(documents: documents);
}

final class OrderFailure extends OrderState {
  const OrderFailure({required String errorMessage})
      : super(errorMessage: errorMessage);
}
