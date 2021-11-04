part of 'goal_cubit.dart';

abstract class GoalState extends Equatable {
  final int goalId;
  final bool isAchieved;
  final String goalDescription;
  final bool isPrioritized;
  final DateTime updatedTime;
  const GoalState({
    required this.goalId,
    required this.goalDescription,
    required this.isAchieved,
    required this.isPrioritized,
    required this.updatedTime,
  });

  @override
  List<Object> get props => [
        isAchieved,
        goalDescription,
        isPrioritized,
      ];
}

class GoalInitialState extends GoalState {
  const GoalInitialState({
    required int goalId,
    required bool isAchieved,
    required String goalDescription,
    required bool isPrioritized,
    required DateTime updatedTime,
  }) : super(
          goalId: goalId,
          isAchieved: isAchieved,
          goalDescription: goalDescription,
          isPrioritized: isPrioritized,
          updatedTime: updatedTime,
        );
}

class GoalEditState extends GoalState {
  const GoalEditState({
    required int goalId,
    required bool isAchieved,
    required String goalDescription,
    required bool isPrioritized,
    required DateTime updatedTime,
  }) : super(
          goalId: goalId,
          isAchieved: isAchieved,
          goalDescription: goalDescription,
          isPrioritized: isPrioritized,
          updatedTime: updatedTime,
        );
}

class GoalErrorState extends GoalState {
  final String errorMessage;
  const GoalErrorState({
    required this.errorMessage,
    required int goalId,
    required bool isAchieved,
    required String goalDescription,
    required bool isPrioritized,
    required DateTime updatedTime,
  }) : super(
          goalId: goalId,
          isAchieved: isAchieved,
          goalDescription: goalDescription,
          isPrioritized: isPrioritized,
          updatedTime: updatedTime,
        );
}
