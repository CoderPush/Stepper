import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stepper/common/consts.dart';
import 'package:stepper/common/palette.dart';
import 'package:stepper/common/texts.dart';
import 'package:stepper/presentation/common/commons.dart';
import 'package:stepper/presentation/create_post/cubit/create_post_cubit.dart';
import 'package:stepper/presentation/create_post/views/create_post_action_button.dart';
import 'package:stepper/presentation/utils.dart';
import 'package:stepper/config/routes/routes.dart';

class WriteUpdateView extends StatefulWidget {
  final String? initialPostDescription;
  final String? imageUrl;

  const WriteUpdateView({
    Key? key,
    this.initialPostDescription,
    this.imageUrl,
  }) : super(key: key);

  @override
  State<WriteUpdateView> createState() => _WriteUpdateViewState();
}

class _WriteUpdateViewState extends State<WriteUpdateView> {
  late TextEditingController _controller;
  File? file;

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
    await context
        .read<CreatePostCubit>()
        .onPublishUpdate(_controller.text, file);
    context.read<DrawerCubit>().selectDrawerItem(DrawerType.home);
  }

  void onAttachFile() {}

  void onAttachPicture() async {
    final result = await FilePicker.platform.pickFiles(allowMultiple: false);
    if (result == null) return;
    final path = result.files.single.path;
    setState(() => file = File(path!));
  }

  void onAttachGoal() {}

  @override
  Widget build(BuildContext context) {
    _controller =
        TextEditingController(text: widget.initialPostDescription ?? '');
    _controller.addListener(() async {
      if (_controller.text.isNotEmpty) {
        context.read<CreatePostCubit>().onUserWriteUpdate(_controller.text);
      }
    });

    return BlocConsumer<CreatePostCubit, CreatePostState>(
      listener: (context, state) {
        if (state is CreateUpdateSuccessState) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text(writeUpdateSucceed),
            duration: Duration(milliseconds: 1000),
          ));
          Navigator.of(context).pushReplacementNamed(RouteNames.home);
        } else if (state is CreateGoalSuccessState) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text(setGoalSucceed)),
          );
          Navigator.of(context).pushReplacementNamed(RouteNames.home);
        } else if (state is CreatePostErrorState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.errorMessage)),
          );
        }
      },
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(right: screenMediumPadding),
                child: TextFormField(
                  controller: _controller,
                  keyboardType: TextInputType.multiline,
                  textInputAction: TextInputAction.done,
                  maxLines: null,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    hintText: writeUpdateHint,
                    hintStyle: TextStyle(color: mediumGrey),
                  ),
                ),
              ),
            ),
            file != null
                ? Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        colorFilter: ColorFilter.mode(
                            Colors.black.withOpacity(0.2), BlendMode.dstATop),
                        image: FileImage(File(file!.path)),
                      ),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black26,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    height: 50.0,
                    width: 50.0,
                  )
                : const SizedBox.shrink(),
            Row(
              children: [
                CreatePostActionButton(
                  iconData: Icons.image,
                  onTap: onAttachPicture,
                ),
                const SizedBox(width: screenLargePadding),
                Expanded(
                  child: SizedBox(
                    height: buttonHeight,
                    child: ElevatedButton(
                      key: const Key(postButton),
                      style: ElevatedButton.styleFrom(
                        primary: getAreaTheme(state.selectedAreaType)[2],
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(extraLargeBorderRadius),
                        ),
                      ),
                      onPressed: () => onPostClick(context),
                      child: const Text(publish),
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
