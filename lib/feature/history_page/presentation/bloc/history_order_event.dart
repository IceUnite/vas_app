part of 'history_order_bloc.dart';



@immutable
sealed class HistoryOrderEvent {}


class  GetHistoryOrdersEvent extends HistoryOrderEvent {
  final int? userId;
  final String? token;
  GetHistoryOrdersEvent({required this.userId, required this.token});

}

