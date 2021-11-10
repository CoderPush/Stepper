import 'package:flutter/material.dart';
import 'package:stepper/common/consts.dart';
import 'package:stepper/common/numbers.dart';
import 'package:stepper/common/palette.dart';

class ModeView extends StatelessWidget {
  const ModeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: twenty, right: twenty, bottom: sixteen),
      padding: const EdgeInsets.only(
          left: twentyFour, right: ten, top: twelve, bottom: twelve),
      height: fortyFour,
      width: double.infinity,
      decoration: BoxDecoration(
        color: blueGrey,
        borderRadius: BorderRadius.circular(largeBorderRadius),
      ),
    );
  }
}
