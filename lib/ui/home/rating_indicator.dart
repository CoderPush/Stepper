import 'package:flutter/material.dart';
import 'package:stepper/common/consts.dart';
import 'package:stepper/common/palette.dart';

class RatingIndicator extends StatelessWidget {
  const RatingIndicator({Key? key}) : super(key: key);

  double _calculateIndicatorWidth(Size screenSize) {
    return (screenSize.width * 0.6 -
            screenMediumPadding -
            screenExtraSmallPadding * 3) /
        3;
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const Text('Good', style: TextStyle(fontSize: smallFontSize)),
        Row(
          children: List.generate(
            3,
            (index) => Padding(
              padding: const EdgeInsets.only(left: screenExtraSmallPadding),
              child: Container(
                width: _calculateIndicatorWidth(screenSize),
                height: screenSize.width * 0.01,
                color: lightGrey,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
