import 'package:flutter/material.dart';
import 'package:stepper/common/consts.dart';
import 'package:stepper/common/texts.dart';
import 'package:stepper/dummy_data.dart';
import 'package:stepper/presentation/common/area/area_item.dart';

class ScopeView extends StatelessWidget {
  const ScopeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.all(screenMediumPadding),
      child: ListView.builder(
        itemBuilder: (context, index) => AreaItem(
          area: scopeAreaList[index],
          areaSubTitle:
              '${scopeAreaList[index].numberOfUpdate} $updateThisWeek',
          itemWidth: screenSize.width - screenMediumPadding * 2,
        ),
        itemCount: scopeAreaList.length,
      ),
    );
  }
}
