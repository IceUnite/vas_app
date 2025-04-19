
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
class HistoryOrderBloc extends Bloc<HistoryOrderEvent,HistoryOrderState> {
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

      // Функция сортировки
      items.sort((a, b) {
        final priority = {
          'ready': 0,
          'in work': 1,
          'error': 2,
          'cancelled': 3,
          'completed': 4,
        };

        final aPriority = priority[a.status] ?? 5;
        final bPriority = priority[b.status] ?? 5;

        if (aPriority != bPriority) {
          return aPriority.compareTo(bPriority);
        }

        // Если статус одинаковый, и он среди error/cancelled/completed, сортируем по дате
        if (aPriority >= 2) {
          final aDate = DateTime.tryParse(a.createdAt ?? '') ?? DateTime(2025);
          final bDate = DateTime.tryParse(b.createdAt ?? '') ?? DateTime(2025);
          return bDate.compareTo(aDate); // Сортировка по убыванию
        }

        return 0; // Для ready и in work порядок не важен
      });

      emit(HistoryOrderSuccess(historyOrderData: data));
    } catch (e) {
      print('e.toString(): $e');
      emit(HistoryOrderFailure(errorMessage: e.toString()));
    }
  }



}
