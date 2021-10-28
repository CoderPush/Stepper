import 'package:flutter/material.dart';
import 'package:stepper/common/consts.dart';
import 'package:stepper/common/palette.dart';
import 'package:stepper/data/model/models.dart';

class GoalItem extends StatefulWidget {
  final bool isCreatingGoal;
  final Goal goal;
  const GoalItem({
    Key? key,
    required this.goal,
    required this.isCreatingGoal,
  }) : super(key: key);

  @override
  State<GoalItem> createState() => _GoalItemState();
}

class _GoalItemState extends State<GoalItem> {
  bool _checked = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: screenSmallPadding),
      child: Card(
        color: darkGrey,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(mediumBorderRadius)),
        child: ListTile(
          horizontalTitleGap: 8.0,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: screenSmallPadding),
          leading: Transform.scale(
            scale: 1.5,
            child: Checkbox(
              activeColor: darkGrey,
              checkColor: grey,
              value: _checked,
              onChanged: (value) {
                setState(() {
                  _checked = value!;
                });
              },
              shape: const CircleBorder(),
              side: BorderSide.none,
            ),
          ),
          trailing: !widget.isCreatingGoal
              ? const Icon(
                  Icons.more_vert,
                  color: moreIconColor,
                )
              : null,
          title: Text(
            widget.goal.goalDescription,
            style: const TextStyle(fontSize: normalFontSize),
          ),
          subtitle: !widget.isCreatingGoal
              ? Row(
                  children: [
                    Text(
                      widget.goal.areaName,
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
                    Text(
                      '${monthNames[widget.goal.createdTime.month - 1]} ${widget.goal.createdTime.day}',
                      style: const TextStyle(
                          fontSize: smallFontSize, color: lightGrey),
                    )
                  ],
                )
              : null,
        ),
      ),
    );
  }
}
