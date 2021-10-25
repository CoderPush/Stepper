class Goal {
  final String goalDescription;
  final int goalId;
  final String areaName;
  final DateTime createdTime;

  const Goal({
    required this.goalId,
    required this.goalDescription,
    required this.areaName,
    required this.createdTime,
  });
}
