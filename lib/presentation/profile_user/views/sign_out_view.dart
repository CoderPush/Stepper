import 'package:flutter/material.dart';
import 'package:stepper/common/consts.dart';
import 'package:stepper/common/numbers.dart';
import 'package:stepper/common/palette.dart';

class SignOutView extends StatelessWidget {
  const SignOutView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.only(left: twenty, right: twenty),
        height: screenSize.width * 0.11,
        width: double.infinity,
        decoration: BoxDecoration(
          color: blueGrey,
          borderRadius: BorderRadius.circular(largeBorderRadius),
        ),
        child: const Center(
          child: Text(
            'Sign out',
            style: TextStyle(color: orange, fontSize: seventeen),
          ),
        ),
      ),
    );
  }
}
