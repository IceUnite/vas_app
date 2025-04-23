part of 'profile_bloc.dart';

@immutable
sealed class ProfileEvent {}


class GetUserInfoEvent extends ProfileEvent {
  GetUserInfoEvent({required this.userId, required this.userToken});

  final int? userId;
  final String? userToken;
}

class ClearUserInfoEvent extends ProfileEvent {
  ClearUserInfoEvent();
}
