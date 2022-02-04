import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stepper/domain/repositories/repositories.dart';
import 'package:stepper/enums/enums.dart';
import 'package:stepper/presentation/home/cubit/recent_updated_areas_state.dart';

class RecentUpdatedAreasCubit extends Cubit<RecentUpdatedAreasState> {
  AreaRepository areaRepository;

  RecentUpdatedAreasCubit({required this.areaRepository})
      : super(const RecentUpdatedAreasState()) {
    getRecentUpdatedAreas();
  }

  Future<void> getRecentUpdatedAreas() async {
    try {
      emit(state.copyWith(status: StateStatus.loading));
      final areas = await areaRepository.fetchRecentlyUpdatedAreas();
      emit(state.copyWith(
          status: StateStatus.success, recentUpdatedAreas: areas));
    } on Exception {
      emit(state.copyWith(status: StateStatus.failure));
    }
  }
}
