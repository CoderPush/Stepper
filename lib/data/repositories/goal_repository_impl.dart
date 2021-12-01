import 'package:stepper/data/datasources/local/databases.dart';
import 'package:stepper/data/model/goal.dart';
import 'package:stepper/domain/repositories/goal_repository.dart';

class GoalRepositoryImpl extends GoalRepository {
  final GoalDatabase goalDatabase;

  GoalRepositoryImpl({required this.goalDatabase}) : super();

  @override
  Future<void> setGoals(List<Goal> goals) async {
    for (var goal in goals) {
      await goalDatabase.addGoal(goal);
    }
  }

  @override
  Future<List<Goal>> getPriorityGoals() async {
    return await goalDatabase.getPriorityGoal();
  }

  @override
  Future<void> achieveGoal({
    required String goalId,
    required bool isAchieved,
    required DateTime updatedTime,
  }) async {
    final replacedGoal = await goalDatabase.getGoalById(goalId);
    goalDatabase.updateGoal(Goal(
      goalId: goalId,
      goalDescription: replacedGoal!.goalDescription,
      areaName: replacedGoal.areaName,
      createdTime: replacedGoal.createdTime,
      updatedTime: updatedTime,
      achieved: isAchieved,
      isPrioritized: replacedGoal.isPrioritized,
    ));
  }
}
