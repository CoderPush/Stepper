import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stepper/common/consts.dart';
import 'package:stepper/common/palette.dart';

import 'package:stepper/data/model2/models2.dart';
import 'package:stepper/enums/enums.dart';
import 'package:stepper/injection_container.dart';
import 'package:stepper/presentation/common/commons.dart';
import 'package:stepper/presentation/post_list/cubit/post_list_cubit_2.dart';
import 'package:stepper/presentation/post_list/cubit/post_list_state_2.dart';
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

    return BlocProvider(
      create: (context) =>
          PostsListCubit(postRepository: sl(), selectedArea: area),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: darkPurple,
          title: Text(area.name),
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
          child: CustomScrollView(slivers: [
            SliverFillRemaining(
              child: Padding(
                padding: const EdgeInsets.all(screenMediumPadding),
                child: Column(
                  children: [
                    AreaMainCard(area: area),
                    BlocBuilder<PostsListCubit, PostsListState>(
                      builder: (context, state) {
                        if (state.fetchingStatus == StateStatus.loading) {
                          return const Expanded(
                              child:
                                  Center(child: CircularProgressIndicator()));
                        }

                        if (state.fetchingStatus == StateStatus.success) {
                          if (state.posts.isEmpty) {
                            return const Expanded(
                                child: Center(child: Text("No posts yet")));
                          }
                          return PostList(
                              hasAreaName: false, postList: state.posts);
                        }

                        if (state.fetchingStatus == StateStatus.failure) {
                          return const Text("Error");
                        }

                        return Container();
                      },
                    )
                  ],
                ),
              ),
            )
          ]),
        ),
        floatingActionButton: CustomFloatingButton(area: area),
      ),
    );
  }
}
