import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stepper/common/consts.dart';
import 'package:stepper/common/palette.dart';
import 'package:stepper/data/model/models.dart';
import 'package:stepper/injection_container.dart';
import 'package:stepper/presentation/common/commons.dart';
import 'package:stepper/presentation/post_list/cubit/post_list_cubit.dart';
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
      create: (context) => PostListCubit(postRepository: sl(), area: area),
      child: Scaffold(
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
                  BlocBuilder<PostListCubit, PostListState>(
                    builder: (context, state) {
                      if (state is PostListLoadingState) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (state is PostListLoadedState) {
                        return PostList(
                            hasAreaName: false, postList: state.postList);
                      } else if (state is PostListErrorState) {
                        return Text(state.errorMessage);
                      } else {
                        return Container();
                      }
                    },
                  )
                ],
              ),
            ),
          ),
        ),
        floatingActionButton: CustomFloatingButton(area: area),
      ),
    );
  }
}
