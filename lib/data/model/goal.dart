import 'package:equatable/equatable.dart';

class Goal extends Equatable {
  final int goalId;
  final String goalDescription;
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

  @override
  List<Object?> get props => [
        goalId,
        goalDescription,
        areaName,
        createdTime,
        achieved,
        isPrioritized,
      ];
}
