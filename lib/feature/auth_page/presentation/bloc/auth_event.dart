part of 'auth_bloc.dart';



@immutable
sealed class AuthEvent {}


class  CheckLoginPasswordEvent extends AuthEvent {
  CheckLoginPasswordEvent({required this.login, required this.password,});

  final String? login;
  final String? password;
}
class  CheckTokenEvent extends AuthEvent {
  CheckTokenEvent({required this.userId, required this.token,});
  final int? userId;
  final String? token;
}
class  ExiteEvent extends AuthEvent {
  ExiteEvent();

}
