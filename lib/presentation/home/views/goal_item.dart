import 'package:flutter/material.dart';
import 'package:stepper/common/consts.dart';
import 'package:stepper/common/palette.dart';

class GoalItem extends StatefulWidget {
  const GoalItem({Key? key}) : super(key: key);

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
          trailing: const Icon(Icons.more_vert),
          title: const Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit',
            style: TextStyle(fontSize: normalFontSize, color: white),
          ),
          subtitle: Row(
            children: [
              const Text(
                'S1',
                style: TextStyle(fontSize: smallFontSize, color: lightGrey),
              ),
              const SizedBox(width: screenExtraSmallPadding),
              Container(
                width: 5.0,
                height: 5.0,
                decoration: const BoxDecoration(
                  color: darkGrey,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: screenExtraSmallPadding),
              const Text(
                '3 days ago',
                style: TextStyle(fontSize: smallFontSize, color: lightGrey),
              )
            ],
          ),
        ),
      ),
    );
  }
}
