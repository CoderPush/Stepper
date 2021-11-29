import 'package:flutter/material.dart';
import 'package:stepper/common/consts.dart';
import 'package:stepper/common/numbers.dart';
import 'package:stepper/common/palette.dart';

class LabelView extends StatelessWidget {
  final String labelText;

  const LabelView({
    required this.labelText,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        minWidth: 100.0,
      ),
      child: Container(
        padding: const EdgeInsets.all(screenSmallPadding),
        decoration: BoxDecoration(
          color: sliderInactiveColor,
          borderRadius: BorderRadius.circular(extraLargeBorderRadius),
        ),
        child: Center(
          child: Text(
            labelText,
            style: const TextStyle(fontSize: fifteen),
          ),
        ),
      ),
    );
  }
}
