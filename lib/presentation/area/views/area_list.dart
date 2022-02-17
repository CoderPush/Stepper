import 'package:flutter/material.dart';
import 'package:stepper/common/consts.dart';
import 'package:stepper/common/texts.dart';
import 'package:stepper/data/models/models.dart';
import 'package:stepper/presentation/area/views/area_with_description_item.dart';

class AreaList extends StatelessWidget {
  final List<Area> areaList;

  const AreaList({
    Key? key,
    required this.areaList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return ListView.builder(
      padding: const EdgeInsets.all(screenMediumPadding),
      itemBuilder: (context, index) => AreaWithDescriptionItem(
        area: areaList[index],
        areaSubTitle: '${areaList[index].numberOfPosts} $updateThisWeek',
        itemWidth: screenSize.width - screenMediumPadding * 2,
      ),
      itemCount: areaList.length,
    );
  }
}
