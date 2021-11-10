import 'package:flutter/material.dart';
import 'package:stepper/common/consts.dart';
import 'package:stepper/common/numbers.dart';
import 'package:stepper/common/palette.dart';
import 'package:stepper/common/texts.dart';
import 'package:stepper/dummy_data.dart';

class AvatarView extends StatelessWidget {
  const AvatarView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(top: fortyFour, bottom: sixteen),
          child: const CircleAvatar(
            radius: fortyFour,
            backgroundColor: darkGrey,
            backgroundImage: NetworkImage(avatarProfileUrl),
          ),
        ),
        Container(
          padding: const EdgeInsets.only(bottom: thirtyFour),
          child: const Text(
            changeProfilePicture,
            style: TextStyle(
              fontSize: fifteen,
              color: purple,
            ),
          ),
        ),
      ],
    );
  }
}
