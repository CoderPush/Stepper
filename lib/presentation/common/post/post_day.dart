import 'package:flutter/material.dart';
import 'package:stepper/common/consts.dart';
import 'package:stepper/data/models/models.dart';

class PostDay extends StatelessWidget {
  final Post post;
  const PostDay({
    Key? key,
    required this.post,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: post.updatedAt == null ? '' : post.updatedAt!.day.toString(),
        style: const TextStyle(
          fontSize: largeFontSize,
          fontWeight: FontWeight.bold,
        ),
        children: [
          TextSpan(
            style: const TextStyle(
              fontSize: smallFontSize,
              fontWeight: FontWeight.normal,
            ),
            text: post.updatedAt == null
                ? ''
                : ' ${monthNames[post.updatedAt!.month - 1]} ${post.updatedAt!.year}',
          )
        ],
      ),
    );
  }
}
