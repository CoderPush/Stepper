import 'package:flutter/material.dart';
import 'package:stepper/common/consts.dart';
import 'package:stepper/common/numbers.dart';
import 'package:stepper/common/palette.dart';

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
            child: DropdownButtonHideUnderline(
              child: ButtonTheme(
                buttonColor: white,
                alignedDropdown: true,
                child: DropdownButton<String>(
                  dropdownColor: dropdownButtonColor,
                  iconEnabledColor: white,
                  onChanged: (value) {
                    if (value != null) {
                      onChanged(value);
                    }
                  },
                  value: value,
                  items: list.map(
                    (item) {
                      return DropdownMenuItem(
                        child: FittedBox(
                          child: Text(item,
                              style: const TextStyle(fontSize: seventeen)),
                        ),
                        value: item,
                      );
                    },
                  ).toList(),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
