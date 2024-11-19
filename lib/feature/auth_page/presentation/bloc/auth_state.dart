part of 'auth_bloc.dart';

@immutable
class AuthState extends Equatable {
  const AuthState({
    this.cellResponse,
    this.isCorrect,
    this.login,
    this.password,
    this.trueLogin,
    this.truePassword,
  });

  final int? cellResponse;
  final bool? isCorrect;
  final String? login;
  final String? password;
  final String? trueLogin;
  final String? truePassword;

  @override
  List<Object?> get props => <Object?>[
        cellResponse,
        login,
        password,
        trueLogin,
        truePassword,
        isCorrect,
      ];

  AuthState copyWith({
    int? cellResponse,
    bool? isCorrect,
    String? login,
    String? password,
    String? trueLogin,
    String? truePassword,
  }) {
    return AuthState(
      cellResponse: cellResponse ?? this.cellResponse,
      isCorrect: isCorrect ?? this.isCorrect,
      login: login ?? this.login,
      password: password ?? this.password,
      trueLogin: trueLogin ?? this.trueLogin,
      truePassword: truePassword ?? this.truePassword,
    );
  }
}

final class AuthInitial extends AuthState {
  const AuthInitial()
      : super(
          isCorrect: true,
          cellResponse: null,
          trueLogin: '1111',
          truePassword: '1111',
          login: '',
          password: '',
        );
}
