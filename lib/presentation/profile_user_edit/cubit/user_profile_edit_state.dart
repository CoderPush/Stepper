import 'package:equatable/equatable.dart';
import 'package:stepper/data/model2/models2.dart';
import 'package:stepper/enums/enums.dart';

class UserProfileEditState extends Equatable {
  final List<Profession> professions;
  final List<Band> bands;
  final Profession selectedProfession;
  final Band selectedBand;
  final User? user;
  final StateStatus fetchingStatus;
  final StateStatus updatingUserProfileStatus;

  UserProfileEditState(
      {this.professions = const [],
      this.bands = const [],
      selectedProfession,
      selectedBand,
      this.user,
      this.fetchingStatus = StateStatus.initial,
      this.updatingUserProfileStatus = StateStatus.initial})
      : selectedProfession = selectedProfession ?? Profession.empty,
        selectedBand = selectedBand ?? Band.empty;

  UserProfileEditState copyWith(
          {List<Profession>? professions,
          List<Band>? bands,
          Profession? selectedProfession,
          Band? selectedBand,
          User? user,
          StateStatus? fetchingStatus,
          StateStatus? updatingUserProfileStatus}) =>
      UserProfileEditState(
          professions: professions ?? this.professions,
          bands: bands ?? this.bands,
          selectedProfession: selectedProfession ?? this.selectedProfession,
          selectedBand: selectedBand ?? this.selectedBand,
          user: user ?? this.user,
          fetchingStatus: fetchingStatus ?? this.fetchingStatus,
          updatingUserProfileStatus:
              updatingUserProfileStatus ?? this.updatingUserProfileStatus);

  @override
  List<Object?> get props => [
        professions,
        bands,
        selectedProfession,
        selectedBand,
        user,
        fetchingStatus,
        updatingUserProfileStatus
      ];
}
