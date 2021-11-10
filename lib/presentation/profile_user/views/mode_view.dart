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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: const [
              Icon(Icons.brightness_2_outlined, color: moreIconColor),
              SizedBox(width: fourteen),
              Text(
                'Dark Mode',
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
