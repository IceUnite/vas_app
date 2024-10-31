part of 'profile_bloc.dart';

@immutable
class ProfileState extends Equatable {
  ProfileState({
    this.cellResponse,
  });

  final int? cellResponse;


  List<Object?> get props => <Object?>[
        cellResponse,
      ];

  ProfileState copyWith({
    int? cellResponse,

  }) {
    return ProfileState(
      cellResponse: cellResponse ?? this.cellResponse,
    );
  }
}

final class ProfileInitial extends ProfileState {
  ProfileInitial()
      : super(
          cellResponse: null,
        );
}

