import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:stepper/common/consts.dart';
import 'package:stepper/data/models/models.dart';
import 'package:stepper/presentation/home/views/area_item.dart';

class HorizontalAreaList extends StatelessWidget {
  final List<Area> areaList;
  const HorizontalAreaList({Key? key, required this.areaList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return SizedBox(
      height: 80,
      child: PageView.builder(
          scrollBehavior: const ScrollBehavior().copyWith(
              dragDevices: <PointerDeviceKind>{
                PointerDeviceKind.mouse,
                PointerDeviceKind.touch
              }),
          padEnds: false,
          controller: PageController(viewportFraction: 0.8),
          itemCount: areaList.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: index == 0
                  ? const EdgeInsets.only(
                      left: screenMediumPadding,
                      right: screenMediumPadding,
                    )
                  : const EdgeInsets.only(right: screenMediumPadding),
              child: AreaItem(
                areaSubTitle: sliderValues[areaList[index].rating],
                itemWidth: screenSize.width * 0.6,
                area: areaList[index],
              ),
            );
          }),
    );
  }
}
