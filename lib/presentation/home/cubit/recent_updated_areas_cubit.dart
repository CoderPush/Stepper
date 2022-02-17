import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stepper/domain/repositories/repositories.dart';
import 'package:stepper/enums/enums.dart';
import 'package:stepper/presentation/home/cubit/recent_updated_areas_state.dart';

class RecentUpdatedAreasCubit extends Cubit<RecentUpdatedAreasState> {
  AreaRepository areaRepository;
  late StreamSubscription _areasSteamSubscription;

  RecentUpdatedAreasCubit({required this.areaRepository})
      : super(const RecentUpdatedAreasState()) {
    getRecentUpdatedAreas();
  }

  Future<void> getRecentUpdatedAreas() async {
    try {
      emit(state.copyWith(status: StateStatus.loading));
      _areasSteamSubscription =
          areaRepository.subscribeUserAreas().listen((areasList) {
        emit(state.copyWith(
            status: StateStatus.success, recentUpdatedAreas: areasList));
      });
    } on Exception {
      emit(state.copyWith(status: StateStatus.failure));
    }
  }

  @override
  Future<void> close() {
    _areasSteamSubscription.cancel();
    return super.close();
  }
}
