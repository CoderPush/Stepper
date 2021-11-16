import 'package:flutter/material.dart';
import 'package:stepper/common/consts.dart';
import 'package:stepper/data/model/models.dart';
import 'package:stepper/presentation/home/views/area_item.dart';

class HorizontalAreaList extends StatelessWidget {
  final List<Area> areaList;
  const HorizontalAreaList({Key? key, required this.areaList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          areaList.length,
          (index) => Padding(
            padding: const EdgeInsets.only(left: screenMediumPadding),
            child: AreaItem(
              areaSubTitle: sliderValues[areaList[index].rating],
              itemWidth: screenSize.width * 0.6,
              area: areaList[index],
            ),
          ),
        ),
      ),
    );
  }
}
