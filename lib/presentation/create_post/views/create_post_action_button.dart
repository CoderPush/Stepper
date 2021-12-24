import 'package:flutter/material.dart';
import 'package:stepper/common/palette.dart';

class CreatePostActionButton extends StatelessWidget {
  final IconData iconData;
  final VoidCallback onTap;
  const CreatePostActionButton({
    Key? key,
    required this.iconData,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      shape: const CircleBorder(),
      clipBehavior: Clip.hardEdge,
      child: IconButton(
        onPressed: onTap,
        icon: Icon(
          iconData,
          color: actionButtonColor,
        ),
      ),
    );
  }
}
