import 'package:flutter/material.dart';
import 'package:stepper/common/consts.dart';
import 'package:stepper/common/numbers.dart';
import 'package:stepper/common/palette.dart';
import 'package:stepper/presentation/common/commons.dart';

class RowLevelView extends StatelessWidget {
  final String titleText;
  final String value;
  final List<String> list;
  final Function(String) onChanged;

  const RowLevelView({
    required this.titleText,
    required this.value,
    required this.list,
    required this.onChanged,
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
            titleText,
            style: const TextStyle(
              fontSize: seventeen,
              color: white,
            ),
          ),
        ),
        Flexible(
          fit: FlexFit.tight,
          flex: 2,
          child: Container(
            height: fortyTwo,
            width: twoHundredForty,
            decoration: BoxDecoration(
              color: darkBlue,
              borderRadius: BorderRadius.circular(largeBorderRadius),
            ),
            child: CustomDropdown(
              onChanged: (value) {
                onChanged(value);
              },
              value: value,
              items: list,
            ),
          ),
        ),
      ],
    );
  }
}
