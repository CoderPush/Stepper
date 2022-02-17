import 'package:flutter/material.dart';
import 'package:stepper/common/consts.dart';
import 'package:stepper/common/palette.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stepper/presentation/create_post/cubit/create_post_cubit.dart';
import 'package:stepper/presentation/create_post/cubit/create_post_state.dart';
import 'package:stepper/presentation/create_post/views/area_rating.dart';

class AreaSection extends StatelessWidget {
  const AreaSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(screenMediumPadding),
      decoration: BoxDecoration(
        color: blueGrey,
        borderRadius: BorderRadius.circular(largeBorderRadius),
      ),
      child: BlocBuilder<CreatePostCubit, CreatePostState>(
          builder: (context, state) {
        if (state.isLoadingAreas) {
          return const Center(child: CircularProgressIndicator());
        }

        return Column(
          children: [
            const AreaRating(),
            const SizedBox(height: screenSmallPadding),
            Text(state.selectedArea.description)
          ],
        );
      }),
    );
  }
}
