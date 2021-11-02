import 'package:stepper/data/model/goal.dart';
import 'package:stepper/data/repositories/abstract/goal_repository.dart';
import 'package:stepper/dummy_data.dart';

class FakeGoalRepositoryImpl extends GoalRepository {
  @override
  Future<void> setGoals(List<Goal> goals) async {
    // TODO: call post REST API here
    Future.delayed(
      const Duration(seconds: 1),
      () {
        goalList.insertAll(0, goals);
      },
    );
  }
}
