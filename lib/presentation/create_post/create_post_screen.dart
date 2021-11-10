import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stepper/common/consts.dart';
import 'package:stepper/common/palette.dart';
import 'package:stepper/common/texts.dart';
import 'package:stepper/data/model/models.dart';
import 'package:stepper/injection_container.dart';
import 'package:stepper/presentation/create_post/cubit/create_post_cubit.dart';
import 'package:stepper/presentation/create_post/views/area_section.dart';
import 'package:stepper/presentation/create_post/views/post_section.dart';
import 'package:stepper/presentation/create_post/views/tab_row.dart';

class CreatePostScreen extends StatelessWidget {
  const CreatePostScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, Area?>;
    return BlocProvider(
      create: (context) => CreatePostCubit(
        areaRepository: sl(),
        postRepository: sl(),
        goalRepository: sl(),
        preSelectedArea: routeArgs['area'],
      ),
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: scaffoldColor,
            leading: IconButton(
              tooltip: "createPostBackButton",
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.close),
            ),
            title: const Text(createPost),
            centerTitle: true,
          ),
          body: Padding(
            padding: const EdgeInsets.only(
              left: screenMediumPadding,
              right: screenMediumPadding,
              bottom: screenMediumPadding,
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const TabRow(),
                  BlocBuilder<CreatePostCubit, CreatePostState>(
                      builder: (context, state) {
                    if (state is CreatePostLoadingState) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is CreatePostLoadedState) {
                      return Column(
                        children: const [
                          SizedBox(height: screenMediumPadding),
                          AreaSection(),
                          SizedBox(height: screenMediumPadding),
                          PostSection(),
                        ],
                      );
                    } else if (state is CreatePostErrorState) {
                      return Text(state.errorMessage);
                    }
                    return Container();
                  }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
