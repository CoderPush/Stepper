import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:stepper/data/model/models.dart';
import 'package:stepper/data/repositories/repositories.dart';
import 'package:stepper/domain/repositories/repositories.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final AreaRepository areaRepository;
  final GoalRepository goalRepository;

  HomeCubit({
    required this.areaRepository,
    required this.goalRepository,
  }) : super(HomeInitialState()) {
    loadHomeScreen();
  }

  Future<void> loadHomeScreen() async {
    try {
      emit(HomeLoadingState());
      final recentlyUpdatedAreas =
          await areaRepository.fetchRecentlyUpdatedAreas();
      final priorityGoalList = await goalRepository.getPriorityGoals();
      emit(HomeLoadedState(
        recentlyUpdatedAreas: recentlyUpdatedAreas,
        priorityGoalList: priorityGoalList,
      ));
    } on NetworkException {
      emit(const HomeErrorState(errorMessage: 'Network error'));
    }
  }
}
