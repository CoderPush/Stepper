import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:stepper/common/consts.dart';
import 'package:stepper/common/palette.dart';
import 'package:stepper/common/texts.dart';
import 'package:stepper/data/model/models.dart';
import 'package:stepper/routes.dart';

class PostItem extends StatelessWidget {
  final Post post;
  const PostItem({
    Key? key,
    required this.post,
  }) : super(key: key);

  void _tapOnPostItem(BuildContext context, Post post) {
    Navigator.pushNamed(
      context,
      Routes.postDetail,
      arguments: {'post': post},
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _tapOnPostItem(context, post),
      child: Container(
        padding: const EdgeInsets.all(screenMediumPadding),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(mediumBorderRadius),
          color: blueGrey,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                  text: TextSpan(
                    text: post.postedTime.day.toString(),
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
                        text:
                            ' ${monthNames[post.postedTime.month - 1]} ${post.postedTime.year}',
                      )
                    ],
                  ),
                ),
                const Icon(
                  Icons.more_vert,
                  color: moreIconColor,
                )
              ],
            ),
            const SizedBox(height: screenExtraSmallPadding),
            ReadMoreText(
              post.description,
              trimLines: 4,
              trimMode: TrimMode.Line,
              colorClickableText: seeMoreTextColor,
              trimCollapsedText: seeMore,
              trimExpandedText: seeLess,
            )
          ],
        ),
      ),
    );
  }
}
