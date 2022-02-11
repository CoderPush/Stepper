import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stepper/common/palette.dart';
import 'package:stepper/common/texts.dart';
import 'package:stepper/config/routes/routes.dart';
import 'package:stepper/injection_container.dart';
import 'package:stepper/presentation/profile_user_edit/cubit/user_profile_edit_cubit.dart';
import 'package:stepper/presentation/profile_user_edit/views/avatar_view.dart';
import 'package:stepper/presentation/profile_user_edit/views/user_level_view.dart';
import 'package:stepper/presentation/profile_user_edit/views/user_information_view.dart';

class ProfileUserEditScreen extends StatelessWidget {
  final userProfileEditCubit = UserProfileEditCubit(
      professionRepository: sl(), bandRepository: sl(), userRepository: sl());

  ProfileUserEditScreen({Key? key}) : super(key: key);

  onSave(BuildContext context) async {
    await userProfileEditCubit.onSaveProfessionAndBand();
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text("Saved")));
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: userProfileEditCubit,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: scaffoldColor,
          actions: [
            TextButton(
              onPressed: () => onSave(context),
              child: const Text(
                'Save',
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
          leading: IconButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, RouteNames.profileUser);
            },
            icon: const Icon(Icons.arrow_back_ios),
          ),
          title: const Text(account),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: const [
              AvatarView(),
              UserInformationView(),
              UserLevelView(),
            ],
          ),
        ),
      ),
    );
  }
}
