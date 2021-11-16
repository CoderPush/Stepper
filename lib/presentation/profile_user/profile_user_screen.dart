import 'package:flutter/material.dart';
import 'package:stepper/common/consts.dart';
import 'package:stepper/common/palette.dart';
import 'package:stepper/presentation/common/commons.dart';
import 'package:stepper/presentation/profile_user/views/avatar_view.dart';
import 'package:stepper/presentation/profile_user/views/clear_data_view.dart';
import 'package:stepper/presentation/profile_user/views/mode_view.dart';
import 'package:stepper/presentation/profile_user/views/sign_out_view.dart';

class ProfileUserScreen extends StatelessWidget {
  const ProfileUserScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      drawer: SizedBox(
        child: MainDrawer(),
        width: screenSize.width * 0.7,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Builder(builder: (context) {
                return IconButton(
                  tooltip: openDrawerButton,
                  color: darkGrey,
                  icon: const Icon(Icons.menu),
                  onPressed: () => Scaffold.of(context).openDrawer(),
                );
              }),
              const AvatarView(),
              // const BadgeView(),
              const ModeView(),
              const ClearDataView(),
              const SignOutView(),
            ],
          ),
        ),
      ),
      floatingActionButton: const CustomFloatingButton(),
    );
  }
}
