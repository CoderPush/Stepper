import 'package:flutter/material.dart';
import 'package:stepper/common/consts.dart';
import 'package:stepper/common/palette.dart';
import 'package:stepper/data/model/models.dart';
import 'package:stepper/dummy_data.dart';
import 'package:stepper/presentation/common/custom_floating_button.dart';
import 'package:stepper/presentation/common/drawer/drawer.dart';
import 'package:stepper/presentation/post_list/views/area_main_card.dart';
import 'package:stepper/presentation/post_list/views/month_section.dart';

class PostListScreen extends StatelessWidget {
  const PostListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, Area>;
    final Area area = routeArgs['area']!;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: darkPurple,
        title: Text(area.areaName),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.close),
          )
        ],
      ),
      drawer: SizedBox(
        child: MainDrawer(),
        width: screenSize.width * 0.7,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(screenMediumPadding),
            child: Column(
              children: [
                AreaMainCard(area: area),
                MonthSection(
                  goalList: goalList
                      .where((goal) => goal.areaName == area.areaName)
                      .toList(),
                  postList: postList
                      .where((post) => post.areaName == area.areaName)
                      .toList(),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: CustomFloatingButton(area: area),
    );
  }
}
