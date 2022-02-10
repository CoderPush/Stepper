import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stepper/common/consts.dart';
import 'package:stepper/common/palette.dart';
import 'package:stepper/common/texts.dart';
import 'package:stepper/data/model2/models2.dart';
import 'package:stepper/enums/enums.dart';
import 'package:stepper/injection_container.dart';
import 'package:stepper/presentation/area/cubit/areas_cubit_2.dart';
import 'package:stepper/presentation/area/cubit/areas_state_2.dart';
import 'package:stepper/presentation/area/views/area_list.dart';
import 'package:stepper/presentation/area/views/tabbar_item.dart';
import 'package:stepper/presentation/common/drawer/drawer.dart';

class AreaScreen extends StatelessWidget {
  const AreaScreen({Key? key}) : super(key: key);

  Widget _buildLoadingState() {
    return const Center(child: CircularProgressIndicator());
  }

  Widget buildAreasTab(AreasState state, {int? index}) {
    if (AreaType.values.indexOf(state.selectedAreaType) != index) {
      return _buildLoadingState();
    }

    if (state.fetchingStatus == StateStatus.loading) {
      return _buildLoadingState();
    }
    if (state.fetchingStatus == StateStatus.failure) {
      return const Text('Error loading scope area');
    }

    if (state.fetchingStatus == StateStatus.success) {
      return AreaList(areaList: state.areas);
    }

    return _buildLoadingState();
  }

  onSelectAreaType(BuildContext context, {int? index}) {
    switch (index) {
      case 0:
        context.read<AreasCubit>().onSelectAreaType(areaType: AreaType.scope);
        break;
      case 1:
        context
            .read<AreasCubit>()
            .onSelectAreaType(areaType: AreaType.expertise);
        break;
      case 2:
        context.read<AreasCubit>().onSelectAreaType(areaType: AreaType.mindset);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          AreasCubit(areaRepository: sl(), userRepository: sl()),
      child: Builder(builder: (context) {
        return DefaultTabController(
          length: 3,
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: darkPurple,
              title: const Text(area),
              centerTitle: true,
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(kToolbarHeight),
                child: BlocBuilder<AreasCubit, AreasState>(
                  builder: (context, state) => TabBar(
                    labelPadding: const EdgeInsets.all(0.0),
                    onTap: (int index) =>
                        onSelectAreaType(context, index: index),
                    indicatorColor: Colors.transparent,
                    tabs: [
                      Padding(
                        padding:
                            const EdgeInsets.only(left: screenMediumPadding),
                        child: TabBarItem(
                          tabBarText: scope,
                          isSelected: state.selectedAreaType == AreaType.scope,
                        ),
                      ),
                      TabBarItem(
                        tabBarText: expertise,
                        isSelected:
                            state.selectedAreaType == AreaType.expertise,
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(right: screenMediumPadding),
                        child: TabBarItem(
                          tabBarText: mindset,
                          isSelected:
                              state.selectedAreaType == AreaType.mindset,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            body: SafeArea(
              child: BlocBuilder<AreasCubit, AreasState>(
                builder: (context, state) => TabBarView(
                    physics: const NeverScrollableScrollPhysics(),
                    children: List.generate(
                        3, (index) => buildAreasTab(state, index: index))),
              ),
            ),
            drawer: MainDrawer(),
          ),
        );
      }),
    );
  }
}
