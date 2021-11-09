import 'package:flutter/material.dart';
import 'package:stepper/common/consts.dart';
import 'package:stepper/common/numbers.dart';
import 'package:stepper/common/palette.dart';

class RowInformationView extends StatelessWidget {
  final String firstText;
  final String secondText;

  const RowInformationView({
    required this.firstText,
    required this.secondText,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          firstText,
          style: const TextStyle(
            fontSize: mediumFontSize,
            color: white,
          ),
        ),
        const SizedBox(width: fifty),
        Text(
          secondText,
          style: const TextStyle(
            fontSize: mediumFontSize,
            color: moreIconColor,
          ),
        ),
      ],
    );
  }
}
