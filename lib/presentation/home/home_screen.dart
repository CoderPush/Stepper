import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stepper/common/consts.dart';
import 'package:stepper/common/palette.dart';
import 'package:stepper/common/texts.dart';
import 'package:stepper/enums/enums.dart';
import 'package:stepper/injection_container.dart';
import 'package:stepper/presentation/common/commons.dart';
import 'package:stepper/presentation/home/cubit/posts_cubit.dart';
import 'package:stepper/presentation/home/cubit/posts_state.dart';
import 'package:stepper/presentation/home/cubit/recent_updated_areas_cubit.dart';
import 'package:stepper/presentation/home/cubit/recent_updated_areas_state.dart';
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
            BlocProvider(
              create: (context) =>
                  RecentUpdatedAreasCubit(areaRepository: sl()),
              child:
                  BlocBuilder<RecentUpdatedAreasCubit, RecentUpdatedAreasState>(
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

                    return HorizontalAreaList(
                        areaList: state.recentUpdatedAreas);
                  }

                  return Container();
                },
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(
                screenMediumPadding,
                screenLargePadding,
                screenSmallPadding,
                screenSmallPadding,
              ),
              child: Text(
                yourPosts,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: mediumFontSize,
                ),
              ),
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
                )),
          ],
        ),
      )),
      floatingActionButton: const CustomFloatingButton(),
    );
  }
}
