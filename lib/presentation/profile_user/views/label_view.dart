import 'package:flutter/material.dart';
import 'package:stepper/common/consts.dart';
import 'package:stepper/common/numbers.dart';
import 'package:stepper/common/palette.dart';

class LabelView extends StatelessWidget {
  final String labelText;
  final double labelWidth;

  const LabelView({
    required this.labelText,
    required this.labelWidth,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Container(
      height: screenSize.width * 0.06,
      width: labelWidth,
      decoration: BoxDecoration(
        color: sliderInactiveColor,
        borderRadius: BorderRadius.circular(largeBorderRadius),
      ),
      child: Center(
        child: Text(
          labelText,
          style: const TextStyle(fontSize: fifteen),
        ),
      ),
    );
  }
}
