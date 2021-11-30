import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:stepper/domain/repositories/area_repository.dart';
import 'package:stepper/data/repositories/area_repository_impl.dart';
import 'package:stepper/data/model/models.dart';
import 'package:stepper/presentation/utils.dart';

part 'area_state.dart';

class AreaCubit extends Cubit<AreaState> {
  AreaCubit({required this.areaRepository}) : super(const AreaInitial()) {
    getAreas(AreaType.scope);
  }

  final AreaRepository areaRepository;

  Future<void> getAreas(AreaType areaType) async {
    try {
      emit(AreaLoading(areaType: areaType));
      var areaList = await areaRepository.fetchAreasByType(areaType);
      areaList = sortAreasInOrder(areaList);
      emit(AreaLoaded(
        areaList: areaList,
        areaType: areaType,
      ));
    } on NetworkException {
      emit(AreaError(
        errorMessage: 'Network error',
        areaType: areaType,
      ));
    }
  }
}
