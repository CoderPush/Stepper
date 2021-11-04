import 'package:flutter/material.dart';
import 'package:stepper/common/palette.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stepper/presentation/common/goal/cubit/goal_cubit.dart';

class CustomCheckbox extends StatelessWidget {
  final bool isChecked;
  const CustomCheckbox({
    Key? key,
    required this.isChecked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        context.read<GoalCubit>().achieveGoal();
      },
      icon: Container(
        width: 40.0,
        height: 40.0,
        decoration: BoxDecoration(
          color: isChecked ? Colors.green : checkboxBackGroundColor,
          shape: BoxShape.circle,
        ),
        child: isChecked ? const Icon(Icons.check, color: black) : null,
      ),
    );
  }
}
