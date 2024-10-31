import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:vas_app/feature/app/routing/route_path.dart';

part 'auth_event.dart';

part 'auth_state.dart';

@lazySingleton
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<CheckLoginPasswordEvent>(_onLogin);
  }

  // final ProfileUseCase luggageUseCase;

  Future<void> _onLogin(CheckLoginPasswordEvent event, Emitter<AuthState> emit) async {
    if (event.login != state.trueLogin || event.password != state.truePassword) {
      emit(state.copyWith(isCorrect: false));
    } else {
      emit(state.copyWith(isCorrect: true));
    }
  }
}
