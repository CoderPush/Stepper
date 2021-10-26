import 'package:flutter/material.dart';
import 'package:stepper/common/consts.dart';
import 'package:stepper/common/palette.dart';
import 'package:stepper/common/texts.dart';
import 'package:stepper/data/model/models.dart';
import 'package:stepper/dummy_data.dart';
import 'package:stepper/presentation/common/commons.dart';
import 'package:stepper/presentation/post_detail/views/detail_goal_item.dart';

class PostDetailScreen extends StatelessWidget {
  const PostDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, Post>;
    final Post currentPost = routeArgs['post']!;
    final List<Goal> taggedGoals = [];
    for (var id in currentPost.taggedGoalIds) {
      taggedGoals.add(goalList.firstWhere((goal) => goal.goalId == id));
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: darkPurple,
        title: const Text(post),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert),
          )
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(screenMediumPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PostDay(post: currentPost),
                const SizedBox(height: screenMediumPadding),
                Text(currentPost.description),
                const SizedBox(height: screenMediumPadding),
                ...List.generate(
                  taggedGoals.length,
                  (index) => DetailGoalItem(goal: taggedGoals[index]),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
