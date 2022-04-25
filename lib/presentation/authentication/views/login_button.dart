import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:stepper/common/consts.dart';
import 'package:stepper/common/palette.dart';

class LoginButton extends StatelessWidget {
  final Widget icon;
  final String title;
  final Function()? onTap;

  const LoginButton({
    Key? key,
    required this.icon,
    required this.title,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 200.sp,
        padding: EdgeInsets.symmetric(
          horizontal: screenMediumPadding.sp,
          vertical: 10,
        ),
        decoration: BoxDecoration(
          color: darkBlue,
          borderRadius: BorderRadius.circular(
            75.sp,
          ),
        ),
        child: Row(
          children: [
            icon,
            Padding(
              padding: const EdgeInsets.only(
                left: screenLargePadding,
              ),
              child: Text(
                title,
                style: TextStyle(
                  color: white,
                  fontSize: 12.sp,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
