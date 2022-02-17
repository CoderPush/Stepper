import 'package:flutter/material.dart';
import 'package:stepper/common/consts.dart';
import 'package:stepper/common/palette.dart';
import 'package:stepper/config/routes/routes.dart';
import 'package:stepper/data/models/models.dart';
import 'package:stepper/presentation/create_post/cubit/create_post_state.dart';

class CustomFloatingButton extends StatelessWidget {
  final Area? area;
  const CustomFloatingButton({Key? key, this.area}) : super(key: key);

  void _onCreatePostButtonPressed(BuildContext context) {
    // String routeName;
    // if (area != null) {
    //   routeName = Uri(
    //     path: RouteNames.createPost,
    //     queryParameters: {'area': area!.name},
    //   ).toString();
    // } else {
    //   routeName = RouteNames.createPost;
    // }
    // Navigator.of(context).pushNamed(routeName);

    Navigator.of(context).pushNamed(RouteNames.createPost,
        arguments: CreatePostArgs(mode: CreatePostScreenMode.createNew));
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      tooltip: createPostButton,
      onPressed: () => _onCreatePostButtonPressed(context),
      elevation: 0.0,
      backgroundColor: orange,
      child: const Icon(Icons.add),
    );
  }
}
