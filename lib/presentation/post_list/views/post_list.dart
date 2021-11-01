import 'package:flutter/material.dart';
import 'package:stepper/common/consts.dart';
import 'package:stepper/data/model/models.dart';
import 'package:stepper/presentation/post_list/views/post_item.dart';

class PostList extends StatelessWidget {
  final List<Post> postList;
  const PostList({
    Key? key,
    required this.postList,
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
          post: postList[index],
        ),
      ),
    );
  }
}
