import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:stepper/common/consts.dart';
import 'package:stepper/common/palette.dart';
import 'package:stepper/data/model/models.dart';
import 'package:stepper/presentation/common/commons.dart';
import 'package:stepper/presentation/common/custom_floating_button.dart';
import 'package:stepper/presentation/common/drawer/drawer.dart';
import 'package:stepper/presentation/post_list/views/area_main_card.dart';

class PostListScreen extends StatelessWidget {
  final Area area;
  const PostListScreen({
    Key? key,
    required this.area,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

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
                ValueListenableBuilder<Box<Post>>(
                  valueListenable: Hive.box<Post>('Post').listenable(),
                  builder: (context, postBox, widget) {
                    return PostList(
                      hasAreaName: false,
                      postList: postBox.values
                          .where((post) => post.areaName == area.areaName)
                          .toList()
                          .reversed
                          .toList(),
                    );
                  },
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
