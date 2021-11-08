import 'package:hive/hive.dart';
import 'package:stepper/data/model/models.dart';

class GoalDatabase {
  final _boxName = "Goal";

  // open a box
  Future<Box<Goal>> goalBox() async {
    var box = await Hive.openBox<Goal>(_boxName);
    return box;
  }

  // get goal by id
  Future<Goal?> getGoalById(String goalId) async {
    final box = await goalBox();
    print(goalId);
    return box.get(goalId);
  }

  // get goal by area name
  Future<List<Goal>> getGoalByAreaName(String areaName) async {
    return (await getAllGoals())
        .where((goal) => goal.areaName == areaName)
        .toList();
  }

  // get priority goal
  Future<List<Goal>> getPriorityGoal() async {
    return (await getAllGoals())
        .where((goal) => goal.isPrioritized == true)
        .toList();
  }

  // get all goals
  Future<List<Goal>> getAllGoals() async {
    final box = await goalBox();
    return box.values.toList();
  }

  // to add goal in box
  Future<void> addGoal(Goal goal) async {
    final box = await goalBox();
    print(goal.goalId);
    await box.put(goal.goalId, goal);
  }

  // delete goal from box
  Future<void> deleteGoal(String goalId) async {
    final box = await goalBox();
    await box.delete(goalId);
  }

  // delete all goals from box
  Future<void> deleteAllGoals() async {
    final box = await goalBox();
    await box.clear();
  }

  // update goal
  Future<void> updateGoal(Goal goal) async {
    final box = await goalBox();
    await box.put(goal.goalId, goal);
  }
}
