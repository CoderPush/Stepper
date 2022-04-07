import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stepper/common/consts.dart';
import 'package:stepper/common/numbers.dart';
import 'package:stepper/common/palette.dart';
import 'package:stepper/enums/enums.dart';
import 'package:stepper/presentation/authentication/cubit/authentication_cubit.dart';
import 'package:stepper/presentation/profile_user/cubit/user_profile_cubit.dart';
import 'package:stepper/presentation/profile_user/cubit/user_profile_state.dart';
import 'package:stepper/presentation/profile_user/views/label_view.dart';
import 'package:stepper/config/routes/routes.dart';

class AvatarView extends StatelessWidget {
  const AvatarView({Key? key}) : super(key: key);

  void _onProfileUserEditScreenTap(BuildContext context) {
    Navigator.of(context).pushNamed(RouteNames.profileUserEdit);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.only(top: fortyFour),
          child: CircleAvatar(
            radius: fortyFour,
            backgroundColor: darkBlue,
            child: Image.asset('assets/images/avatar.png'),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(
            bottom: eighteen,
            top: screenLargePadding,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocBuilder<AuthenticationCubit, AuthenticationState>(
                builder: (context, state) {
                  return Text(
                    state is AuthenticatedState ? state.userName : '',
                    style: const TextStyle(
                      fontSize: seventeen,
                      color: white,
                    ),
                  );
                },
              ),
              IconButton(
                padding: const EdgeInsets.only(left: screenSmallPadding),
                constraints: const BoxConstraints(),
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
          child: BlocBuilder<UserProfileCubit, UserProfileState>(
            builder: (context, state) {
              if (state.fetchingStatus == StateStatus.success) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    LabelView(labelText: state.user.currentProfession.name),
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
                    LabelView(labelText: state.user.currentBand.name),
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
