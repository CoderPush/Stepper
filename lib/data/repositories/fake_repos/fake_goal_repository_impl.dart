import 'package:stepper/data/model/goal.dart';
import 'package:stepper/data/repositories/abstract/goal_repository.dart';
import 'package:stepper/dummy_data.dart';

class FakeGoalRepositoryImpl extends GoalRepository {
  @override
  Future<void> setGoals(List<Goal> goals) async {
    // TODO: call post REST API here
    await Future.delayed(const Duration(seconds: 1), () {
      goalList.insertAll(0, goals);
    });
  }

  @override
  Future<List<Goal>> getPriorityGoals() async {
    // TODO: call post REST API here
    return Future.delayed(const Duration(seconds: 1), () {
      return goalList.where((goal) => goal.isPrioritized == true).toList();
    });
  }

  @override
  Future<void> achieveGoal(
      {required int goalId,
      required bool isAchieved,
      required DateTime updatedTime}) async {
    // TODO: call post REST API here
    await Future.delayed(const Duration(seconds: 1), () {
      final replacedGoal =
          goalList[goalList.indexWhere((goal) => goal.goalId == goalId)];
      goalList[goalList.indexWhere((goal) => goal.goalId == goalId)] = Goal(
        goalId: goalId,
        goalDescription: replacedGoal.goalDescription,
        areaName: replacedGoal.areaName,
        createdTime: updatedTime,
        achieved: isAchieved,
        isPrioritized: replacedGoal.isPrioritized,
      );
    });
  }
}
