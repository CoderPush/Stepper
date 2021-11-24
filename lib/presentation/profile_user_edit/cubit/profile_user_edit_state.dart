part of 'profile_user_edit_cubit.dart';

class ProfileUserEditState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ProfileUserEditInitial extends ProfileUserEditState {}

class ProfileUserEditInProgress extends ProfileUserEditState {}

class ProfileUserEditInSuccess extends ProfileUserEditState {
  final List<ProfessionItemModel> professionList;
  final List<BandItemModel> bandList;
  final String selectedProfession;
  final BandItemModel selectedBand;

  ProfileUserEditInSuccess({
    required this.professionList,
    required this.bandList,
    required this.selectedProfession,
    required this.selectedBand,
  });

  ProfileUserEditInSuccess copyWith({
    List<ProfessionItemModel>? professionList,
    List<BandItemModel>? bandList,
    String? selectedProfession,
    BandItemModel? selectedBand,
  }) {
    return ProfileUserEditInSuccess(
      professionList: professionList ?? this.professionList,
      bandList: bandList ?? this.bandList,
      selectedProfession: selectedProfession ?? this.selectedProfession,
      selectedBand: selectedBand ?? this.selectedBand,
    );
  }

  @override
  List<Object?> get props => [
        professionList,
        bandList,
        selectedProfession,
        selectedBand,
      ];
}

class ProfileUserEditInFailed extends ProfileUserEditState {
  final String error;

  ProfileUserEditInFailed({required this.error});
}
