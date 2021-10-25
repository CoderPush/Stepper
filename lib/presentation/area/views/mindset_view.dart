import 'package:flutter/material.dart';
import 'package:stepper/common/consts.dart';
import 'package:stepper/common/texts.dart';
import 'package:stepper/data/model/area.dart';
import 'package:stepper/presentation/common/area/area_item.dart';

class MindsetView extends StatelessWidget {
  final List<Area> areaList;
  const MindsetView({
    Key? key,
    required this.areaList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return ListView.builder(
      padding: const EdgeInsets.all(screenMediumPadding),
      itemBuilder: (context, index) => AreaItem(
        area: areaList[index],
        areaSubTitle:
            '${areaList[index].numberOfUpdate} $updateThisWeek',
        itemWidth: screenSize.width - screenMediumPadding * 2,
      ),
      itemCount: areaList.length,
    );
  }
}
