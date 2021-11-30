import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:stepper/data/model/models.dart';
import 'package:stepper/domain/repositories/goal_repository.dart';
import 'package:stepper/data/repositories/repositories.dart';

part 'goal_state.dart';

class GoalCubit extends Cubit<GoalState> {
  final Goal goal;
  final GoalRepository goalRepository;
  GoalCubit({
    required this.goalRepository,
    required this.goal,
  }) : super(GoalInitialState(
          goalId: goal.goalId,
          goalDescription: goal.goalDescription,
          isAchieved: goal.achieved,
          isPrioritized: goal.isPrioritized,
          updatedTime: goal.createdTime,
        ));

  Future<void> achieveGoal() async {
    try {
      final currentTime = DateTime.now();
      await goalRepository.achieveGoal(
          goalId: state.goalId,
          isAchieved: !state.isAchieved,
          updatedTime: currentTime);
      emit(GoalEditState(
        goalId: state.goalId,
        isAchieved: !state.isAchieved,
        goalDescription: state.goalDescription,
        isPrioritized: state.isPrioritized,
        updatedTime: currentTime,
      ));
    } on NetworkException {
      emit(GoalErrorState(
        goalId: state.goalId,
        errorMessage: 'Network Error',
        isAchieved: state.isAchieved,
        goalDescription: state.goalDescription,
        isPrioritized: state.isPrioritized,
        updatedTime: goal.createdTime,
      ));
    }
  }
}
