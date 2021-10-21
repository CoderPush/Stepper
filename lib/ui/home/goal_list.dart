import 'package:flutter/material.dart';
import 'package:stepper/common/consts.dart';
import 'package:stepper/ui/home/goal_item.dart';

class GoalList extends StatelessWidget {
  const GoalList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(screenSmallPadding),
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) => const GoalItem(),
        itemCount: 10,
      ),
    );
  }
}
