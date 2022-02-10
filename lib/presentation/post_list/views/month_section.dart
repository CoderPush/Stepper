import 'package:flutter/material.dart';
import 'package:stepper/common/consts.dart';
import 'package:stepper/common/texts.dart';
import 'package:stepper/data/model2/models2.dart';
import 'package:stepper/presentation/common/commons.dart';

class MonthSection extends StatelessWidget {
  // TODO:
  // final List<Goal> goalList;
  final List<Post> postList;
  const MonthSection({
    Key? key,
    // TODO:
    // required this.goalList,
    required this.postList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(top: screenLargePadding),
          child: Text(
            goalThisMonth,
            style: TextStyle(
              fontSize: mediumFontSize,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        // TODO:
        // GoalList(goalList: goalList.toList()),
        PostList(
          postList: postList,
          hasAreaName: false,
        )
      ],
    );
  }
}
