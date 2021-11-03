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
  final CreatePostMode createPostMode;
  const CreatePostActionRow({
    Key? key,
    required this.createPostMode,
  }) : super(key: key);

  void onAttachFile() {}

  void onAttachPicture() {}

  void onAttachGoal() {}

  void onPostClick(BuildContext context) async {
    await context.read<CreatePostCubit>().onCreatePost();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        createPostMode == CreatePostMode.writeUpdate
            ? CreatePostActionButton(
                iconData: Icons.attach_file,
                onTap: onAttachFile,
              )
            : const SizedBox.shrink(),
        createPostMode == CreatePostMode.writeUpdate
            ? CreatePostActionButton(
                iconData: Icons.crop_original,
                onTap: onAttachPicture,
              )
            : const SizedBox.shrink(),
        createPostMode == CreatePostMode.writeUpdate
            ? CreatePostActionButton(
                iconData: Icons.brightness_7_outlined,
                onTap: onAttachGoal,
              )
            : const SizedBox.shrink(),
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(screenSmallPadding),
            child: BlocListener<CreatePostCubit, CreatePostState>(
              listener: (context, state) {
                if (state is CreateUpdateSuccessState) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text(writeUpdateSucceed)),
                  );
                  Navigator.of(context).pushReplacementNamed(Routes.home);
                } else if (state is CreateGoalSuccessState) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text(setGoalSucceed)),
                  );
                  Navigator.of(context).pushReplacementNamed(Routes.home);
                } else if (state is CreatePostErrorState) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(state.errorMessage)),
                  );
                }
              },
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
          ),
        )
      ],
    );
  }
}
