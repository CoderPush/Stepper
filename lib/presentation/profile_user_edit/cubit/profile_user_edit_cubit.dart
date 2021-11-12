import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stepper/data/model/band/band_item_model.dart';
import 'package:stepper/domain/repositories/band_repository.dart';
import 'package:stepper/domain/repositories/profession_repository.dart';
import 'package:stepper/presentation/profile_user_edit/cubit/profile_user_edit_state.dart';

class ProfileUserEditCubit extends Cubit<ProfileUserEditState> {
  final ProfessionRepository professionRepository;
  final BandRepository bandRepository;

  ProfileUserEditCubit({
    required this.professionRepository,
    required this.bandRepository,
  }) : super(ProfileUserEditInitial());

  Future<void> getProfessionsAndBands() async {
    emit(ProfileUserEditInProgress());

    try {
      final professionResponse = await professionRepository.getProfessions();
      final bandResponse = await bandRepository.getBands();

      emit(ProfileUserEditInSuccess(
        profession: professionResponse,
        band: bandResponse,
      ));
    } catch (error) {
      emit(ProfileUserEditInFailed(error: error.toString()));
    }
  }

  Future<void> saveBandModelItem(BandItemModel bandItemModel) async {
    await bandRepository.saveBandItemModel(bandItemModel);
  }
}
