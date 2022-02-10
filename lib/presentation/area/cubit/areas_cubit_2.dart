import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stepper/data/model2/models2.dart';
import 'package:stepper/domain/repositories2/repositories2.dart';
import 'package:stepper/enums/enums.dart';
import 'package:stepper/presentation/area/cubit/areas_state_2.dart';
import 'package:stepper/presentation/utils.dart';

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
    _getUserAreas();
  }

  _init() async {
    emit(state.copyWith(fetchingStatus: StateStatus.loading));
    await _getUserCurrentBand();
    await _getUserAreas();
    emit(state.copyWith(fetchingStatus: StateStatus.success));
  }

  Future _getUserCurrentBand() async {
    final User user = await userRepository.getUser();
    emit(state.copyWith(userCurrentBand: user.currentBand));
  }

  Future _getUserAreas({AreaType? areaType, Band? band}) async {
    emit(state.copyWith(fetchingStatus: StateStatus.loading));

    final selectedAreaType = state.selectedAreaType;
    final bandId = state.userCurrentBand.id;
    // TODO: will move all areas that relates to user, store in areas collection of user
    final areas = await areaRepository.getAreasByAreaTypeAndBandId(
        bandId: bandId, areaType: selectedAreaType);
    final userAreas = await areaRepository.getUserAreasByTypeAndBandId(
        bandId: bandId, areaType: selectedAreaType);

    final result = areas.map((area) {
      try {
        final userArea = getItemByName<Area>(
            list: userAreas, name: area.name, getter: (item) => item.name);
        return Area.fromJson(userArea!.toJson());
      } catch (error) {
        return area;
      }
    }).toList();
    emit(state.copyWith(areas: result, fetchingStatus: StateStatus.success));
  }
}
