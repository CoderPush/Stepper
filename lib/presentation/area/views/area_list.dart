import 'package:flutter/material.dart';
import 'package:stepper/common/consts.dart';
import 'package:stepper/common/texts.dart';
import 'package:stepper/data/model/models.dart';
import 'package:stepper/presentation/common/commons.dart';

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
      itemBuilder: (context, index) => AreaItem(
        area: areaList[index],
        areaSubTitle: '${areaList[index].numberOfUpdate} $updateThisWeek',
        itemWidth: screenSize.width - screenMediumPadding * 2,
      ),
      itemCount: areaList.length,
    );
  }
}
