import 'package:flutter/material.dart';
import 'package:stepper/common/consts.dart';
import 'package:stepper/common/numbers.dart';
import 'package:stepper/common/palette.dart';
import 'package:stepper/dummy_data.dart';
import 'package:stepper/presentation/profile_user/views/label_view.dart';
import 'package:stepper/routes.dart';

class AvatarView extends StatelessWidget {
  const AvatarView({Key? key}) : super(key: key);

  void _onProfileUserEditScreenTap(BuildContext context) {
    Navigator.pushNamed(context, Routes.profileUserEdit);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.only(top: fortyFour),
          child: const CircleAvatar(
            radius: fortyFour,
            backgroundColor: darkGrey,
            backgroundImage: NetworkImage(avatarProfileUrl),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(bottom: eighteen),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'John Doe',
                style: TextStyle(
                  fontSize: seventeen,
                  color: white,
                ),
              ),
              IconButton(
                onPressed: () => _onProfileUserEditScreenTap(context),
                icon: const Icon(
                  Icons.arrow_forward_ios,
                  color: darkGrey,
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.only(bottom: fifty),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const LabelView(
                  labelText: 'Software Engineer 1', labelWidth: oneHundredSixty),
              Container(
                height: four,
                width: four,
                margin: const EdgeInsets.only(left: twelve, right: twelve),
                decoration: BoxDecoration(
                    color: sliderInactiveColor,
                    borderRadius: BorderRadius.circular(largeBorderRadius)),
              ),
              const LabelView(labelText: 'Band 1', labelWidth: seventy),
            ],
          ),
        ),
      ],
    );
  }
}
