import 'package:flutter/material.dart';
import 'package:stepper/common/consts.dart';
import 'package:stepper/data/model/models.dart';
import 'package:stepper/presentation/common/post/post_item.dart';

class PostList extends StatelessWidget {
  final List<Post> postList;
  final bool hasAreaName;

  const PostList({
    Key? key,
    required this.postList,
    required this.hasAreaName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: postList.length,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.only(top: screenMediumPadding),
        child: PostItem(
          hasAreaName: hasAreaName,
          post: postList[index],
        ),
      ),
    );
  }
}
