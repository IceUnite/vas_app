part of 'auth_bloc.dart';



@immutable
sealed class AuthEvent {}


class  CheckLoginPasswordEvent extends AuthEvent {
  CheckLoginPasswordEvent({required this.login, required this.password,});

  final String? login;
  final String? password;
}
