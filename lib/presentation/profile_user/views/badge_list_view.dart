import 'package:flutter/material.dart';
import 'package:stepper/presentation/profile_user/views/badge_item_view.dart';

class BadgeListView extends StatelessWidget {
  const BadgeListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return SizedBox(
      height: screenSize.width * 0.11,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return const BadgeItemView();
        },
      ),
    );
  }
}
