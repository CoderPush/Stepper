import 'package:flutter/material.dart';
import 'package:stepper/common/consts.dart';
import 'package:stepper/common/texts.dart';
import 'package:stepper/presentation/area/views/tabbar_item.dart';

class TabRow extends StatelessWidget {
  const TabRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Flexible(
          child: Padding(
            padding: EdgeInsets.all(screenMediumPadding),
            child: TabBarItem(
              tabBarText: scope,
              isSelected: true,
            ),
          ),
        ),
        Flexible(
          child: Padding(
            padding: EdgeInsets.all(screenMediumPadding),
            child: TabBarItem(
              tabBarText: expertise,
              isSelected: false,
            ),
          ),
        ),
        Flexible(
          child: Padding(
            padding: EdgeInsets.all(screenMediumPadding),
            child: TabBarItem(
              tabBarText: mindset,
              isSelected: false,
            ),
          ),
        ),
      ],
    );
  }
}
