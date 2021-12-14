import 'package:flutter/material.dart';
import 'package:stepper/common/consts.dart';
import 'package:stepper/common/numbers.dart';
import 'package:stepper/common/palette.dart';

class AvatarView extends StatelessWidget {
  const AvatarView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(
            top: fortyFour,
            bottom: screenLargePadding,
          ),
          child: CircleAvatar(
            radius: fortyFour,
            backgroundColor: darkBlue,
            child: Image.asset('assets/images/avatar.png'),
          ),
        ),
      ],
    );
  }
}
