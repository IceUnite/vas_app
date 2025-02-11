part of 'auth_bloc.dart';

@immutable
class AuthState extends Equatable {
  const AuthState({
    this.login,
    this.password,
    this.token,
    this.errorMessage,
  });

  final String? login;
  final String? password;
  final String? token;
  final String? errorMessage;

  @override
  List<Object?> get props => [login, password, token, errorMessage];

  AuthState copyWith({
    String? login,
    String? password,
    String? token,
    String? errorMessage,
  }) {
    return AuthState(
      login: login ?? this.login,
      password: password ?? this.password,
      token: token ?? this.token,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}

final class AuthInitial extends AuthState {
  const AuthInitial() : super(login: '', password: '');
}

final class AuthLoading extends AuthState {
  const AuthLoading();
}

final class AuthSuccess extends AuthState {
  const AuthSuccess({required String token}) : super(token: token);
}

final class AuthFailure extends AuthState {
  const AuthFailure({required String errorMessage})
      : super(errorMessage: errorMessage);
}
