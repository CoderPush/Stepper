import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';
import 'package:stepper/common/consts.dart';
import 'package:stepper/presentation/authentication/cubit/authentication_cubit.dart';
import 'package:stepper/presentation/authentication/views/login_button.dart';

import '../../common/texts.dart';
import '../../config/routes/routes.dart';

class AuthenticationScreen extends StatelessWidget {
  const AuthenticationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
        body: GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: SafeArea(
        child: BlocListener<AuthenticationCubit, AuthenticationState>(
          listener: (ctx, state) {
            if (state is AuthenticatedState) {
              Navigator.of(context).pushReplacementNamed(RouteNames.home);
            }
          },
          child: Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(
              vertical: deviceSize.height / 4,
              horizontal: screenLargePadding * 2,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 50),
                  child: SvgPicture.asset("assets/svg/stepper_logo.svg",
                      width: 120.sp),
                ),
                LoginButton(
                  icon: SvgPicture.asset(
                    "assets/svg/google_logo.svg",
                    width: largeFontSize.sp,
                  ),
                  title: signInWithGoogle,
                  onTap: () {
                    BlocProvider.of<AuthenticationCubit>(context).signIn();
                  },
                ),
                SizedBox(
                  height: 12.sp,
                ),
                !kIsWeb && Platform.isIOS
                    ? LoginButton(
                        icon: SvgPicture.asset(
                          "assets/svg/apple_logo.svg",
                          width: largeFontSize.sp,
                        ),
                        title: signInWithApple,
                        onTap: () {
                          BlocProvider.of<AuthenticationCubit>(context)
                              .signInApple();
                        },
                      )
                    : Container(),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
