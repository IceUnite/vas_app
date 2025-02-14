import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'package:injectable/injectable.dart';
import 'package:vas_app/core/utils/shared_preference.dart';
import 'package:vas_app/feature/history_page/domain/entities/history_document_entity.dart';
import 'package:vas_app/feature/history_page/domain/usecases/history_order_usecase.dart';
import 'package:vas_app/feature/order_page/domain/entities/document_entity.dart';
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

      emit(HistoryOrderSuccess(historyOrderData: data));

    } catch (e) {
      emit(HistoryOrderFailure(errorMessage: e.toString()));
    }
  }


}
