import 'package:stepper/data/model/models.dart';

abstract class GoalRepository {
  Future<void> setGoals(List<Goal> goalList);
}
