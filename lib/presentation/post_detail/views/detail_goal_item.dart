import 'package:flutter/material.dart';
import 'package:stepper/common/consts.dart';
import 'package:stepper/common/palette.dart';
import 'package:stepper/data/model/models.dart';

class DetailGoalItem extends StatelessWidget {
  final Goal goal;
  const DetailGoalItem({
    Key? key,
    required this.goal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: screenSmallPadding),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(mediumBorderRadius),
          color: darkGrey,
        ),
        child: Row(
          children: [
            Checkbox(
              activeColor: darkGrey,
              checkColor: grey,
              value: true,
              onChanged: (value) {},
              shape: const CircleBorder(),
              side: BorderSide.none,
            ),
            Text(goal.goalDescription),
          ],
        ),
      ),
    );
  }
}
