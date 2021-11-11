import 'package:flutter/material.dart';
import 'package:stepper/common/consts.dart';
import 'package:stepper/common/numbers.dart';
import 'package:stepper/common/palette.dart';
import 'package:stepper/common/texts.dart';
import 'package:stepper/presentation/profile_user_edit/views/row_information_view.dart';

class UserInformationView extends StatelessWidget {
  const UserInformationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        left: twenty,
        right: twenty,
        bottom: twenty,
      ),
      padding: const EdgeInsets.symmetric(
        vertical: sixteen,
        horizontal: twenty,
      ),
      width: double.infinity,
      decoration: BoxDecoration(
        color: blueGrey,
        borderRadius: BorderRadius.circular(largeBorderRadius),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          RowInformationView(firstText: name, secondText: johnDoe),
          SizedBox(height: twenty),
          RowInformationView(firstText: email, secondText: johnDoeEmail),
        ],
      ),
    );
  }
}
