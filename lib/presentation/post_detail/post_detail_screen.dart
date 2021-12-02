import 'package:flutter/material.dart';
import 'package:stepper/common/consts.dart';
import 'package:stepper/common/palette.dart';
import 'package:stepper/common/texts.dart';
import 'package:stepper/data/model/models.dart';
import 'package:stepper/presentation/common/commons.dart';

class PostDetailScreen extends StatelessWidget {
  final Post selectedPost;
  const PostDetailScreen({
    Key? key,
    required this.selectedPost,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Goal> taggedGoals = [];

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
                PostDay(post: selectedPost),
                const SizedBox(height: screenMediumPadding),
                Text(selectedPost.description),
                const SizedBox(height: screenMediumPadding),
                ...List.generate(
                  taggedGoals.length,
                  (index) => GoalItem(
                    goal: taggedGoals[index],
                    isCreatingGoal: false,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
