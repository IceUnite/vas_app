import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:vas_app/core/repositories/auth_data_repository_impl.dart';
import 'package:vas_app/core/utils/shared_preference.dart';
import 'package:vas_app/feature/auth_page/domain/usecases/auth_usecase.dart';
import 'package:vas_app/feature/auth_page/presentation/bloc/auth_bloc.dart';
import 'package:vas_app/feature/order_page/domain/entities/document_entity.dart';
import 'package:vas_app/feature/order_page/domain/entities/reg_application_entity.dart';
import 'package:vas_app/feature/order_page/domain/usecases/order_usecase.dart';
import 'package:vas_app/main.dart';

part 'order_event.dart';
part 'order_state.dart';

@lazySingleton
@injectable
class OrderBloc extends Bloc<OrderEvent, OrderState> {
  final OrdersUseCase orderUseCase;

  OrderBloc({required this.orderUseCase}) : super(const OrderInitial()) {
    on<GetOrdersEvent>(_onGetOrders);
    on<RegisterApplicationEvent>(_onRegisterApplication);
  }

  SharedPrefsRawProvider sharedPrefsRawProvider = SharedPrefsRawProvider(prefs);

  /// Обработка события получения заказов
  Future<void> _onGetOrders(GetOrdersEvent event, Emitter<OrderState> emit) async {
    emit(const OrderLoading());
    try {
      final data = await orderUseCase.getDocuments(userId: event.userId ?? 0, token: event.token ?? '');
      emit(OrderSuccess(documents: data));
    } catch (e) {
      emit(OrderFailure(errorMessage: e.toString()));
    }
  }

  /// Обработка события регистрации заявки
  Future<void> _onRegisterApplication(
      RegisterApplicationEvent event, Emitter<OrderState> emit) async {

    try {
      final response = await orderUseCase.registerApplication(
        userId: event.userId ?? 0,
        token: event.token ?? '',
        docId: event.docId ?? 0,
      );

      emit(state.copyWith(
        regApplicationEntity: response, // Обновляем только regApplicationEntity
        isLoading: false,  // Убираем флаг загрузки
      ));
    } catch (e) {
      emit(state.copyWith(
        regApplicationEntity: null, // При ошибке делаем regApplicationEntity null
        errorMessage: e.toString(), // Убираем флаг загрузки
      ));
    }
  }


}
