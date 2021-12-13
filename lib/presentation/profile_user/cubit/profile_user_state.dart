part of 'profile_user_cubit.dart';

abstract class ProfileUserState extends Equatable {
  const ProfileUserState();

  @override
  List<Object> get props => [];
}

class ProfileUserInitialState extends ProfileUserState {}

class ProfileUserLoadingState extends ProfileUserState {}

class ProfileUserLoadedState extends ProfileUserState {
  final String currentProfession;
  final String currentBand;

  const ProfileUserLoadedState({
    required this.currentProfession,
    required this.currentBand,
  });

  @override
  List<Object> get props => [currentProfession, currentBand];
}

class ProfileUserErrorState extends ProfileUserState {}
