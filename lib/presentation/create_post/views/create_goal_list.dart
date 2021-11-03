import 'package:flutter/material.dart';
import 'package:stepper/common/consts.dart';
import 'package:stepper/common/palette.dart';
import 'package:stepper/common/texts.dart';
import 'package:stepper/data/model/models.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stepper/presentation/create_post/cubit/create_post_cubit.dart';
import 'package:stepper/presentation/create_post/views/create_goal_item.dart';

class CreateGoalList extends StatelessWidget {
  const CreateGoalList({Key? key}) : super(key: key);

  void _removeAnimatedListItem(
      int index, BuildContext context, CreatePostLoadedState state) {
    final removedGoal = state.newlyAddedGoals[index];
    context.read<CreatePostCubit>().onNewGoalDeleted(index);
    animatedListKey.currentState!.removeItem(
      index,
      (context, animation) => CreateGoalItem(
        animation: animation,
        goal: removedGoal,
        onClick: () {},
      ),
    );
  }

  void _addAnimatedListItem(BuildContext context, CreatePostLoadedState state) {
    context.read<CreatePostCubit>().onNewGoalAdded(
          Goal(
            achieved: false,
            areaName: state.selectedAreaName,
            goalDescription: 'Lorem ipsum dolor sit amet',
            goalId: DateTime.now().millisecondsSinceEpoch,
            createdTime: DateTime.now(),
            isPrioritized: false,
          ),
        );
    animatedListKey.currentState!.insertItem(state.newlyAddedGoals.length);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreatePostCubit, CreatePostState>(
      builder: (context, state) {
        final currentState = state as CreatePostLoadedState;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AnimatedList(
              key: animatedListKey,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index, animation) => CreateGoalItem(
                goal: currentState.newlyAddedGoals[index],
                animation: animation,
                onClick: () => _removeAnimatedListItem(
                  index,
                  context,
                  currentState,
                ),
              ),
              initialItemCount: currentState.newlyAddedGoals.length,
            ),
            TextButton.icon(
              key: const Key(addGoalButton),
              onPressed: () => _addAnimatedListItem(context, currentState),
              icon: const Icon(Icons.add, color: mediumGrey),
              label: const Text(addGoal, style: TextStyle(color: mediumGrey)),
            )
          ],
        );
      },
    );
  }
}
