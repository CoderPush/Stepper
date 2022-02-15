import 'package:flutter/material.dart';
import 'package:stepper/common/consts.dart';
import 'package:stepper/common/palette.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stepper/presentation/create_post/cubit/create_post_cubit_2.dart';
import 'package:stepper/presentation/create_post/cubit/create_post_state_2.dart';
import 'package:stepper/presentation/utils.dart';

class AreaSlider extends StatelessWidget {
  const AreaSlider({Key? key}) : super(key: key);

  void _onAreaSliderChanged(BuildContext context, double value) {
    context.read<CreatePostCubit2>().onAreaRatingChanged(value.toInt());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreatePostCubit2, CreatePostState2>(
      builder: (context, state) {
        final rating = state.selectedArea.rating;
        return Slider(
          label: sliderValues[rating],
          activeColor: getAreaTheme(state.selectedAreaType)[2],
          thumbColor: getAreaTheme(state.selectedAreaType)[2],
          inactiveColor: sliderInactiveColor,
          value: rating.toDouble(),
          min: 0,
          max: 3,
          divisions: 3,
          onChanged: (value) => _onAreaSliderChanged(context, value),
        );
      },
    );
  }
}
