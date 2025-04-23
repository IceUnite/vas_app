part of 'profile_bloc.dart';

@immutable
class ProfileState extends Equatable {
  ProfileState({
    this.userInfo,
  });

  final UserEntity? userInfo;


  List<Object?> get props => <Object?>[
    userInfo,
      ];

  ProfileState copyWith({
    UserEntity? userInfo,

  }) {
    return ProfileState(
      userInfo: userInfo ?? this.userInfo,
    );
  }
}

final class ProfileInitial extends ProfileState {
  ProfileInitial()
      : super(
    userInfo: null,
        );
}

