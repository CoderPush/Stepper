import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stepper/common/consts.dart';
import 'package:stepper/common/numbers.dart';
import 'package:stepper/common/palette.dart';
import 'package:stepper/dummy_data.dart';
import 'package:stepper/presentation/profile_user/views/label_view.dart';
import 'package:stepper/config/routes/routes.dart';
import 'package:stepper/presentation/profile_user_edit/cubit/profile_user_edit_cubit.dart';

class AvatarView extends StatelessWidget {
  const AvatarView({Key? key}) : super(key: key);

  void _onProfileUserEditScreenTap(BuildContext context) {
    Navigator.pushNamed(context, RouteNames.profileUserEdit);
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
          child: BlocBuilder<ProfileUserEditCubit, ProfileUserEditState>(
            builder: (context, state) {
              if (state is ProfileUserEditInSuccess) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    LabelView(
                      labelText: state.selectedProfession,
                      labelWidth: oneHundredSixty,
                    ),
                    Container(
                      height: four,
                      width: four,
                      margin:
                          const EdgeInsets.only(left: twelve, right: twelve),
                      decoration: BoxDecoration(
                        color: sliderInactiveColor,
                        borderRadius: BorderRadius.circular(largeBorderRadius),
                      ),
                    ),
                    LabelView(
                      labelText: state.selectedBand.bandName,
                      labelWidth: seventy,
                    ),
                  ],
                );
              }
              return const SizedBox.shrink();
            },
          ),
        ),
      ],
    );
  }
}
