import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../domain/entities/user_entity.dart';
import '../../domain/usecases/profile_usecase.dart';

part 'profile_event.dart';

part 'profile_state.dart';

@lazySingleton
class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final ProfileUseCase profileUseCase;

  ProfileBloc({required this.profileUseCase}) : super(ProfileInitial()) {
    on<GetUserInfoEvent>(_onGetUserInfoEvent);
    on<ClearUserInfoEvent>(_onClearUserInfoEvent);
  }

  // final ProfileUseCase luggageUseCase;

  Future<void> _onGetUserInfoEvent(GetUserInfoEvent event, Emitter<ProfileState> emit) async {
    try {
      final data = await profileUseCase.getUserInfo(
        userId: event.userId ?? 0,
        token: event.userToken ?? '',
      );

      emit(ProfileState(userInfo: data));
    } catch (e) {
      rethrow;
    }
  } Future<void> _onClearUserInfoEvent(ClearUserInfoEvent event, Emitter<ProfileState> emit) async {
    try {
      emit(ProfileState(userInfo: null));
    } catch (e) {
      rethrow;
    }
  }
}
