import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:stepper/common/consts.dart';
import 'package:stepper/common/palette.dart';
import 'package:stepper/common/texts.dart';
import 'package:stepper/data/model/models.dart';
import 'package:stepper/injection_container.dart';
import 'package:stepper/presentation/common/custom_floating_button.dart';
import 'package:stepper/presentation/common/drawer/drawer.dart';
import 'package:stepper/presentation/common/commons.dart';
import 'package:stepper/presentation/home/cubit/home_cubit.dart';
import 'package:stepper/presentation/home/views/horizontal_area_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return BlocProvider(
      create: (context) => HomeCubit(
        areaRepository: sl(),
        goalRepository: sl(),
      ),
      child: Scaffold(
        drawer: SizedBox(
          child: MainDrawer(),
          width: screenSize.width * 0.7,
        ),
        body: SafeArea(
          child: BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              if (state is HomeLoadingState) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is HomeLoadedState) {
                return SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Builder(builder: (context) {
                        return IconButton(
                          tooltip: openDrawerButton,
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
                      HorizontalAreaList(areaList: state.recentlyUpdatedAreas),
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
                        child: ValueListenableBuilder<Box<Goal>>(
                          valueListenable: Hive.box<Goal>('Goal').listenable(),
                          builder: (context, goalBox, widget) {
                            return GoalList(
                              goalList: goalBox.values
                                  .where((goal) => goal.isPrioritized)
                                  .toList(),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                );
              } else if (state is HomeErrorState) {
                return Text(state.errorMessage);
              } else {
                return Container();
              }
            },
          ),
        ),
        floatingActionButton: const CustomFloatingButton(),
      ),
    );
  }
}
