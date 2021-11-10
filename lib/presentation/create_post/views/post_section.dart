import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stepper/common/consts.dart';
import 'package:stepper/common/palette.dart';
import 'package:stepper/data/model/post.dart';
import 'package:stepper/presentation/create_post/cubit/create_post_cubit.dart';
import 'package:stepper/presentation/create_post/views/create_post_curved_tab_bar.dart';
import 'package:stepper/presentation/create_post/views/set_goal_view.dart';
import 'package:stepper/presentation/create_post/views/write_update_view.dart';

class PostSection extends StatelessWidget {
  const PostSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: blueGrey,
        borderRadius: BorderRadius.circular(mediumBorderRadius),
      ),
      child: BlocBuilder<CreatePostCubit, CreatePostState>(
        builder: (context, state) {
          final currentState = state as CreatePostLoadedState;
          return Column(
            children: [
              const CreatePostCurvedTabBar(),
              Padding(
                padding: const EdgeInsets.only(
                  left: screenMediumPadding,
                  top: screenMediumPadding,
                  bottom: screenMediumPadding,
                  right: screenMediumPadding,
                ),
                child: currentState.createPostMode == CreatePostMode.writeUpdate
                    ? WriteUpdateView(
                        initialPostDescription:
                            currentState.draftPost?.description,
                      )
                    : const SetGoalView(),
              ),
            ],
          );
        },
      ),
    );
  }
}
