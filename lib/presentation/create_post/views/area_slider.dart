import 'package:flutter/material.dart';
import 'package:stepper/common/consts.dart';
import 'package:stepper/common/palette.dart';

class AreaSlider extends StatefulWidget {
  const AreaSlider({Key? key}) : super(key: key);

  @override
  State<AreaSlider> createState() => _AreaSliderState();
}

class _AreaSliderState extends State<AreaSlider> {
  double _currentSliderValue = 0;
  @override
  Widget build(BuildContext context) {
    return Slider(
      label: sliderValues[_currentSliderValue.toInt()],
      activeColor: purple,
      thumbColor: purple,
      inactiveColor: sliderInactiveColor,
      value: _currentSliderValue,
      min: 0,
      max: 3,
      divisions: 3,
      onChanged: (value) {
        setState(() {
          _currentSliderValue = value;
        });
      },
    );
  }
}
