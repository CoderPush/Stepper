import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stepper/common/consts.dart';
import 'package:stepper/common/numbers.dart';
import 'package:stepper/common/palette.dart';
import 'package:stepper/injection_container.dart';
import 'package:stepper/presentation/common/commons.dart';
import 'package:stepper/presentation/home/views/stepper_app_bar.dart';
import 'package:stepper/presentation/profile_user/cubit/user_profile_cubit.dart';
import 'package:stepper/presentation/profile_user/views/avatar_view.dart';
import 'package:stepper/presentation/profile_user/views/clear_data_view.dart';
import 'package:stepper/presentation/profile_user/views/sign_out_view.dart';
import 'package:stepper/presentation/profile_user/views/user_information_view.dart';
import 'package:stepper/presentation/profile_user/views/user_level_view.dart';
import 'package:stepper/presentation/profile_user_edit/cubit/user_profile_edit_cubit.dart';

class ProfileUserScreen extends StatelessWidget {
  const ProfileUserScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => UserProfileCubit(
            userRepository: sl(),
          ),
        ),
        BlocProvider(
          create: (context) => UserProfileEditCubit(
            professionRepository: sl(),
            bandRepository: sl(),
            userRepository: sl(),
          ),
        ),
      ],
      child: screenSize.width > maxAppWidth
          ? _largeScreenProfile(
              context: context,
              screenSize: screenSize,
              maxWidth: screenSize.width * maxAppWidthRatio,
            )
          : Scaffold(
              drawer: SizedBox(
                child: MainDrawer(),
                width: screenSize.width * 0.7,
              ),
              body: SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      _drawerButton(),
                      const AvatarView(),
                      const UserInformationView(),
                      const UserLevelView(),
                      _clearDataButton(),
                      _signOutButton(),
                    ],
                  ),
                ),
              ),
              floatingActionButton: const CustomFloatingButton(),
            ),
    );
  }

  Widget _drawerButton() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Builder(
        builder: (context) {
          return IconButton(
            tooltip: openDrawerButton,
            color: darkGrey,
            icon: const Icon(Icons.menu),
            onPressed: () => Scaffold.of(context).openDrawer(),
          );
        },
      ),
    );
  }

  Widget _clearDataButton({
    EdgeInsets padding = const EdgeInsets.all(
      screenSmallPadding,
    ),
  }) {
    return Padding(
      padding: padding,
      child: const ClearDataView(),
    );
  }

  Widget _signOutButton({
    EdgeInsets padding = const EdgeInsets.all(
      screenSmallPadding,
    ),
  }) {
    return Padding(
      padding: padding,
      child: const SignOutView(),
    );
  }

  Widget _largeScreenProfile({
    required BuildContext context,
    required Size screenSize,
    double maxWidth = maxAppWidth,
    double contentPadding = screenMediumPadding,
  }) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: SizedBox(
              width: maxWidth,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  StepperAppBar(
                    setting: StepperAppBarSetting(
                      padding: EdgeInsets.symmetric(
                        horizontal: fifty + contentPadding,
                        vertical: screenSmallPadding,
                      ),
                      onHomeClick: () {
                        Navigator.of(context).pop();
                      },
                      showProfile: false,
                    ),
                  ),
                  const AvatarView(),
                  UserInformationView(
                    margin: EdgeInsets.symmetric(
                      horizontal: fifty + contentPadding,
                    ),
                  ),
                  UserLevelView(
                    margin: EdgeInsets.symmetric(
                      horizontal: fifty + contentPadding,
                      vertical: screenMediumPadding,
                    ),
                  ),
                  _clearDataButton(),
                  _signOutButton(),
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: const CustomFloatingButton(),
    );
  }
}
