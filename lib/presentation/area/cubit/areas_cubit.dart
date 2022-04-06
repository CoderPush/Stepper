import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stepper/data/models/models.dart';
import 'package:stepper/domain/repositories/repositories.dart';
import 'package:stepper/enums/enums.dart';
import 'package:stepper/presentation/area/cubit/areas_state.dart';

class AreasCubit extends Cubit<AreasState> {
  AreaRepository areaRepository;
  UserRepository userRepository;

  AreasCubit({required this.areaRepository, required this.userRepository})
      : super(AreasState()) {
    _init();
  }

  onSelectAreaType({AreaType areaType = AreaType.scope}) async {
    emit(state.copyWith(
        selectedAreaType: areaType, fetchingStatus: StateStatus.loading));

    final areas = await _getUserAreas(
        areaType: areaType, bandId: state.userCurrentBand.id);

    emit(state.copyWith(areas: areas, fetchingStatus: StateStatus.success));
  }

  _init() async {
    emit(state.copyWith(fetchingStatus: StateStatus.loading));
    final currentBand = await _getUserCurrentBand();
    final areas = await _getUserAreas(
        areaType: state.selectedAreaType, bandId: currentBand.id);

    emit(state.copyWith(
        areas: areas,
        userCurrentBand: currentBand,
        fetchingStatus: StateStatus.success));
  }

  Future<Band> _getUserCurrentBand() async {
    final user = await userRepository.getUser();
    return user!.currentBand;
  }

  Future<List<Area>> _getUserAreas(
      {required AreaType areaType, required String bandId}) async {
    final userAreas = await areaRepository.getUserAreasByAreaTypeAndBandId(
        bandId: bandId, areaType: areaType);

    return userAreas;
  }
}
