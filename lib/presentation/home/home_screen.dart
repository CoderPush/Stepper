import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stepper/common/consts.dart';
import 'package:stepper/common/numbers.dart';
import 'package:stepper/common/palette.dart';
import 'package:stepper/common/texts.dart';
import 'package:stepper/data/models/area.dart';
import 'package:stepper/data/models/post.dart';
import 'package:stepper/enums/enums.dart';
import 'package:stepper/injection_container.dart';
import 'package:stepper/presentation/common/commons.dart';
import 'package:stepper/presentation/home/cubit/posts_cubit.dart';
import 'package:stepper/presentation/home/cubit/posts_state.dart';
import 'package:stepper/presentation/home/cubit/recent_updated_areas_cubit.dart';
import 'package:stepper/presentation/home/cubit/recent_updated_areas_state.dart';
import 'package:stepper/presentation/home/views/horizontal_area_list.dart';
import 'package:stepper/presentation/home/views/horizontal_areas_page_viewer.dart';
import 'package:stepper/presentation/home/views/stepper_app_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    if (screenSize.width > maxAppWidth) {
      return _largeScreenHome(
        screenSize: screenSize,
        maxWidth: screenSize.width * maxAppWidthRatio,
      );
    }

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
                  tooltip: openDrawerButton,
                  color: darkGrey,
                  icon: const Icon(Icons.menu),
                  onPressed: () => Scaffold.of(context).openDrawer(),
                );
              }),
              _recentlyUpdatedText(),
              _recentlyAreas(
                screenSize: screenSize,
                areaWidget: (areas) {
                  return HorizontalAreaList(
                    areaList: areas,
                  );
                },
              ),
              _yourPostText(),
              _yourPosts(
                postWidget: (posts) {
                  return PostList(
                    hasAreaName: true,
                    postList: posts,
                  );
                },
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(
                  screenMediumPadding,
                  screenSmallPadding,
                  screenMediumPadding,
                  screenMediumPadding,
                ),
                child: BlocProvider(
                  create: (context) => PostsCubit(postRepository: sl()),
                  child: BlocBuilder<PostsCubit, PostsState>(
                      builder: (context, state) {
                    if (state.status == StateStatus.loading) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    if (state.status == StateStatus.success) {
                      if (state.posts.isEmpty) {
                        return const Center(
                          child: Text(noPost),
                        );
                      }

                      return PostList(
                        hasAreaName: true,
                        postList: state.posts,
                      );
                    }

                    return Container();
                  }),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: const CustomFloatingButton(),
    );
  }

  Widget _recentlyUpdatedText({
    EdgeInsets padding = const EdgeInsets.only(
      left: screenMediumPadding,
      bottom: screenSmallPadding,
      top: screenMediumPadding,
    ),
  }) {
    return Padding(
      padding: padding,
      child: const Text(
        recentlyUpdated,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: mediumFontSize,
        ),
      ),
    );
  }

  Widget _recentlyAreas({
    required Size screenSize,
    required Function(List<Area>) areaWidget,
  }) {
    return BlocProvider(
      create: (context) => RecentUpdatedAreasCubit(areaRepository: sl()),
      child: BlocBuilder<RecentUpdatedAreasCubit, RecentUpdatedAreasState>(
        builder: (context, state) {
          if (state.status == StateStatus.loading) {
            return SizedBox(
              height: screenSize.height * 0.1,
              child: const Padding(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
                padding: EdgeInsets.all(screenMediumPadding),
              ),
            );
          }

          if (state.status == StateStatus.success) {
            if (state.recentUpdatedAreas.isEmpty) {
              return SizedBox(
                height: screenSize.height * 0.1,
                child: const Padding(
                  padding: EdgeInsets.all(screenMediumPadding),
                  child: Text(noUpdate),
                ),
              );
            }

            return areaWidget(state.recentUpdatedAreas);
          }

          return Container();
        },
      ),
    );
  }

  Widget _yourPostText({
    EdgeInsets padding = const EdgeInsets.fromLTRB(
      screenMediumPadding,
      screenLargePadding,
      screenSmallPadding,
      screenSmallPadding,
    ),
  }) {
    return Padding(
      padding: padding,
      child: const Text(
        yourPosts,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: mediumFontSize,
        ),
      ),
    );
  }

  Widget _yourPosts({
    EdgeInsets padding = const EdgeInsets.fromLTRB(
      screenMediumPadding,
      screenSmallPadding,
      screenMediumPadding,
      screenMediumPadding,
    ),
    required Function(List<Post>) postWidget,
  }) {
    return Padding(
      padding: padding,
      child: BlocProvider(
        create: (context) => PostsCubit(postRepository: sl()),
        child: BlocBuilder<PostsCubit, PostsState>(builder: (context, state) {
          if (state.status == StateStatus.loading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state.status == StateStatus.success) {
            if (state.posts.isEmpty) {
              return const Center(
                child: Text(noPost),
              );
            }

            return postWidget(state.posts);
          }

          return Container();
        }),
      ),
    );
  }

  Widget _largeScreenHome({
    required Size screenSize,
    double maxWidth = maxAppWidth,
    double iconControllerSize = fifty,
    double contentPadding = screenMediumPadding,
  }) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: SizedBox(
              width: maxWidth,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  StepperAppBar(
                    padding: EdgeInsets.symmetric(
                      horizontal: iconControllerSize + contentPadding,
                      vertical: screenSmallPadding,
                    ),
                  ),
                  _recentlyUpdatedText(
                    padding: EdgeInsets.symmetric(
                      horizontal: iconControllerSize + contentPadding,
                      vertical: screenSmallPadding,
                    ),
                  ),
                  _recentlyAreas(
                    screenSize: screenSize,
                    areaWidget: (areas) {
                      List<AreasPageData> list = [];

                      int i = 0;
                      do {
                        int minRange = min(areas.length, i + 3);

                        List<Area> l = areas.sublist(i, minRange);
                        AreasPageData data = AreasPageData(list: l);
                        list.add(data);
                        i += 3;
                      } while (i < areas.length);

                      return HorizontalAreasPageViewer(
                        data: list,
                        setting: HorizontalAreasPageViewerSetting(
                          iconSize: iconControllerSize,
                        ),
                      );
                    },
                  ),
                  _yourPostText(
                    padding: EdgeInsets.symmetric(
                      horizontal: iconControllerSize + contentPadding,
                      vertical: screenSmallPadding,
                    ),
                  ),
                  _yourPosts(
                    padding: EdgeInsets.symmetric(
                      horizontal: iconControllerSize + contentPadding,
                      vertical: screenSmallPadding,
                    ),
                    postWidget: (posts) {
                      return PostList(
                        hasAreaName: true,
                        postList: posts,
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: const CustomFloatingButton(),
    );
  }
}
