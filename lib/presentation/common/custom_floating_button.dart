import 'package:flutter/material.dart';
import 'package:stepper/common/palette.dart';
import 'package:stepper/routes.dart';

class CustomFloatingButton extends StatelessWidget {
  const CustomFloatingButton({Key? key}) : super(key: key);

  void _onCreatePostButtonPressed(BuildContext context) {
    Navigator.of(context).pushNamed(Routes.createPost);
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      tooltip: "createPostButton",
      onPressed: () => _onCreatePostButtonPressed(context),
      elevation: 0.0,
      backgroundColor: orange,
      child: const Icon(Icons.add),
    );
  }
}
