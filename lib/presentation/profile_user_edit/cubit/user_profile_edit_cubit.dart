import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stepper/data/model2/models2.dart';
import 'package:stepper/domain/repositories2/repositories2.dart';
import 'package:stepper/enums/enums.dart';
import 'package:stepper/presentation/profile_user_edit/cubit/user_profile_edit_state.dart';

class UserProfileEditCubit extends Cubit<UserProfileEditState> {
  final ProfessionRepository professionRepository;
  final BandRepository bandRepository;
  final UserRepository userRepository;

  UserProfileEditCubit(
      {required this.professionRepository,
      required this.bandRepository,
      required this.userRepository})
      : super(UserProfileEditState()) {
    _init();
  }

  _init() async {
    emit(state.copyWith(fetchingStatus: StateStatus.loading));
    final user = await _getUser();

    final professions = await _getProfessions();

    final bands =
        await _getBands(professionType: user.currentBand.professionType);

    emit(state.copyWith(
        professions: professions,
        bands: bands,
        user: user,
        selectedProfession: user.currentProfession,
        selectedBand: user.currentBand,
        fetchingStatus: StateStatus.success));
  }

  Future<List<Profession>> _getProfessions() async {
    final professions = await professionRepository.getAllProfessions();
    return professions;
  }

  Future<List<Band>> _getBands({required ProfessionType professionType}) async {
    final bands = await bandRepository.getBandsByProfessionType(
        professionType: professionType);
    return bands;
  }

  Future<User> _getUser() async {
    final user = await userRepository.getUser();

    return user;
  }
  }
