import 'package:equatable/equatable.dart';
import 'package:stepper/data/model/band/band_item_model.dart';
import 'package:stepper/data/model/profession/profession_item_model.dart';

class ProfileUserEditState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ProfileUserEditInitial extends ProfileUserEditState {}

class ProfileUserEditInProgress extends ProfileUserEditState {}

class ProfileUserEditInSuccess extends ProfileUserEditState {
  final List<ProfessionItemModel> professions;
  final List<BandItemModel> bands;

  ProfileUserEditInSuccess({required this.professions, required this.bands});
}

class ProfileUserEditInFailed extends ProfileUserEditState {
  final String error;

  ProfileUserEditInFailed({required this.error});
}
