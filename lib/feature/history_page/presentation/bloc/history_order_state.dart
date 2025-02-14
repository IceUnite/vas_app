part of 'history_order_bloc.dart';

@immutable
class HistoryOrderState extends Equatable {
  const HistoryOrderState({
    this.errorMessage,
    this.isLoading = false,
    this.historyOrderData,
  });

  final String? errorMessage;
  final bool isLoading;
  final List<HistoryDocumentEntity?>? historyOrderData;

  @override
  List<Object?> get props => [ errorMessage, isLoading,historyOrderData];

  HistoryOrderState copyWith({
    String? errorMessage,
    bool? isLoading,
  }) {
    return HistoryOrderState(
      errorMessage: errorMessage ?? this.errorMessage,
      isLoading: isLoading ?? this.isLoading,
      historyOrderData: historyOrderData ?? this.historyOrderData,
    );
  }
}

final class HistoryOrderInitial extends HistoryOrderState {
  const HistoryOrderInitial() : super();
}

final class HistoryOrderLoading extends HistoryOrderState {
  const HistoryOrderLoading() : super(isLoading: true);
}

final class HistoryOrderSuccess extends HistoryOrderState {
  const HistoryOrderSuccess({required List<HistoryDocumentEntity?>? historyOrderData})
      : super(historyOrderData: historyOrderData);
}

final class HistoryOrderFailure extends HistoryOrderState {
  const HistoryOrderFailure({required String errorMessage})
      : super(errorMessage: errorMessage);
}
