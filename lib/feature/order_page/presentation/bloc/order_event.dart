part of 'order_bloc.dart';

@immutable
sealed class OrderEvent {}

class GetOrdersEvent extends OrderEvent {
  final int? userId;
  final String? token;
  GetOrdersEvent({required this.userId, required this.token});
}

class RegisterApplicationEvent extends OrderEvent {
  final int userId;
  final String token;
  final int docId;
  final String userMessage;
  final String date;

  RegisterApplicationEvent({
    required this.userId,
    required this.token,
    required this.docId,
    required this.userMessage,
    this.date = "48",  // Значение по умолчанию для date
  });
}
