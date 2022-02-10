import 'package:flutter/material.dart';
import 'package:stepper/common/consts.dart';
import 'package:stepper/common/palette.dart';
import 'package:stepper/data/model2/models2.dart';
import 'package:stepper/presentation/home/views/rating_indicator.dart';
import 'package:stepper/presentation/utils.dart';
import 'package:stepper/config/routes/routes.dart';

class AreaWithDescriptionItem extends StatelessWidget {
  final String areaSubTitle;
  final double itemWidth;
  final Area area;

  const AreaWithDescriptionItem({
    Key? key,
    required this.areaSubTitle,
    required this.itemWidth,
    required this.area,
  }) : super(key: key);

  void _onAreaItemTap(BuildContext context, Area area) {
    Navigator.pushNamed(context, RouteNames.postList, arguments: area);
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () => _onAreaItemTap(context, area),
      child: Padding(
        padding: const EdgeInsets.only(bottom: screenMediumPadding),
        child: Container(
          padding: const EdgeInsets.symmetric(
            vertical: screenMediumPadding,
            horizontal: screenMediumPadding,
          ),
          decoration: BoxDecoration(
            color: darkGrey,
            borderRadius: BorderRadius.circular(largeBorderRadius),
          ),
          width: itemWidth,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    flex: 2,
                    child: Text(
                      area.name,
                      style: TextStyle(
                        fontSize: largeFontSize,
                        fontWeight: FontWeight.bold,
                        color: getAreaTheme(area.type)[2],
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 4,
                    child: Padding(
                      padding:
                          const EdgeInsets.only(bottom: screenSmallPadding),
                      child: RatingIndicator(
                        indicatorText: areaSubTitle,
                        indicatorWidth:
                            itemWidth * 0.6 / 3 - screenSmallPadding,
                        indicatorHeight: screenSize.width * 0.01,
                        indicatorPadding: indicatorPadding,
                        area: area,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: screenSmallPadding),
              Text(
                area.description,
                style: const TextStyle(
                  fontSize: normalFontSize,
                  color: lightGrey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
