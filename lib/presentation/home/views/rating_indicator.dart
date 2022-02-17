import 'package:flutter/material.dart';
import 'package:stepper/common/consts.dart';
import 'package:stepper/common/palette.dart';
import 'package:stepper/data/models/models.dart';
import 'package:stepper/presentation/utils.dart';

class RatingIndicator extends StatelessWidget {
  final String indicatorText;
  final double indicatorWidth;
  final double indicatorHeight;
  final double indicatorPadding;
  final Area area;

  const RatingIndicator({
    Key? key,
    required this.indicatorText,
    required this.indicatorWidth,
    required this.indicatorHeight,
    required this.indicatorPadding,
    required this.area,
  }) : super(key: key);

  List<Color> _calculateColorSchema() {
    List<Color> currentAreaScheme = List.from(getAreaTheme(area.type));
    for (var i = area.rating; i < currentAreaScheme.length; i++) {
      currentAreaScheme[i] = lightGrey;
    }
    return currentAreaScheme;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          indicatorText,
          style: const TextStyle(
            fontSize: smallFontSize,
            color: lightGrey,
          ),
        ),
        const SizedBox(
          height: screenSmallPadding,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: List.generate(
            3,
            (index) => Padding(
              padding: index == 0
                  ? const EdgeInsets.only(left: 0.0)
                  : EdgeInsets.only(left: indicatorPadding),
              child: FittedBox(
                child: Container(
                  width: indicatorWidth,
                  height: indicatorHeight,
                  color: _calculateColorSchema()[index],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
