import 'package:flutter/material.dart';
import 'package:stepper/common/consts.dart';
import 'package:stepper/common/palette.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stepper/presentation/create_post/cubit/create_post_cubit.dart';
import 'package:stepper/presentation/create_post/views/area_rating.dart';

class AreaSection extends StatelessWidget {
  const AreaSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(screenMediumPadding),
      decoration: BoxDecoration(
        color: blueGrey,
        borderRadius: BorderRadius.circular(mediumBorderRadius),
      ),
      child: Column(
        children: [
          const AreaRating(),
          const SizedBox(height: screenSmallPadding),
          BlocBuilder<CreatePostCubit, CreatePostState>(
            builder: (context, state) {
              final currentState = state as CreatePostLoadedState;
              return Text(
                currentState.areaList
                    .firstWhere((area) =>
                        area.areaName == currentState.selectedAreaName)
                    .areaDescription,
              );
            },
          )
        ],
      ),
    );
  }
}
