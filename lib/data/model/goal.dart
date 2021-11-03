class Goal {
  final String goalDescription;
  final int goalId;
  final String areaName;
  final DateTime createdTime;
  final bool achieved;
  final bool isPrioritized;

  const Goal({
    required this.goalId,
    required this.goalDescription,
    required this.areaName,
    required this.createdTime,
    required this.achieved,
    required this.isPrioritized,
  });
}
