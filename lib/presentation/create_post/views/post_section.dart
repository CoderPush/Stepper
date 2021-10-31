import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stepper/common/consts.dart';
import 'package:stepper/common/palette.dart';
import 'package:stepper/presentation/create_post/cubit/create_post_cubit.dart';
import 'package:stepper/presentation/create_post/views/create_post_curved_tab_bar.dart';
import 'package:stepper/presentation/create_post/views/create_post_input.dart';
import 'package:stepper/presentation/create_post/views/create_post_action_row.dart';

class PostSection extends StatelessWidget {
  const PostSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: blueGrey,
        borderRadius: BorderRadius.circular(mediumBorderRadius),
      ),
      child: Column(
        children: [
          const CreatePostCurvedTabBar(),
          Padding(
            padding: const EdgeInsets.only(
              left: screenMediumPadding,
              top: screenMediumPadding,
              bottom: screenMediumPadding,
            ),
            child: BlocBuilder<CreatePostCubit, CreatePostState>(
              builder: (context, state) {
                final currentState = state as CreatePostLoadedState;
                return CreatePostInput(
                  mode: currentState.createPostMode,
                );
              },
            ),
          ),
          const CreatePostActionRow()
        ],
      ),
    );
  }
}
