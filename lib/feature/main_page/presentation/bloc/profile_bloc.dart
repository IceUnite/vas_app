import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'profile_event.dart';

part 'profile_state.dart';

@lazySingleton
class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileInitial()) {
    on<FinishRentEvent>(_onFinishRentEvent);
  }

  // final ProfileUseCase luggageUseCase;


  Future<void> _onFinishRentEvent(FinishRentEvent event, Emitter<ProfileState> emit) async {

  }
}

