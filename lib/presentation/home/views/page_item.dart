import 'package:flutter/material.dart';
import 'package:stepper/common/consts.dart';

class PageItem extends StatelessWidget {
  final PageData pageData;

  const PageItem({
    Key? key,
    required this.pageData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: pageData.onClick,
      child: Padding(
        padding: const EdgeInsets.all(screenMediumPadding),
        child: Text(
          pageData.title,
        ),
      ),
    );
  }
}

class PageData {
  String title;
  Function()? onClick;

  PageData({
    required this.title,
    this.onClick,
  });
}
