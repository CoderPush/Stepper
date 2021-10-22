import 'package:flutter/material.dart';
import 'package:stepper/common/palette.dart';
import 'package:stepper/common/texts.dart';
import 'package:stepper/presentation/area/views/expertise_view.dart';
import 'package:stepper/presentation/area/views/mindset_view.dart';
import 'package:stepper/presentation/area/views/scope_view.dart';
import 'package:stepper/presentation/area/views/tabbar_item.dart';
import 'package:stepper/presentation/common/drawer/drawer.dart';

class AreaScreen extends StatelessWidget {
  const AreaScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: darkPurple,
          title: const Text(area),
          centerTitle: true,
          bottom: const TabBar(
            indicatorColor: Colors.transparent,
            tabs: [
              TabBarItem(tabBarText: scope),
              TabBarItem(tabBarText: expertise),
              TabBarItem(tabBarText: mindset),
            ],
          ),
        ),
        body: const SafeArea(
          child: TabBarView(children: [
            ScopeView(),
            ExpertiseView(),
            MindsetView(),
          ]),
        ),
        drawer: MainDrawer(),
      ),
    );
  }
}
