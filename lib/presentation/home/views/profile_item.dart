import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stepper/common/consts.dart';
import 'package:stepper/common/palette.dart';
import 'package:stepper/config/routes/routes.dart';
import 'package:stepper/presentation/authentication/cubit/authentication_cubit.dart';

class ProfileItem extends StatelessWidget {
  final Function()? onClick;

  const ProfileItem({
    Key? key,
    this.onClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick ??
          () {
            _onProfileUserScreenTap(context);
          },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(screenMediumPadding),
            child: CircleAvatar(
              backgroundColor: darkGrey,
              child: Image.asset('assets/images/avatar.png'),
            ),
          ),
          BlocBuilder<AuthenticationCubit, AuthenticationState>(
            builder: (context, state) {
              return Text(
                state is AuthenticatedState ? state.userName : '',
              );
            },
          )
        ],
      ),
    );
  }

  void _onProfileUserScreenTap(BuildContext context) {
    Navigator.pushNamed(
      context,
      RouteNames.profileUser,
    );
  }
}
