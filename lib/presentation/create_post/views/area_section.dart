import 'package:flutter/material.dart';
import 'package:stepper/common/consts.dart';
import 'package:stepper/common/palette.dart';
import 'package:stepper/dummy_data.dart';
import 'package:stepper/presentation/create_post/views/area_rating.dart';

class AreaSection extends StatelessWidget {
  const AreaSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(screenMediumPadding),
      decoration: BoxDecoration(
        color: blueGrey,
        borderRadius: BorderRadius.circular(mediumBorderRadius),
      ),
      child: Column(
        children: [
          const AreaRating(),
          const SizedBox(height: screenSmallPadding),
          Text(scopeAreaList[0].areaDescription)
        ],
      ),
    );
  }
}
