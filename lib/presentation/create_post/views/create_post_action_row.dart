import 'package:flutter/material.dart';
import 'package:stepper/common/consts.dart';
import 'package:stepper/common/palette.dart';
import 'package:stepper/common/texts.dart';
import 'package:stepper/presentation/create_post/views/create_post_action_button.dart';

class CreatePostActionRow extends StatelessWidget {
  const CreatePostActionRow({Key? key}) : super(key: key);

  void onAttachFile() {}

  void onAttachPicture() {}

  void onAttachGoal() {}

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
              onPressed: () {},
              child: const Text(post),
            ),
          ),
        )
      ],
    );
  }
}
