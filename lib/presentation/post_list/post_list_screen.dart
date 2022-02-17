import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stepper/common/consts.dart';
import 'package:stepper/common/palette.dart';

import 'package:stepper/data/models/models.dart';
import 'package:stepper/enums/enums.dart';
import 'package:stepper/injection_container.dart';
import 'package:stepper/presentation/common/commons.dart';
import 'package:stepper/presentation/post_list/cubit/post_list_cubit.dart';
import 'package:stepper/presentation/post_list/cubit/post_list_state.dart';
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
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: screenMediumPadding),
            child: CustomScrollView(slivers: [
              SliverList(
                delegate: SliverChildListDelegate.fixed(
                  [
                    Padding(
                      padding: const EdgeInsets.only(top: screenMediumPadding),
                      child: AreaMainCard(area: area),
                    ),
                  ],
                ),
              ),
              SliverFillRemaining(
                child: BlocBuilder<PostsListCubit, PostsListState>(
                  builder: (context, state) {
                    if (state.fetchingStatus == StateStatus.loading) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    if (state.fetchingStatus == StateStatus.success) {
                      if (state.posts.isEmpty) {
                        return const Center(child: Text("No posts yet"));
                      }
                      return PostList(
                          hasAreaName: false, postList: state.posts);
                    }

                    if (state.fetchingStatus == StateStatus.failure) {
                      return const Text("Error");
                    }

                    return Container();
                  },
                ),
              )
            ]),
          ),
        ),
        floatingActionButton: CustomFloatingButton(area: area),
      ),
    );
  }
}
