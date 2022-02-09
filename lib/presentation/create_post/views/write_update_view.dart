import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stepper/common/consts.dart';
import 'package:stepper/common/palette.dart';
import 'package:stepper/common/texts.dart';
import 'package:stepper/presentation/create_post/cubit/create_post_cubit_2.dart';
import 'package:stepper/presentation/create_post/cubit/create_post_state_2.dart';
import 'package:stepper/presentation/create_post/views/create_post_action_button.dart';
import 'package:stepper/presentation/utils.dart';

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
  final Debounce _debounce = Debounce(miliseconds: 300);
  late TextEditingController _controller;
  File? file;
  late CreatePostCubit2 createPostCubit;
  late CreatePostState2 createPostState;

  @override
  void initState() {
    super.initState();
    _controller =
        TextEditingController(text: widget.initialPostDescription ?? '');
    _controller.addListener(() {
      if (_controller.text.isEmpty) return;
      // Auto save feature should be used only on mode Edit only
      _onAutoUpdatePost(_controller.text);
    });
  }

  @override
  void dispose() {
    // Happen only when mode is createNew and user does not create new post by pressing publish
    createDraftPostOnCreateNewModeOnly();
    _debounce.cancel();
    super.dispose();
    _controller.dispose();
  }

  void _onAutoUpdatePost(String text) {
    _debounce.run(() {
      context.read<CreatePostCubit2>().onAutoUpdatePost(postContent: text);
    });
  }

  void createDraftPostOnCreateNewModeOnly() {
    final mode = createPostState.mode;
    final shouldCreateDraft = createPostState.shouldCreateDraft;
    final postContent = _controller.text;
    if (mode != CreatePostScreenMode.createNew) return;

    if (!shouldCreateDraft) return;

    if (postContent.isEmpty) return;

    createPostCubit.onCreateNewDraftPost(
        postContent: _controller.text, imgFile: file);
  }

  void onPressPublish(CreatePostState2 state) {
    final mode = state.mode;
    if (mode == CreatePostScreenMode.createNew) {
      BlocProvider.of<CreatePostCubit2>(context)
          .onCreateNewPublishPost(postContent: _controller.text, imgFile: file);
    } else {
      BlocProvider.of<CreatePostCubit2>(context)
          .onUpdatePublishPost(postContent: _controller.text, imgFile: file);
    }

    Navigator.of(context).pop();
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
    return BlocConsumer<CreatePostCubit2, CreatePostState2>(
      listener: (context, state) {},
      // TODO:
      // listener: (context, state) {
      //   if (state is CreateUpdateSuccessState) {
      //     ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      //       content: Text(writeUpdateSucceed),
      //       duration: Duration(milliseconds: 1000),
      //     ));
      //     Navigator.of(context).pushReplacementNamed(RouteNames.home);
      //   } else if (state is CreateGoalSuccessState) {
      //     ScaffoldMessenger.of(context).showSnackBar(
      //       const SnackBar(content: Text(setGoalSucceed)),
      //     );
      //     Navigator.of(context).pushReplacementNamed(RouteNames.home);
      //   } else if (state is CreatePostErrorState) {
      //     ScaffoldMessenger.of(context).showSnackBar(
      //       SnackBar(content: Text(state.errorMessage)),
      //     );
      //   }
      // },
      builder: (context, state) {
        createPostCubit = BlocProvider.of<CreatePostCubit2>(context);
        createPostState = state;
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
                  flex: 2,
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
                      onPressed: () {
                        onPressPublish(state);
                      },
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
