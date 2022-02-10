import 'package:flutter/material.dart';
import 'package:stepper/common/consts.dart';
import 'package:stepper/common/palette.dart';
import 'package:stepper/data/model2/models2.dart';
import 'package:stepper/presentation/home/views/rating_indicator.dart';
import 'package:stepper/presentation/utils.dart';

class AreaMainCard extends StatelessWidget {
  final Area area;
  const AreaMainCard({
    Key? key,
    required this.area,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Container(
      padding: const EdgeInsets.all(screenMediumPadding),
      decoration: BoxDecoration(
        color: blueGrey,
        borderRadius: BorderRadius.circular(largeBorderRadius),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                area.name,
                style: TextStyle(
                  color: getAreaTheme(area.type)[2],
                  fontSize: superLargeFontSize,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
          RatingIndicator(
            indicatorText: sliderValues[area.rating],
            indicatorWidth: ((screenSize.width -
                    screenMediumPadding * 4 -
                    indicatorPadding * 2) /
                3),
            indicatorHeight: screenSize.width * 0.015,
            indicatorPadding: indicatorPadding,
            area: area,
          ),
          const SizedBox(height: screenMediumPadding),
          Text(area.description),
        ],
      ),
    );
  }
}
