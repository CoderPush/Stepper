import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:stepper/data/repositories/abstract/area_repository.dart';
import 'package:stepper/data/repositories/fake_repos/fake_area_repository_impl.dart';
import 'package:stepper/data/model/models.dart';

part 'area_state.dart';

class AreaCubit extends Cubit<AreaState> {
  AreaCubit({required this.areaRepository}) : super(const AreaInitial());

  final AreaRepository areaRepository;

  Future<void> getAreas(AreaType areaType) async {
    try {
      emit(const AreaLoading());
      final areaList = await areaRepository.fetchAreas(areaType);
      emit(AreaLoaded(areaList: areaList));
    } on NetworkException {
      emit(const AreaError(errorMessage: 'Network error'));
    }
  }
}
