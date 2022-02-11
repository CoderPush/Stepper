import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stepper/common/consts.dart';
import 'package:stepper/common/palette.dart';
import 'package:stepper/injection_container.dart';
import 'package:stepper/presentation/common/commons.dart';
import 'package:stepper/presentation/profile_user/cubit/user_profile_cubit.dart';
import 'package:stepper/presentation/profile_user/views/avatar_view.dart';
import 'package:stepper/presentation/profile_user/views/clear_data_view.dart';
import 'package:stepper/presentation/profile_user/views/sign_out_view.dart';

class ProfileUserScreen extends StatelessWidget {
  const ProfileUserScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return BlocProvider(
      create: (context) => UserProfileCubit(
        userRepository: sl(),
      ),
      child: Scaffold(
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
                const SizedBox(height: screenLargePadding),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenLargePadding),
                  child: ClearDataView(),
                ),
                const SizedBox(height: screenLargePadding),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenLargePadding),
                  child: SignOutView(),
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: const CustomFloatingButton(),
      ),
    );
  }
}
