import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:stepper/domain/repositories/repositories.dart';

part 'profile_user_state.dart';

class ProfileUserCubit extends Cubit<ProfileUserState> {
  final ProfessionRepository professionRepository;
  final BandRepository bandRepository;

  ProfileUserCubit({
    required this.professionRepository,
    required this.bandRepository,
  }) : super(ProfileUserInitialState()) {
    getCurrentUserInfo();
  }

  Future<void> getCurrentUserInfo() async {
    emit(ProfileUserLoadingState());
    try {
      final currentProfession =
          await professionRepository.getSelectedProfession();
      final currentBand = await bandRepository.getSelectedBand();

      emit(ProfileUserLoadedState(
          currentProfession: currentProfession,
          currentBand: currentBand.bandName));
    } catch (error) {
      emit(ProfileUserErrorState());
    }
  }
}
