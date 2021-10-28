import 'package:flutter/material.dart';
import 'package:stepper/common/consts.dart';
import 'package:stepper/common/palette.dart';
import 'package:stepper/common/texts.dart';
import 'package:stepper/presentation/create_post/views/create_post_curved_tab_bar.dart';
import 'package:stepper/presentation/create_post/views/post_action_row.dart';

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
            padding: const EdgeInsets.symmetric(
              horizontal: screenMediumPadding,
            ),
            child: TextFormField(
              maxLines: 12,
              minLines: 10,
              decoration: const InputDecoration(
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                hintText: writeUpdateHint,
                hintStyle: TextStyle(color: mediumGrey),
              ),
            ),
          ),
          const PostActionRow()
        ],
      ),
    );
  }
}
