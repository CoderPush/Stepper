import 'package:flutter/material.dart';
import 'package:stepper/common/consts.dart';
import 'package:stepper/common/numbers.dart';
import 'package:stepper/common/palette.dart';
import 'package:stepper/presentation/profile_user/views/badge_list_view.dart';

class BadgeView extends StatelessWidget {
  const BadgeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Container(
      margin: const EdgeInsets.only(
        left: twenty,
        right: twenty,
        bottom: twenty,
      ),
      padding: const EdgeInsets.symmetric(
        vertical: sixteen,
        horizontal: twelve,
      ),
      height: screenSize.width * 0.30,
      width: double.infinity,
      decoration: BoxDecoration(
        color: blueGrey,
        borderRadius: BorderRadius.circular(largeBorderRadius),
      ),
      child: Column(
        children: [
          Container(
            alignment: Alignment.topLeft,
            margin: const EdgeInsets.only(bottom: twentyOne),
            child: const Text(
              'My Badge',
              style: TextStyle(color: textColor, fontSize: seventeen),
            ),
          ),
          const BadgeListView(),
        ],
      ),
    );
  }
}
