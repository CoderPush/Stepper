import 'package:flutter/material.dart';
import 'package:stepper/common/consts.dart';
import 'package:stepper/common/palette.dart';
import 'package:stepper/common/texts.dart';
import 'package:stepper/dummy_data.dart';
import 'package:stepper/presentation/common/custom_floating_button.dart';
import 'package:stepper/presentation/common/drawer/drawer.dart';
import 'package:stepper/presentation/common/commons.dart';
import 'package:stepper/presentation/home/views/horizontal_area_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      drawer: SizedBox(
        child: MainDrawer(),
        width: screenSize.width * 0.7,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Builder(builder: (context) {
                return IconButton(
                  tooltip: "openDrawerButton",
                  color: darkGrey,
                  icon: const Icon(Icons.menu),
                  onPressed: () => Scaffold.of(context).openDrawer(),
                );
              }),
              const Padding(
                padding: EdgeInsets.only(
                  left: screenMediumPadding,
                  bottom: screenSmallPadding,
                  top: screenMediumPadding,
                ),
                child: Text(
                  recentlyUpdated,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: mediumFontSize,
                  ),
                ),
              ),
              HorizontalAreaList(areaList: scopeAreaList),
              const Padding(
                padding: EdgeInsets.fromLTRB(
                  screenMediumPadding,
                  screenLargePadding,
                  screenSmallPadding,
                  screenSmallPadding,
                ),
                child: Text(
                  priorityGoal,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: mediumFontSize,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: screenMediumPadding,
                ),
                child: GoalList(
                  goalList:
                      goalList.where((goal) => goal.areaName == 'S1').toList(),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: const CustomFloatingButton(),
    );
  }
}
