import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';
import 'package:stepper/common/consts.dart';
import 'package:stepper/presentation/authentication/views/login_button.dart';

class AuthenticationScreen extends StatelessWidget {
  const AuthenticationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
        body: GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: SafeArea(
        child: Container(
          width: double.infinity,
          margin: EdgeInsets.symmetric(
            vertical: deviceSize.height / 4,
            horizontal: screenLargePadding * 2,
          ),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 50),
              child: SvgPicture.asset("assets/svg/stepper_logo.svg",
                  width: 120.sp),
            ),
            const LoginButton(),
          ]),
        ),
      ),
    ));
  }
}
