import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stepper/common/consts.dart';
import 'package:stepper/common/palette.dart';
import 'package:stepper/common/texts.dart';
import 'package:stepper/injection_container.dart';
import 'package:stepper/presentation/common/arguments/screen_arguments.dart';
import 'package:stepper/presentation/common/commons.dart';
import 'package:stepper/presentation/common/drawer/cubit/drawer_cubit.dart';
import 'package:stepper/presentation/create_post/cubit/create_post_cubit.dart';
import 'package:stepper/presentation/create_post/views/area_section.dart';
import 'package:stepper/presentation/create_post/views/post_section.dart';
import 'package:stepper/presentation/create_post/views/tab_row.dart';
import 'package:stepper/config/routes/routes.dart';

class CreatePostScreen extends StatelessWidget {
  final CreatePostScreenArgument argument;
  const CreatePostScreen({
    Key? key,
    required this.argument,
  }) : super(key: key);

  void _onBandChange(BuildContext context, String bandName) {
    context.read<CreatePostCubit>().onBandChange(bandName);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CreatePostCubit(
        areaRepository: sl(),
        postRepository: sl(),
        goalRepository: sl(),
        bandRepository: sl(),
        createPostScreenArgument: argument,
      ),
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: BlocBuilder<CreatePostCubit, CreatePostState>(
          builder: (context, state) {
            if (state is CreatePostLoadingState) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is CreatePostLoadedState) {
              return Scaffold(
                appBar: AppBar(
                  backgroundColor: scaffoldColor,
                  leading: IconButton(
                    tooltip: "createPostBackButton",
                    onPressed: () {
                      Navigator.pushNamed(context, RouteNames.home);
                      context
                          .read<DrawerCubit>()
                          .selectDrawerItem(DrawerType.home);
                    },
                    icon: const Icon(Icons.close),
                  ),
                  title: const Text(createPost),
                  centerTitle: true,
                  actions: [
                    DropdownButtonHideUnderline(
                      child: CustomDropdownButton<String>(
                        dropdownColor: dropdownButtonColor,
                        value: state.selectedBandName,
                        onChanged: (bandName) {
                          _onBandChange(context, bandName);
                        },
                        items: state.bandList
                            .map((band) => DropdownMenuItem(
                                  child: Text(band),
                                  value: band,
                                ))
                            .toList(),
                      ),
                    )
                  ],
                ),
                body: const Padding(
                  padding: EdgeInsets.only(
                    left: screenMediumPadding,
                    right: screenMediumPadding,
                    bottom: screenMediumPadding,
                  ),
                  child: CustomScrollView(
                    slivers: [
                      SliverList(
                        delegate: SliverChildListDelegate.fixed(
                          [
                            SizedBox(height: screenMediumPadding),
                            TabRow(),
                            SizedBox(height: screenMediumPadding),
                            AreaSection(),
                            SizedBox(height: screenMediumPadding),
                          ],
                        ),
                      ),
                      SliverFillRemaining(
                        child: PostSection(),
                        hasScrollBody: false,
                      )
                    ],
                  ),
                ),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
