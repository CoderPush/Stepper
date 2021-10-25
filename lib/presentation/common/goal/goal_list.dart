import 'package:flutter/material.dart';
import 'package:stepper/data/model/models.dart';
import 'package:stepper/presentation/common/goal/goal_item.dart';

class GoalList extends StatelessWidget {
  final List<Goal> goalList;
  const GoalList({
    Key? key,
    required this.goalList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) => const GoalItem(),
      itemCount: goalList.length,
    );
  }
}
