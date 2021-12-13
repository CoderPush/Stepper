import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:stepper/common/consts.dart';
import 'package:stepper/common/palette.dart';

class CustomDropdown extends StatelessWidget {
  final Function(String) onChanged;
  final String value;
  final List<String> items;

  const CustomDropdown({
    Key? key,
    required this.onChanged,
    required this.value,
    required this.items,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: ButtonTheme(
        buttonColor: white,
        alignedDropdown: true,
        child: DropdownButton2(
          dropdownDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(largeBorderRadius),
            color: dropdownButtonColor,
          ),
          iconEnabledColor: white,
          onChanged: (value) {
            onChanged(value as String);
          },
          value: value,
          items: items.map(
            (item) {
              return DropdownMenuItem(
                child: FittedBox(
                  child: Text(item),
                ),
                value: item,
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
