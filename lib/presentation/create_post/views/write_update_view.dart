import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stepper/common/consts.dart';
import 'package:stepper/common/palette.dart';
import 'package:stepper/common/texts.dart';
import 'package:stepper/presentation/create_post/cubit/create_post_cubit.dart';
import 'package:stepper/presentation/create_post/views/create_post_action_button.dart';
import 'package:stepper/routes.dart';

class WriteUpdateView extends StatefulWidget {
  final String? initialPostDescription;

  const WriteUpdateView({
    Key? key,
    required this.initialPostDescription,
  }) : super(key: key);

  @override
  State<WriteUpdateView> createState() => _WriteUpdateViewState();
}

class _WriteUpdateViewState extends State<WriteUpdateView> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  void onPostClick(BuildContext context) async {
    await context.read<CreatePostCubit>().onPublishUpdate(_controller.text);
  }

  void onAttachFile() {}

  void onAttachPicture() {}

  void onAttachGoal() {}

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    _controller =
        TextEditingController(text: widget.initialPostDescription ?? '');
    _controller.addListener(() async {
      if (_controller.text.isNotEmpty) {
        context.read<CreatePostCubit>().onUserWriteUpdate(_controller.text);
      }
    });

    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(right: screenMediumPadding),
          constraints: BoxConstraints(minHeight: screenSize.height * 0.25),
          child: BlocBuilder<CreatePostCubit, CreatePostState>(
            builder: (context, state) {
              return TextFormField(
                controller: _controller,
                keyboardType: TextInputType.multiline,
                maxLines: 8,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  hintText: writeUpdateHint,
                  hintStyle: TextStyle(color: mediumGrey),
                ),
              );
            },
          ),
        ),
        BlocListener<CreatePostCubit, CreatePostState>(
          listener: (context, state) {
            if (state is CreateUpdateSuccessState) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text(writeUpdateSucceed)),
              );
              Navigator.of(context).pushReplacementNamed(Routes.home);
            } else if (state is CreateGoalSuccessState) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text(setGoalSucceed)),
              );
              Navigator.of(context).pushReplacementNamed(Routes.home);
            } else if (state is CreatePostErrorState) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.errorMessage)),
              );
            }
          },
          child: Row(
            children: [
              CreatePostActionButton(
                iconData: Icons.attach_file,
                onTap: onAttachFile,
              ),
              CreatePostActionButton(
                iconData: Icons.crop_original,
                onTap: onAttachPicture,
              ),
              CreatePostActionButton(
                iconData: Icons.brightness_7_outlined,
                onTap: onAttachGoal,
              ),
              Expanded(
                child: ElevatedButton(
                  key: const Key(postButton),
                  style: ElevatedButton.styleFrom(
                    primary: purple,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(largeBorderRadius),
                    ),
                  ),
                  onPressed: () => onPostClick(context),
                  child: const Text(post),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
