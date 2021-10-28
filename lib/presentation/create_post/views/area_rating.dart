import 'package:flutter/material.dart';
import 'package:stepper/presentation/create_post/views/area_dropdown.dart';
import 'package:stepper/presentation/create_post/views/area_slider.dart';

class AreaRating extends StatelessWidget {
  const AreaRating({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        AreaDropdown(),
        Expanded(child: AreaSlider()),
      ],
    );
  }
}
