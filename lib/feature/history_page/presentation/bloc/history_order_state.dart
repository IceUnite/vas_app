part of 'history_order_bloc.dart';

@immutable
class HistoryOrderState extends Equatable {
  const HistoryOrderState({
    this.errorMessage,
    this.isLoading = false,
    this.historyOrderData,
    this.activeOrders,
    this.archivedOrders,
    this.readyOrders,
    this.waitingOrders,

  });

  final String? errorMessage;
  final bool isLoading;
  final List<HistoryDocumentEntity?>? historyOrderData;
  final List<HistoryDocumentEntity?>? activeOrders;
  final List<HistoryDocumentEntity?>? archivedOrders;
  final int? readyOrders;
  final int? waitingOrders;

  @override
  List<Object?> get props => [
        errorMessage,
        isLoading,
        historyOrderData,
        activeOrders,
        archivedOrders,
    readyOrders,
    waitingOrders,
      ];

  HistoryOrderState copyWith({
    String? errorMessage,
    bool? isLoading,
  }) {
    return HistoryOrderState(
      errorMessage: errorMessage ?? this.errorMessage,
      isLoading: isLoading ?? this.isLoading,
      historyOrderData: historyOrderData ?? historyOrderData,
      activeOrders: activeOrders ?? activeOrders,
      archivedOrders: archivedOrders ?? archivedOrders,
      readyOrders: readyOrders ?? readyOrders,
      waitingOrders: waitingOrders ?? waitingOrders,
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
  const HistoryOrderSuccess({
    required List<HistoryDocumentEntity?> historyOrderData,
    required List<HistoryDocumentEntity?> activeOrders,
    required List<HistoryDocumentEntity?> archivedOrders,
    required int? readyOrders,
    required int? waitingOrders,
  }) : super(
    historyOrderData: historyOrderData,
    activeOrders: activeOrders,
    archivedOrders: archivedOrders,
    readyOrders: readyOrders,
    waitingOrders: waitingOrders,
  );
}

final class HistoryOrderFailure extends HistoryOrderState {
  const HistoryOrderFailure({required String errorMessage}) : super(errorMessage: errorMessage);
}
