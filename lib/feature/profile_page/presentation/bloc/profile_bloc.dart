import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

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

