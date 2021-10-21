import 'package:flutter/material.dart';
import 'package:stepper/common/consts.dart';
import 'package:stepper/common/palette.dart';
import 'package:stepper/common/texts.dart';
import 'package:stepper/presentation/common/drawer/drawer.dart';
import 'package:stepper/presentation/home/views/area_item.dart';
import 'package:stepper/presentation/home/views/goal_list.dart';

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
                  icon: const Icon(Icons.menu),
                  onPressed: () => Scaffold.of(context).openDrawer(),
                );
              }),
              const Padding(
                padding: EdgeInsets.only(
                  left: screenSmallPadding,
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
              Padding(
                padding: const EdgeInsets.only(right: screenSmallPadding),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(
                      3,
                      (index) => const Padding(
                        padding: EdgeInsets.only(left: screenSmallPadding),
                        child: AreaItem(),
                      ),
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(
                  screenSmallPadding,
                  40.0,
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
              const GoalList(),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        elevation: 0.0,
        backgroundColor: darkGrey,
        child: const Icon(Icons.add),
      ),
    );
  }
}
