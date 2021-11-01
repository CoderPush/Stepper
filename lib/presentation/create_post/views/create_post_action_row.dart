import 'package:flutter/material.dart';
import 'package:stepper/common/consts.dart';
import 'package:stepper/common/palette.dart';
import 'package:stepper/common/texts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stepper/data/model/post.dart';
import 'package:stepper/presentation/create_post/cubit/create_post_cubit.dart';
import 'package:stepper/presentation/create_post/views/create_post_action_button.dart';
import 'package:stepper/routes.dart';

class CreatePostActionRow extends StatelessWidget {
  const CreatePostActionRow({Key? key}) : super(key: key);

  void onAttachFile() {}

  void onAttachPicture() {}

  void onAttachGoal() {}

  void onPostClick(BuildContext context) {
    final currentState =
        context.read<CreatePostCubit>().state as CreatePostLoadedState;
    if (currentState.createPostMode == CreatePostMode.writeUpdate) {
      context.read<CreatePostCubit>().onWriteUpdate();
      Navigator.of(context).pushNamed(Routes.home);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CreatePostActionButton(
          iconData: Icons.attach_file,
          onTap: onAttachFile,
        ),
        CreatePostActionButton(
          iconData: Icons.crop_original,
          onTap: onAttachPicture,
        ),
        CreatePostActionButton(
          iconData: Icons.brightness_7_outlined,
          onTap: onAttachGoal,
        ),
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(screenSmallPadding),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: purple,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(largeBorderRadius),
                ),
              ),
              onPressed: () => onPostClick(context),
              child: const Text(post),
            ),
          ),
        )
      ],
    );
  }
}
