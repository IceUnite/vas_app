part of 'auth_bloc.dart';

@immutable
class AuthState extends Equatable {
  const AuthState({
    required this.login,
    required this.password,
    required this.token,
    required this.errorMessage,
    required this.userId,
    this.isFirstVisit,
  });

  final String? login;
  final String? password;
  final String? token;
  final String? errorMessage;
  final int? userId;
  final bool? isFirstVisit;

  @override
  List<Object?> get props => [login, password, token, errorMessage, userId, isFirstVisit];

  AuthState copyWith({
    String? login,
    String? password,
    String? token,
    String? errorMessage,
    int? userId,
    bool? isFirstVisit,
  }) {
    return AuthState(
      login: login ?? this.login,
      password: password ?? this.password,
      token: token ?? this.token,
      errorMessage: errorMessage ?? this.errorMessage,
      userId: userId ?? this.userId,
      isFirstVisit: isFirstVisit ?? this.isFirstVisit,
    );
  }
}

final class AuthInitial extends AuthState {
  const AuthInitial()
      : super(
    login: '',
    password: '',
    token: '',
    errorMessage: '',
    userId: 0,
    isFirstVisit: true,
  );
}

final class AuthLoading extends AuthState {
  const AuthLoading()
      : super(
    login: '',
    password: '',
    token: '',
    errorMessage: '',
    userId: 0,
    isFirstVisit: null,
  );
}

final class AuthSuccess extends AuthState {
  const AuthSuccess({
    required String token,
    required int userId,
    bool? isFirstVisit,
  }) : super(
    token: token,
    errorMessage: '',
    login: '',
    password: '',
    userId: userId,
    isFirstVisit: isFirstVisit,
  );
}

final class AuthFailure extends AuthState {
  const AuthFailure({required String errorMessage, required int? userId, bool? isFirstVisit})
      : super(
    errorMessage: errorMessage,
    login: '',
    password: '',
    token: '',
    userId: userId,
    isFirstVisit: isFirstVisit,
  );
}

final class AuthUnauthorized extends AuthState {
  const AuthUnauthorized()
      : super(
    login: '',
    password: '',
    token: '',
    errorMessage: '',
    userId: null,
    isFirstVisit: null,
  );
}
