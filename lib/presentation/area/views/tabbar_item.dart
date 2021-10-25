import 'package:flutter/material.dart';
import 'package:stepper/common/palette.dart';
import 'package:stepper/common/texts.dart';

class TabBarItem extends StatelessWidget {
  final bool isSelected;
  final String tabBarText;
  const TabBarItem({
    Key? key,
    required this.tabBarText,
    required this.isSelected,
  }) : super(key: key);

  Color _getTabColor() {
    if (tabBarText == scope) {
      return purple;
    } else if (tabBarText == expertise) {
      return orange;
    } else {
      return green;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Container(
        alignment: Alignment.center,
        width: double.infinity,
        height: 30.0,
        decoration: BoxDecoration(
          color: isSelected ? _getTabColor() : darkPurple,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Text(tabBarText),
      ),
    );
  }
}
