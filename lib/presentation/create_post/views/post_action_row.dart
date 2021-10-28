import 'package:flutter/material.dart';
import 'package:stepper/common/consts.dart';
import 'package:stepper/common/palette.dart';
import 'package:stepper/common/texts.dart';

class PostActionRow extends StatelessWidget {
  const PostActionRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.attach_file,
            color: white,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.crop_original,
            color: white,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.brightness_7_outlined,
            color: white,
          ),
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
