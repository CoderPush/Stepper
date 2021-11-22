import 'package:flutter/material.dart';
import 'package:stepper/common/consts.dart';
import 'package:stepper/common/palette.dart';
import 'package:stepper/data/model/models.dart';
import 'package:stepper/config/routes/routes.dart';
import 'package:stepper/presentation/common/arguments/screen_arguments.dart';

class CustomFloatingButton extends StatelessWidget {
  final Area? area;
  const CustomFloatingButton({Key? key, this.area}) : super(key: key);

  void _onCreatePostButtonPressed(BuildContext context) {
    Navigator.of(context).pushNamed(
      RouteNames.createPost,
      arguments: CreatePostScreenArgument(
        preSelectedArea: area,
      ),
    );
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
