import 'package:flutter/material.dart';
import 'package:stepper/common/consts.dart';
import 'package:stepper/common/palette.dart';
import 'package:stepper/presentation/create_post/views/create_post_curved_tab_bar.dart';
import 'package:stepper/presentation/create_post/views/create_post_input.dart';
import 'package:stepper/presentation/create_post/views/create_post_action_row.dart';

// TODO: change this to Stateless widget
class PostSection extends StatefulWidget {
  const PostSection({Key? key}) : super(key: key);

  @override
  State<PostSection> createState() => _PostSectionState();
}

class _PostSectionState extends State<PostSection> {
  CreatePostMode _currentPostMode = CreatePostMode.writeUpdate;
  void _updateCreatePostMode(CreatePostMode mode) {
    setState(() {
      _currentPostMode = mode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: blueGrey,
        borderRadius: BorderRadius.circular(mediumBorderRadius),
      ),
      child: Column(
        children: [
          CreatePostCurvedTabBar(updateCreatePostMode: _updateCreatePostMode),
          Padding(
            padding: const EdgeInsets.only(
              left: screenMediumPadding,
              top: screenMediumPadding,
              bottom: screenMediumPadding,
            ),
            child: CreatePostInput(mode: _currentPostMode),
          ),
          const CreatePostActionRow()
        ],
      ),
    );
  }
}

enum CreatePostMode { writeUpdate, setGoal }
