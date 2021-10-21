import 'package:flutter/material.dart';
import 'package:stepper/common/consts.dart';
import 'package:stepper/common/palette.dart';
import 'package:stepper/presentation/home/views/rating_indicator.dart';

class AreaItem extends StatelessWidget {
  const AreaItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Container(
      decoration: BoxDecoration(
        color: grey,
        borderRadius: BorderRadius.circular(mediumBorderRadius),
      ),
      width: screenSize.width * 0.6,
      height: screenSize.width * 0.15,
      child: Stack(
        children: const [
          Positioned.fill(
            left: screenMediumPadding,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'S1',
                style: TextStyle(
                  fontSize: largeFontSize,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: screenSmallPadding,
            left: screenSmallPadding,
            right: screenSmallPadding,
            child: RatingIndicator(),
          )
        ],
      ),
    );
  }
}
