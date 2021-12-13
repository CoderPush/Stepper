import 'package:bloc/bloc.dart';
import 'package:uuid/uuid.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:stepper/data/model/models.dart';
import 'package:stepper/data/repositories/repositories_impl.dart';
import 'package:stepper/domain/repositories/repositories.dart';
import 'package:stepper/presentation/common/arguments/screen_arguments.dart';
import 'package:stepper/presentation/utils.dart';

part 'create_post_state.dart';

class CreatePostCubit extends Cubit<CreatePostState> {
  final AreaRepository areaRepository;
  final PostRepository postRepository;
  final BandRepository bandRepository;
  final CreatePostScreenArgument createPostScreenArgument;

  CreatePostCubit({
    required this.areaRepository,
    required this.postRepository,
    required this.bandRepository,
    required this.createPostScreenArgument,
  }) : super(const CreatePostInitialState(selectedAreaType: AreaType.scope)) {
    if (createPostScreenArgument.preSelectedPostId != null) {
      editPost(createPostScreenArgument.preSelectedPostId!);
    } else {
      getAreas(preSelectedAreaName: createPostScreenArgument.preSelectedArea);
    }
  }

  Future<void> editPost(String postId) async {
    // get editing post
    final post = await postRepository.getPostById(postId);

    // get areaType of editing post
    final areaType = getAreaType(post!.areaName);

    try {
      emit(CreatePostLoadingState(selectedAreaType: areaType));

      // get band
      final selectedBandName =
          (await bandRepository.getBandByAreaName(post.areaName)).bandName;

      // get area list for drop down
      var areaList = await areaRepository.fetchAreasWithBandAndType(
        selectedBandName,
        areaType,
      );

      // sort area list in order
      areaList = sortAreasInOrder(areaList);
      final area = await areaRepository.fetchAreaByAreaName(post.areaName);

      // fetch bandList
      final bandList = await bandRepository.getBandWithChildBand();

      emit(CreatePostLoadedState(
        areaList: areaList,
        areaRating: area.rating,
        selectedAreaType: areaType,
        selectedAreaName: post.areaName,
        draftPost: post,
        bandList: bandList,
        selectedBandName: selectedBandName,
      ));
    } on NetworkException {
      emit(CreatePostErrorState(
        errorMessage: 'Network error',
        selectedAreaType: areaType,
      ));
    }
  }

  Future<void> getAreas({
    String? preSelectedAreaName,
    AreaType? areaType,
  }) async {
    var calculatedAreaType = preSelectedAreaName != null
        ? (await areaRepository.fetchAreaByAreaName(preSelectedAreaName))
            .areaType
        : AreaType.scope;
    calculatedAreaType = areaType ?? calculatedAreaType;
    try {
      emit(CreatePostLoadingState(selectedAreaType: calculatedAreaType));

      // fetch bandList
      final bandList = await bandRepository.getBandWithChildBand();

      // fetch selectedBand
      final selectedBandName =
          (await bandRepository.getSelectedBand()).bandName;

      // get area list for drop down
      var areaList = await areaRepository.fetchAreasWithBandAndType(
        selectedBandName,
        calculatedAreaType,
      );

      // sort area list in order
      areaList = sortAreasInOrder(areaList);

      final selectedAreaName = preSelectedAreaName ?? areaList[0].areaName;
      final area = await areaRepository.fetchAreaByAreaName(selectedAreaName);
      final draftPost =
          await postRepository.getDraftPostByAreaName(selectedAreaName);

      emit(CreatePostLoadedState(
        areaRating: area.rating,
        areaList: areaList,
        selectedAreaType: calculatedAreaType,
        selectedAreaName: selectedAreaName,
        draftPost: draftPost,
        bandList: bandList,
        selectedBandName: selectedBandName,
      ));
    } on NetworkException {
      emit(CreatePostErrorState(
        errorMessage: 'Network error',
        selectedAreaType: areaType,
      ));
    }
  }

  Future<void> onAreaTypeTabChanged(AreaType areaType) async {
    final currentState = state as CreatePostLoadedState;

    // get area list for drop down
    var areaList = await areaRepository.fetchAreasWithBandAndType(
      currentState.selectedBandName,
      areaType,
    );

    // sort area list in order
    areaList = sortAreasInOrder(areaList);

    // get first area
    final selectedArea = areaList[0];

    // get draft post
    final draftPost =
        await postRepository.getDraftPostByAreaName(selectedArea.areaName);

    emit(currentState.copyWith(
      areaList: areaList,
      areaRating: selectedArea.rating,
      draftPost: draftPost,
      selectedAreaType: areaType,
      selectedAreaName: selectedArea.areaName,
    ));
  }

  Future<void> onChangeAreaName(String areaName) async {
    final currentState = state as CreatePostLoadedState;
    final draftPost = await postRepository.getDraftPostByAreaName(areaName);
    final area = await areaRepository.fetchAreaByAreaName(areaName);
    emit(currentState.copyWith(
      selectedAreaName: areaName,
      areaRating: area.rating,
      draftPost: draftPost,
    ));
  }

  Future<void> onChangeAreaRating(int areaRating) async {
    final currentState = state as CreatePostLoadedState;
    await areaRepository.rateArea(currentState.selectedAreaName, areaRating);
    emit(currentState.copyWith(
      areaRating: areaRating,
      draftPost: currentState.draftPost,
    ));
  }

  Future<void> onBandChange(String bandName) async {
    final currentState = state as CreatePostLoadedState;

    // get area list for drop down
    var areaList = await areaRepository.fetchAreasWithBandAndType(
      bandName,
      currentState.selectedAreaType,
    );

    // sort area list in order
    areaList = sortAreasInOrder(areaList);

    // get first area
    final selectedArea = areaList[0];

    // get draft post
    final draftPost =
        await postRepository.getDraftPostByAreaName(selectedArea.areaName);

    emit(currentState.copyWith(
      areaList: areaList,
      selectedBandName: bandName,
      selectedAreaName: selectedArea.areaName,
      areaRating: selectedArea.rating,
      draftPost: draftPost,
    ));
  }

  void onCreatePostModeChange(CreatePostMode createPostMode) {
    final currentState = state as CreatePostLoadedState;
    emit(currentState.copyWith(createPostMode: createPostMode));
  }

  Future<void> onPublishUpdate(String postDescription) async {
    final currentState = state as CreatePostLoadedState;
    if (postDescription.isEmpty) {
      return;
    }
    final currentTime = DateTime.now();
    final editedPost = await postRepository
        .getPostById(createPostScreenArgument.preSelectedPostId);
    final addedPost = Post(
      // If we in edit mode and editing post is not draft
      postId: editedPost != null &&
              editedPost.areaName == currentState.selectedAreaName &&
              !createPostScreenArgument.preSelectedPostId!.startsWith('draft')
          ? createPostScreenArgument.preSelectedPostId!
          : const Uuid().v1(),
      areaName: currentState.selectedAreaName,
      postedTime: currentTime,
      description: postDescription,
    );
    await postRepository.savePost(addedPost);
    // delete draft post
    await postRepository.deletePost('draft_${currentState.selectedAreaName}');
    // update area
    await areaRepository
        .updateAreaWhenAddNewPost(currentState.selectedAreaName);
    emit(CreateUpdateSuccessState(selectedAreaType: state.selectedAreaType));
  }

  Future<void> onUserWriteUpdate(String update) async {
    final currentState = state as CreatePostLoadedState;
    final editedPost = await postRepository
        .getPostById(createPostScreenArgument.preSelectedPostId);
    if (editedPost != null &&
        editedPost.areaName == currentState.selectedAreaName) {
      await postRepository.savePost(editedPost.copyWith(description: update));
    } else {
      final post = Post(
        postId: 'draft_${currentState.selectedAreaName}',
        areaName: currentState.selectedAreaName,
        postedTime: DateTime.now(),
        description: update,
      );
      await postRepository.savePost(post);
    }
  }
}
