import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stepper/common/numbers.dart';
import 'package:stepper/common/palette.dart';
import 'package:stepper/common/texts.dart';
import 'package:stepper/presentation/profile_user_edit/cubit/profile_user_edit_cubit.dart';
import 'package:stepper/presentation/profile_user_edit/views/avatar_view.dart';
import 'package:stepper/presentation/profile_user_edit/views/user_level_view.dart';
import 'package:stepper/presentation/profile_user_edit/views/user_information_view.dart';

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
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: const Text(account),
        centerTitle: true,
      ),
      body: BlocBuilder<ProfileUserEditCubit, ProfileUserEditState>(
        builder: (context, state) {
          if (state is ProfileUserEditInFailed) {
            return Text(state.error, style: const TextStyle(fontSize: sixteen));
          } else if (state is ProfileUserEditInSuccess) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  const AvatarView(),
                  const UserInformationView(),
                  UserLevelView(
                    band: state.band,
                    profession: state.profession,
                    profileUserEditCubit: context.read<ProfileUserEditCubit>(),
                  ),
                ],
              ),
            );
          }

          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
