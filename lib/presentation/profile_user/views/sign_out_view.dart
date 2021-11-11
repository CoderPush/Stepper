import 'package:flutter/material.dart';
import 'package:stepper/common/consts.dart';
import 'package:stepper/common/numbers.dart';
import 'package:stepper/common/palette.dart';
import 'package:stepper/common/texts.dart';

class SignOutView extends StatelessWidget {
  const SignOutView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.only(left: twenty, right: twenty),
        padding: const EdgeInsets.symmetric(vertical: twelve),
        width: double.infinity,
        decoration: BoxDecoration(
          color: blueGrey,
          borderRadius: BorderRadius.circular(largeBorderRadius),
        ),
        child: const Center(
          child: Text(
            signOut,
            style: TextStyle(color: orange, fontSize: seventeen),
          ),
        ),
      ),
    );
  }
}
