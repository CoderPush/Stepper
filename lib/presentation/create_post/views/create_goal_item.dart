import 'package:flutter/material.dart';
import 'package:stepper/common/palette.dart';
import 'package:stepper/data/model/models.dart';
import 'package:stepper/presentation/common/goal/goal_item.dart';

class CreateGoalItem extends StatelessWidget {
  final Goal goal;
  final Animation<double> animation;
  final VoidCallback? onClick;
  const CreateGoalItem({
    Key? key,
    required this.goal,
    required this.animation,
    required this.onClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizeTransition(
      key: ValueKey(goal.goalId),
      sizeFactor: animation,
      child: Row(
        children: [
          Expanded(
            child: GoalItem(
              goal: goal,
              isCreatingGoal: true,
            ),
          ),
          IconButton(
            onPressed: onClick,
            icon: const Icon(Icons.close),
            color: mediumGrey,
            constraints: const BoxConstraints(),
          )
        ],
      ),
    );
  }
}
