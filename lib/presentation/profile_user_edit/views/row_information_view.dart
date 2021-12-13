import 'package:flutter/material.dart';
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
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          flex: 1,
          child: Text(
            firstText,
            style: const TextStyle(
              fontSize: seventeen,
              color: white,
            ),
          ),
        ),
        Flexible(
          flex: 2,
          fit: FlexFit.tight,
          child: Text(
            secondText,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.left,
            style: const TextStyle(
              fontSize: seventeen,
              color: moreIconColor,
            ),
          ),
        ),
      ],
    );
  }
}
