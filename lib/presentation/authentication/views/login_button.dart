import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';
import 'package:stepper/common/consts.dart';
import 'package:stepper/common/palette.dart';
import 'package:stepper/common/texts.dart';
import 'package:stepper/config/routes/routes.dart';
import 'package:stepper/presentation/authentication/cubit/authentication_cubit.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthenticationCubit, AuthenticationState>(
      listener: (context, state) => {
        if (state is AuthenticatedState)
          {Navigator.of(context).pushReplacementNamed(RouteNames.home)}
      },
      builder: (context, state) => GestureDetector(
        onTap: () {
          BlocProvider.of<AuthenticationCubit>(context).signIn();
        },
        child: Container(
            width: 80.w,
            padding: EdgeInsets.symmetric(
                horizontal: screenMediumPadding.sp, vertical: 10),
            decoration: BoxDecoration(
                color: darkBlue, borderRadius: BorderRadius.circular(40)),
            child: Row(
              children: [
                SvgPicture.asset("assets/svg/google_logo.svg",
                    width: largeFontSize.sp),
                Padding(
                  padding: const EdgeInsets.only(left: screenLargePadding),
                  child: Text(signInWithGoogle,
                      style: TextStyle(color: white, fontSize: 12.sp)),
                )
              ],
            )),
      ),
    );
  }
}
