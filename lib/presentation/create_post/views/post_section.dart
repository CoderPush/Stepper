import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stepper/common/consts.dart';
import 'package:stepper/common/palette.dart';
import 'package:stepper/common/texts.dart';
import 'package:stepper/presentation/create_post/cubit/create_post_cubit.dart';
import 'package:stepper/presentation/create_post/cubit/create_post_state.dart';
import 'package:stepper/presentation/create_post/views/write_update_view.dart';

class PostSection extends StatelessWidget {
  const PostSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: blueGrey,
        borderRadius: BorderRadius.circular(largeBorderRadius),
      ),
      child: BlocBuilder<CreatePostCubit, CreatePostState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.only(
              left: screenMediumPadding,
              top: screenMediumPadding,
              bottom: screenMediumPadding,
              right: screenMediumPadding,
            ),
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(bottom: screenSmallPadding),
                  child: Text(
                    writeUpdate,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: mediumFontSize,
                    ),
                  ),
                ),
                Expanded(
                  child: WriteUpdateView(
                    initialPostDescription: state.post?.description,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
