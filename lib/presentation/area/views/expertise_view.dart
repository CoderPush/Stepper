import 'package:flutter/material.dart';
import 'package:stepper/common/consts.dart';
import 'package:stepper/common/texts.dart';
import 'package:stepper/dummy_data.dart';
import 'package:stepper/presentation/common/area/area_item.dart';

class ExpertiseView extends StatelessWidget {
  const ExpertiseView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return ListView.builder(
      padding: const EdgeInsets.all(screenMediumPadding),
      itemBuilder: (context, index) => AreaItem(
        area: expertiseAreaList[index],
        areaSubTitle:
            '${expertiseAreaList[index].numberOfUpdate} $updateThisWeek',
        itemWidth: screenSize.width - screenMediumPadding * 2,
      ),
      itemCount: expertiseAreaList.length,
    );
  }
}
