import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'package:injectable/injectable.dart';
import 'package:vas_app/core/utils/shared_preference.dart';
import 'package:vas_app/feature/history_page/domain/entities/history_document_entity.dart';
import 'package:vas_app/feature/history_page/domain/usecases/history_order_usecase.dart';
import 'package:vas_app/main.dart';

part 'history_order_event.dart';

part 'history_order_state.dart';

@lazySingleton
@injectable
class HistoryOrderBloc extends Bloc<HistoryOrderEvent, HistoryOrderState> {
  final HistoryOrdersUseCase historyOrdersUseCase;

  HistoryOrderBloc({required this.historyOrdersUseCase}) : super(const HistoryOrderInitial()) {
    on<GetHistoryOrdersEvent>(_onGetHistoryOrders);
  }

  SharedPrefsRawProvider sharedPrefsRawProvider = SharedPrefsRawProvider(prefs);

  Future<void> _onGetHistoryOrders(GetHistoryOrdersEvent event, Emitter<HistoryOrderState> emit) async {
    emit(const HistoryOrderLoading());

    try {
      final data = await historyOrdersUseCase.getApplications(
        userId: event.userId ?? 0,
        token: event.token ?? '',
      );

      final items = data ?? [];

      final activeStatuses = ['ready', 'in work'];
      final archiveStatuses = ['cancelled', 'error', 'completed'];

      // Первый массив: только ready и in work
      final activeOrders = items.where((e) => activeStatuses.contains(e.status)).toList()
        ..sort((a, b) {
          // Сначала по статусу: ready (0), in work (1)
          final priority = {'ready': 0, 'in work': 1};
          final aPriority = priority[a.status] ?? 2;
          final bPriority = priority[b.status] ?? 2;

          if (aPriority != bPriority) {
            return aPriority.compareTo(bPriority);
          }

          // Потом по дате (сначала новые)
          final aDate = DateTime.tryParse(a.createdAt ?? '') ?? DateTime(2025);
          final bDate = DateTime.tryParse(b.createdAt ?? '') ?? DateTime(2025);
          return bDate.compareTo(aDate);
        });

      // Второй массив: cancelled, error, completed
      final archivedOrders = items.where((e) => archiveStatuses.contains(e.status)).toList()
        ..sort((a, b) {
          final aDate = DateTime.tryParse(a.createdAt ?? '') ?? DateTime(2025);
          final bDate = DateTime.tryParse(b.createdAt ?? '') ?? DateTime(2025);
          return bDate.compareTo(aDate); // по убыванию
        });

      final inWorkOrders = activeOrders.where((order) => order.status == 'in work').toList();
      final readyOrders = activeOrders.where((order) => order.status == 'ready').toList();

      emit(HistoryOrderSuccess(
        activeOrders: activeOrders,
        archivedOrders: archivedOrders,
        historyOrderData: data,
        readyOrders: readyOrders.length,
        waitingOrders: inWorkOrders.length,
      ));
    } catch (e) {
      print('e.toString(): $e');
      emit(HistoryOrderFailure(errorMessage: e.toString()));
    }
  }
}
