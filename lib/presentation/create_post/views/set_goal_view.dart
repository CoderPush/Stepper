import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stepper/common/consts.dart';
import 'package:stepper/common/palette.dart';
import 'package:stepper/common/texts.dart';
import 'package:stepper/data/model/models.dart';
import 'package:stepper/presentation/create_post/cubit/create_post_cubit.dart';
import 'package:stepper/presentation/create_post/views/create_goal_item.dart';

class SetGoalView extends StatelessWidget {
  const SetGoalView({Key? key}) : super(key: key);

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
            goalId: DateTime.now().toString(),
            createdTime: DateTime.now(),
            isPrioritized: false,
          ),
        );
    animatedListKey.currentState!.insertItem(state.newlyAddedGoals.length);
  }

  void onPostClick(BuildContext context) async {
    // await context.read<CreatePostCubit>().onPublishGoals();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Column(
      children: [
        Container(
          constraints: BoxConstraints(minHeight: screenSize.height * 0.25),
          child: BlocBuilder<CreatePostCubit, CreatePostState>(
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
                    onPressed: () =>
                        _addAnimatedListItem(context, currentState),
                    icon: const Icon(Icons.add, color: mediumGrey),
                    label: const Text(
                      addGoal,
                      style: TextStyle(color: mediumGrey),
                    ),
                  )
                ],
              );
            },
          ),
        ),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            key: const Key(postButton),
            style: ElevatedButton.styleFrom(
              primary: purple,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(largeBorderRadius),
              ),
            ),
            onPressed: () => onPostClick(context),
            child: const Text(publish),
          ),
        )
      ],
    );
  }
}
