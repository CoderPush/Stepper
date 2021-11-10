import 'package:flutter/material.dart';
import 'package:stepper/common/numbers.dart';
import 'package:stepper/common/palette.dart';

class BadgeItemView extends StatelessWidget {
  const BadgeItemView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: fortySix,
      width: fortySix,
      margin: const EdgeInsets.only(right: twentyOne),
      decoration: BoxDecoration(
        color: sliderInactiveColor,
        borderRadius: BorderRadius.circular(fortySix),
      ),
    );
  }
}
