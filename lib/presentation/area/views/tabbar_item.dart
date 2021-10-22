import 'package:flutter/material.dart';
import 'package:stepper/common/palette.dart';

class TabBarItem extends StatelessWidget {
  final String tabBarText;
  const TabBarItem({Key? key, required this.tabBarText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Container(
        alignment: Alignment.center,
        width: double.infinity,
        height: 30.0,
        decoration: BoxDecoration(
          color: purple,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Text(tabBarText),
      ),
    );
  }
}
