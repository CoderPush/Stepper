import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:stepper/common/consts.dart';
import 'package:stepper/common/palette.dart';
import 'package:stepper/common/texts.dart';
import 'package:stepper/data/model/models.dart';

class PostItem extends StatelessWidget {
  final Post post;
  const PostItem({
    Key? key,
    required this.post,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(screenMediumPadding),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(mediumBorderRadius),
        color: blueGrey,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RichText(
                text: TextSpan(
                  text: post.postedTime.day.toString(),
                  style: const TextStyle(
                    color: white,
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
            style: const TextStyle(color: white),
            trimLines: 4,
            trimMode: TrimMode.Line,
            colorClickableText: seeMoreTextColor,
            trimCollapsedText: seeMore,
            trimExpandedText: seeLess,
          )
        ],
      ),
    );
  }
}
