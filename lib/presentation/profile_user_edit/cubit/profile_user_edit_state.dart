part of 'profile_user_edit_cubit.dart';

class ProfileUserEditState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ProfileUserEditInitial extends ProfileUserEditState {}

class ProfileUserEditInProgress extends ProfileUserEditState {}

class ProfileUserEditInSuccess extends ProfileUserEditState {
  final ProfessionModel profession;
  final BandModel band;

  ProfileUserEditInSuccess({required this.profession, required this.band});
}

class ProfileUserEditInFailed extends ProfileUserEditState {
  final String error;

  ProfileUserEditInFailed({required this.error});
}
