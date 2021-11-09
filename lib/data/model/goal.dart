import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'goal.g.dart';

@HiveType(typeId: 1)
class Goal extends Equatable {
  @HiveField(0)
  final String goalId;
  @HiveField(1)
  final String goalDescription;
  @HiveField(2)
  final String areaName;
  @HiveField(3)
  final DateTime createdTime;
  @HiveField(4)
  final DateTime? updatedTime;
  @HiveField(5)
  final bool achieved;
  @HiveField(6)
  final bool isPrioritized;

  const Goal({
    required this.goalId,
    required this.goalDescription,
    required this.areaName,
    required this.createdTime,
    this.updatedTime,
    required this.achieved,
    required this.isPrioritized,
  });

  @override
  List<Object?> get props => [
        goalId,
        goalDescription,
        areaName,
        createdTime,
        updatedTime,
        achieved,
        isPrioritized,
      ];
}
