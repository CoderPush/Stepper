import 'package:flutter/material.dart';
import 'package:stepper/common/consts.dart';
import 'package:stepper/common/palette.dart';
import 'package:stepper/data/model/models.dart';
import 'package:stepper/presentation/home/views/rating_indicator.dart';

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
        borderRadius: BorderRadius.circular(mediumBorderRadius),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                area.areaName,
                style: TextStyle(
                  color: area.getAreaTheme()[2],
                  fontSize: superLargeFontSize,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
          Text(area.areaDescription),
          RatingIndicator(
            indicatorText: '',
            indicatorWidth: screenSize.width * 0.7 / 3,
            indicatorHeight: screenSize.width * 0.015,
            indicatorPadding: indicatorPadding,
            area: area,
          )
        ],
      ),
    );
  }
}
