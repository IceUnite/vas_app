part of 'order_bloc.dart';



@immutable
sealed class OrderEvent {}


class  GetOrdersEvent extends OrderEvent {
  final int? userId;
  final String? token;
  GetOrdersEvent({required this.userId, required this.token});

}

