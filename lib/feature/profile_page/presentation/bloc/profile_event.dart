part of 'profile_bloc.dart';

@immutable
sealed class ProfileEvent {}


class FinishRentEvent extends ProfileEvent {
  FinishRentEvent({required this.cellId});

  final int cellId;
}
