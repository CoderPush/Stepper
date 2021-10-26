import 'package:flutter/material.dart';
import 'package:stepper/common/consts.dart';
import 'package:stepper/common/texts.dart';
import 'package:stepper/data/model/models.dart';
import 'package:stepper/presentation/common/commons.dart';
import 'package:stepper/presentation/post_list/views/post_list.dart';

class MonthSection extends StatelessWidget {
  final List<Goal> goalList;
  final List<Post> postList;
  const MonthSection({
    Key? key,
    required this.goalList,
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
        GoalList(goalList: goalList.toList()),
        PostList(postList: postList)
      ],
    );
  }
}
