import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stepper/common/consts.dart';
import 'package:stepper/common/palette.dart';
import 'package:stepper/common/texts.dart';
import 'package:stepper/injection_container.dart';
import 'package:stepper/presentation/common/commons.dart';
import 'package:stepper/presentation/create_post/cubit/create_post_cubit.dart';
import 'package:stepper/presentation/create_post/cubit/create_post_state.dart';
import 'package:stepper/presentation/create_post/views/area_section.dart';
import 'package:stepper/presentation/create_post/views/get_scroll_controller.dart';
import 'package:stepper/presentation/create_post/views/post_section.dart';
import 'package:stepper/presentation/create_post/views/tab_row.dart';

class CreatePostScreen extends StatelessWidget {
  const CreatePostScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as CreatePostArgs;

    return BlocProvider(
      create: (context) => CreatePostCubit(
          areaRepository: sl(),
          postRepository: sl(),
          bandRepository: sl(),
          userRepository: sl(),
          args: args),
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: BlocBuilder<CreatePostCubit, CreatePostState>(
            builder: (context, state) {
          if (!state.ready) {
            return const Scaffold(
                body: Center(child: CircularProgressIndicator()));
          }
          if (state.ready) {
            return Scaffold(
              appBar: AppBar(
                backgroundColor: scaffoldColor,
                leading: IconButton(
                  tooltip: "createPostBackButton",
                  onPressed: () {
                    Navigator.of(context).pop();
                    context
                        .read<DrawerCubit>()
                        .selectDrawerItem(DrawerType.home);
                  },
                  icon: const Icon(Icons.close),
                ),
                title: Text(state.mode == CreatePostScreenMode.createNew
                    ? createPost
                    : writeUpdate),
                centerTitle: true,
                actions: [
                  CustomDropdown(
                      disabled: state.mode == CreatePostScreenMode.edit,
                      disableHintText: state.selectedBand.name,
                      value: state.selectedBand.name,
                      onChanged: (String bandName) {
                        context.read<CreatePostCubit>().onBandChanged(bandName);
                      },
                      items: state.bands.map((band) => band.name).toList()),
                ],
              ),
              body: Padding(
                padding: const EdgeInsets.only(
                  left: screenMediumPadding,
                  right: screenMediumPadding,
                  bottom: screenMediumPadding,
                ),
                child: GetScrollController(
                  child: Builder(builder: (BuildContext innerContext) {
                    return CustomScrollView(
                      controller:
                          GetScrollController.of(innerContext).scrollController,
                      slivers: const [
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
                    );
                  }),
                ),
              ),
            );
            // }
          }
          return const Scaffold();
        }),
      ),
    );
  }
}
