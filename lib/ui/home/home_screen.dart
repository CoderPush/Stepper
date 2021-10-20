import 'package:flutter/material.dart';
import 'package:stepper/common/consts.dart';
import 'package:stepper/common/palette.dart';
import 'package:stepper/common/texts.dart';
import 'package:stepper/ui/home/area_item.dart';
import 'package:stepper/ui/home/goal_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(
                  left: screenSmallPadding,
                  bottom: screenSmallPadding,
                  top: 50.0,
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
