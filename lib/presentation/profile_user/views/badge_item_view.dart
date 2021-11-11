import 'package:flutter/material.dart';
import 'package:stepper/common/numbers.dart';
import 'package:stepper/common/palette.dart';

class BadgeItemView extends StatelessWidget {
  const BadgeItemView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Container(
      height: screenSize.width * 0.11,
      width: screenSize.width * 0.11,
      margin: const EdgeInsets.only(right: twentyOne),
      decoration: BoxDecoration(
        color: sliderInactiveColor,
        borderRadius: BorderRadius.circular(fortySix),
      ),
    );
  }
}
