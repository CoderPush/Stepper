import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:stepper/common/consts.dart';
import 'package:stepper/common/palette.dart';
import 'package:stepper/common/texts.dart';
import 'package:stepper/data/model/models.dart';
import 'package:stepper/presentation/utils.dart';
import 'package:stepper/config/routes/routes.dart';

class PostItem extends StatelessWidget {
  final Post post;
  final bool hasAreaName;

  const PostItem({
    Key? key,
    required this.post,
    required this.hasAreaName,
  }) : super(key: key);

  void _tapOnPostItem(BuildContext context, Post post) {
    Navigator.of(context).pushNamed(
      Uri(
        path: RouteNames.createPost,
        queryParameters: {'postId': post.postId},
      ).toString(),
    );
  }

  String _getPostTitleText() {
    if (hasAreaName) {
      return post.postedTime == null
          ? ''
          : ' ${post.postedTime!.day.toString()} ${monthNames[post.postedTime!.month - 1].substring(0, 3)} ${post.postedTime!.year}';
    } else {
      return post.postedTime == null
          ? ''
          : ' ${monthNames[post.postedTime!.month - 1]} ${post.postedTime!.year}';
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _tapOnPostItem(context, post),
      child: Container(
        padding: const EdgeInsets.all(screenMediumPadding),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(largeBorderRadius),
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
                    text: hasAreaName
                        ? post.areaName
                        : post.postedTime == null
                            ? post.areaName
                            : post.postedTime!.day.toString(),
                    style: TextStyle(
                      fontSize: largeFontSize,
                      fontWeight: FontWeight.bold,
                      color: hasAreaName
                          ? getAreaTheme(getAreaType(post.areaName))[2]
                          : textColor,
                    ),
                    children: [
                      TextSpan(
                        style: const TextStyle(
                          fontSize: smallFontSize,
                          fontWeight: FontWeight.normal,
                          color: textColor,
                        ),
                        text: _getPostTitleText(),
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
              style: const TextStyle(color: textColor),
            )
          ],
        ),
      ),
    );
  }
}
