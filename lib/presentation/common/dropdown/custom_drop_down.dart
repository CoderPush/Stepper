import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:stepper/common/consts.dart';
import 'package:stepper/common/palette.dart';

class CustomDropdown extends StatelessWidget {
  final Function(String) onChanged;
  final String value;
  final List<String> items;
  final bool disabled;
  final String disableHintText;

  const CustomDropdown(
      {Key? key,
      required this.onChanged,
      required this.value,
      required this.items,
      this.disabled = false,
      this.disableHintText = ""})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: ButtonTheme(
        buttonColor: white,
        alignedDropdown: true,
        child: DropdownButton2(
          disabledHint: Text(
            disableHintText,
            style: const TextStyle(color: white),
          ),
          dropdownDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(largeBorderRadius),
            color: dropdownButtonColor,
          ),
          iconEnabledColor: white,
          iconDisabledColor: white,
          onChanged: (value) {
            onChanged(value as String);
          },
          value: disabled ? null : value,
          items: disabled
              ? null
              : items.map(
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
