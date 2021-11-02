import 'package:flutter/material.dart';
import 'package:stepper/common/consts.dart';
import 'package:stepper/common/palette.dart';
import 'package:stepper/common/texts.dart';
import 'package:stepper/data/model/models.dart';
import 'package:stepper/presentation/create_post/views/create_goal_item.dart';

class CreateGoalList extends StatelessWidget {
  const CreateGoalList({Key? key}) : super(key: key);

  void _removeAnimatedListItem(int index, List<Goal> goalItems) {
    final removedGoal = goalItems[index];
    goalItems.removeAt(index);
    animatedListKey.currentState!.removeItem(
      index,
      (context, animation) => CreateGoalItem(
        animation: animation,
        goal: removedGoal,
        onClick: () {},
      ),
    );
  }

  void _addAnimatedListItem(List<Goal> goalItems) {
    goalItems.insert(
      0,
      Goal(
        achieved: false,
        areaName: 'S1',
        goalDescription: 'abc',
        goalId: 10,
        createdTime: DateTime.now(),
      ),
    );
    animatedListKey.currentState!.insertItem(0);
  }

  @override
  Widget build(BuildContext context) {
    List<Goal> goalItems = [];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AnimatedList(
          key: animatedListKey,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index, animation) => CreateGoalItem(
            goal: goalItems[index],
            animation: animation,
            onClick: () => _removeAnimatedListItem(index, goalItems),
          ),
          initialItemCount: 0,
        ),
        TextButton.icon(
          key: const Key("addGoalButton"),
          onPressed: () => _addAnimatedListItem(goalItems),
          icon: const Icon(Icons.add, color: mediumGrey),
          label: const Text(addGoal, style: TextStyle(color: mediumGrey)),
        )
      ],
    );
  }
}
