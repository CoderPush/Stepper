import 'package:flutter/material.dart';
import 'package:stepper/common/consts.dart';
import 'package:stepper/common/palette.dart';
import 'package:stepper/dummy_data.dart';

class AreaDropdown extends StatefulWidget {
  const AreaDropdown({Key? key}) : super(key: key);

  @override
  State<AreaDropdown> createState() => _AreaDropdownState();
}

class _AreaDropdownState extends State<AreaDropdown> {
  String _selectedValue = scopeAreaList[0].areaName;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30.0,
      decoration: BoxDecoration(
        color: dropdownButtonColor,
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
              setState(() {
                _selectedValue = value!;
              });
            },
            value: _selectedValue,
            items: scopeAreaList
                .map(
                  (area) => DropdownMenuItem(
                    child: Text(area.areaName),
                    value: area.areaName,
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}
