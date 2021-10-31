import 'package:flutter/material.dart';
import 'package:stepper/common/consts.dart';
import 'package:stepper/common/palette.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stepper/presentation/create_post/cubit/create_post_cubit.dart';

class AreaSlider extends StatelessWidget {
  const AreaSlider({Key? key}) : super(key: key);

  void _onAreaSliderChanged(BuildContext context, double value) {
    context.read<CreatePostCubit>().onChangeAreaRating(value.toInt());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreatePostCubit, CreatePostState>(
      builder: (context, state) {
        return Slider(
          label: sliderValues[(state as CreatePostLoadedState).areaRating],
          activeColor: purple,
          thumbColor: purple,
          inactiveColor: sliderInactiveColor,
          value: state.areaRating.toDouble(),
          min: 0,
          max: 3,
          divisions: 3,
          onChanged: (value) => _onAreaSliderChanged(context, value),
        );
      },
    );
  }
}
