import 'package:flutter/material.dart';
import 'package:stepper/common/consts.dart';
import 'package:stepper/common/texts.dart';
import 'package:stepper/data/model/models.dart';
import 'package:stepper/presentation/common/commons.dart';
import 'package:stepper/routes.dart';

class HorizontalAreaList extends StatelessWidget {
  final List<Area> areaList;
  const HorizontalAreaList({Key? key, required this.areaList})
      : super(key: key);

  void _tapOnAreaItem(BuildContext context, Area area) {
    Navigator.pushNamed(context, Routes.postList, arguments: {'area': area});
  }

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
            child: GestureDetector(
              onTap: () => _tapOnAreaItem(context, areaList[index]),
              child: AreaItem(
                areaSubTitle: good,
                itemWidth: screenSize.width * 0.6,
                area: areaList[index],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
