import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stepper/common/consts.dart';
import 'package:stepper/common/palette.dart';
import 'package:stepper/common/texts.dart';
import 'package:stepper/data/model/models.dart';
import 'package:stepper/injection_container.dart';
import 'package:stepper/presentation/common/checkbox/custom_checkbox.dart';
import 'package:stepper/presentation/common/goal/cubit/goal_cubit.dart';

class GoalItem extends StatelessWidget {
  final bool isCreatingGoal;
  final Goal goal;
  const GoalItem({
    Key? key,
    required this.goal,
    required this.isCreatingGoal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GoalCubit(
        goal: goal,
        goalRepository: sl(),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: screenSmallPadding),
        child: Card(
          color: darkGrey,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(mediumBorderRadius)),
          child: ListTile(
            horizontalTitleGap: 8.0,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: screenSmallPadding),
            leading: BlocConsumer<GoalCubit, GoalState>(
              listener: (context, state) {
                if (state is GoalErrorState) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text(achieveGoalError)));
                } else if (state is GoalEditState) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(
                    state.isAchieved == true
                        ? markGoalAsDone
                        : markGoalAsUndone,
                  )));
                }
              },
              builder: (context, state) {
                return CustomCheckbox(isChecked: state.isAchieved);
              },
            ),
            trailing: !isCreatingGoal
                ? const Icon(
                    Icons.more_vert,
                    color: moreIconColor,
                  )
                : null,
            title: Text(
              goal.goalDescription,
              style: const TextStyle(fontSize: normalFontSize),
            ),
            subtitle: !isCreatingGoal
                ? Row(
                    children: [
                      Text(
                        goal.areaName,
                        style: const TextStyle(
                          fontSize: smallFontSize,
                          color: lightGrey,
                        ),
                      ),
                      const SizedBox(width: screenExtraSmallPadding),
                      Container(
                        width: 5.0,
                        height: 5.0,
                        decoration: const BoxDecoration(
                          color: lightGrey,
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(width: screenExtraSmallPadding),
                      BlocBuilder<GoalCubit, GoalState>(
                        builder: (context, state) {
                          return Text(
                            '${monthNames[state.updatedTime.month - 1]} ${state.updatedTime.day}',
                            style: const TextStyle(
                                fontSize: smallFontSize, color: lightGrey),
                          );
                        },
                      )
                    ],
                  )
                : null,
          ),
        ),
      ),
    );
  }
}
