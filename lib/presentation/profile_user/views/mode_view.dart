import 'package:flutter/material.dart';
import 'package:stepper/common/consts.dart';
import 'package:stepper/common/numbers.dart';
import 'package:stepper/common/palette.dart';
import 'package:stepper/common/texts.dart';

class ModeView extends StatelessWidget {
  const ModeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: twenty, right: twenty, bottom: sixteen),
      padding: const EdgeInsets.symmetric(horizontal: twelve),
      width: double.infinity,
      decoration: BoxDecoration(
        color: blueGrey,
        borderRadius: BorderRadius.circular(largeBorderRadius),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: const [
              Icon(Icons.brightness_2_outlined, color: moreIconColor),
              SizedBox(width: fourteen),
              Text(
                darkMode,
                style: TextStyle(color: textColor, fontSize: seventeen),
              )
            ],
          ),
          Switch(
            onChanged: (isSwitch) {},
            value: true,
            activeColor: orange,
            inactiveTrackColor: textColor,
          ),
        ],
      ),
    );
  }
}
