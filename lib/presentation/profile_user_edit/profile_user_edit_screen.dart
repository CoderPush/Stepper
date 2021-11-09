import 'package:flutter/material.dart';
import 'package:stepper/common/consts.dart';
import 'package:stepper/common/numbers.dart';
import 'package:stepper/common/palette.dart';
import 'package:stepper/common/texts.dart';
import 'package:stepper/dummy_data.dart';
import 'package:stepper/presentation/profile_user_edit/views/avatar_view.dart';
import 'package:stepper/presentation/profile_user_edit/views/user_information_view.dart';
import 'package:stepper/presentation/profile_user_edit/views/user_level_view.dart';

class ProfileUserEditScreen extends StatelessWidget {
  const ProfileUserEditScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: scaffoldColor,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back_ios, color: darkGrey),
        ),
        title: const Text(account),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const AvatarView(),
            const UserInformationView(),
            UserLevelView(),
          ],
        ),
      ),
    );
  }
}
