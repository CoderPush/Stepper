import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stepper/data/model/models.dart';
import 'package:stepper/domain/repositories/band_repository.dart';
import 'package:stepper/domain/repositories/profession_repository.dart';

part 'profile_user_edit_state.dart';

class ProfileUserEditCubit extends Cubit<ProfileUserEditState> {
  final ProfessionRepository professionRepository;
  final BandRepository bandRepository;

  ProfileUserEditCubit({
    required this.professionRepository,
    required this.bandRepository,
  }) : super(ProfileUserEditInitial()) {
    getProfessionsAndBands();
  }

  // Cubit Methods
  Future<void> getProfessionsAndBands() async {
    emit(ProfileUserEditInProgress());

    try {
      final professionList =
          (await professionRepository.getProfessions()).professions;

      // get current selected profession
      var selectedProfession =
          await professionRepository.getSelectedProfession();

      final bandList = await bandRepository.getBandsWithProfession(
          professionList.firstWhere(
              (profession) => profession.professionName == selectedProfession));

      // get current selected band
      var selectedBand = await bandRepository.getSelectedBand();
      selectedBand ??= bandList[0];

      emit(ProfileUserEditInSuccess(
        professionList: professionList,
        bandList: bandList,
        selectedProfession: selectedProfession,
        selectedBand: selectedBand,
      ));
    } catch (error) {
      emit(ProfileUserEditInFailed(error: error.toString()));
    }
  }

  Future<void> onProfessionChanged(String professonName) async {
    final currentState = state as ProfileUserEditInSuccess;
    final selectedProfession = currentState.professionList
        .firstWhere((profession) => profession.professionName == professonName);

    // get new band list
    final bandList =
        await bandRepository.getBandsWithProfession(selectedProfession);

    // save professionName to setting database
    await professionRepository.saveSelectedProfession(professonName);

    // save first band as selected band
    final selectedBand = bandList[0];
    await bandRepository.saveSelectedBand(selectedBand);

    emit(currentState.copyWith(
      bandList: bandList,
      selectedProfession: selectedProfession.professionName,
      selectedBand: selectedBand,
    ));
  }

  Future<void> onBandChanged(String bandName) async {
    final currentState = state as ProfileUserEditInSuccess;
    final selectedBand =
        currentState.bandList.firstWhere((band) => band.bandName == bandName);

    // save bandName to setting database
    await bandRepository.saveSelectedBand(selectedBand);

    emit(currentState.copyWith(selectedBand: selectedBand));
  }
}
