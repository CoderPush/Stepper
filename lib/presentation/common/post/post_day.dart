import 'package:flutter/material.dart';
import 'package:stepper/common/consts.dart';
import 'package:stepper/data/model/models.dart';

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
        text: post.postedTime == null ? '' : post.postedTime!.day.toString(),
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
            text: post.postedTime == null
                ? ''
                : ' ${monthNames[post.postedTime!.month - 1]} ${post.postedTime!.year}',
          )
        ],
      ),
    );
  }
}
