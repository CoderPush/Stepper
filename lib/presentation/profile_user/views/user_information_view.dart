import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stepper/common/consts.dart';
import 'package:stepper/common/numbers.dart';
import 'package:stepper/common/palette.dart';
import 'package:stepper/common/texts.dart';
import 'package:stepper/presentation/authentication/cubit/authentication_cubit.dart';
import 'package:stepper/presentation/profile_user/views/row_information_view.dart';

class UserInformationView extends StatelessWidget {
  final EdgeInsets margin;

  const UserInformationView({
    Key? key,
    this.margin = const EdgeInsets.only(
      left: twenty,
      right: twenty,
      bottom: twenty,
    ),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: const EdgeInsets.symmetric(
        vertical: sixteen,
        horizontal: twenty,
      ),
      width: double.infinity,
      decoration: BoxDecoration(
        color: blueGrey,
        borderRadius: BorderRadius.circular(largeBorderRadius),
      ),
      child: BlocBuilder<AuthenticationCubit, AuthenticationState>(
        builder: (context, state) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RowInformationView(
                firstText: name,
                secondText: (state as AuthenticatedState).userName,
              ),
              const SizedBox(height: twenty),
              RowInformationView(
                firstText: email,
                secondText: (state).userEmail,
              ),
            ],
          );
        },
      ),
    );
  }
}
