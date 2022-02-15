import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:stepper/common/consts.dart';
import 'package:stepper/common/palette.dart';
import 'package:stepper/common/texts.dart';
import 'package:stepper/data/model2/models2.dart';
import 'package:stepper/presentation/create_post/cubit/create_post_state_2.dart';
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
    // Navigator.of(context).pushNamed(
    //   Uri(
    //     path: RouteNames.createPost,
    //     queryParameters: {'postId': post.id},
    //   ).toString(),
    // );
    Navigator.of(context).pushNamed(RouteNames.createPost,
        arguments: CreatePostArgs(mode: CreatePostScreenMode.edit, post: post));
  }

  String _getPostTitleText() {
    if (hasAreaName) {
      return post.updatedAt == null
          ? ''
          : ' ${post.updatedAt!.day.toString()} ${monthNames[post.updatedAt!.month - 1].substring(0, 3)} ${post.updatedAt!.year}';
    } else {
      return post.updatedAt == null
          ? ''
          : ' ${monthNames[post.updatedAt!.month - 1]} ${post.updatedAt!.year}';
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
                        ? post.area.name
                        : post.updatedAt == null
                            ? post.area.name
                            : post.updatedAt!.day.toString(),
                    style: TextStyle(
                      fontSize: largeFontSize,
                      fontWeight: FontWeight.bold,
                      color: hasAreaName
                          ? getAreaTheme(post.area.type)[2]
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
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      post.status.name,
                      style: const TextStyle(fontSize: smallFontSize),
                    ),
                    const Icon(
                      Icons.more_vert,
                      color: moreIconColor,
                    ),
                  ],
                ),
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
            ),
            post.imgUrl != null
                ? Container(
                    height: 150.0,
                    width: double.infinity,
                    padding: const EdgeInsets.only(top: screenMediumPadding),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(
                          Radius.circular(mediumBorderRadius)),
                      child: Image(
                        image: NetworkImage(post.imgUrl!),
                        fit: BoxFit.cover,
                      ),
                    ),
                  )
                : const SizedBox.shrink()
          ],
        ),
      ),
    );
  }
}
