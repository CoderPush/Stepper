import 'package:flutter/material.dart';
import 'package:stepper/common/consts.dart';
import 'package:stepper/common/numbers.dart';
import 'package:stepper/common/palette.dart';

class RowLevelView extends StatelessWidget {
  final String titleText;
  final List<String> list;

  const RowLevelView({
    required this.titleText,
    required this.list,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          titleText,
          style: const TextStyle(
            fontSize: seventeen,
            color: white,
          ),
        ),
        Container(
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
                onChanged: (value) {},
                value: list.first,
                items: list
                    .map(
                      (item) => DropdownMenuItem(
                        child:
                            Text(item, style: const TextStyle(fontSize: seventeen)),
                        value: item,
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
