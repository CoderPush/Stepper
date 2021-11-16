import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:stepper/data/model/area.dart';
import 'package:stepper/data/model/models.dart';
import 'package:stepper/domain/repositories/area_repository.dart';
import 'package:stepper/domain/repositories/goal_repository.dart';
import 'package:stepper/domain/repositories/post_repository.dart';
import 'package:stepper/data/repositories/fake_repos.dart';
import 'package:stepper/presentation/common/arguments/screen_arguments.dart';
import 'package:stepper/presentation/utils.dart';

part 'create_post_state.dart';

class CreatePostCubit extends Cubit<CreatePostState> {
  final AreaRepository areaRepository;
  final PostRepository postRepository;
  final GoalRepository goalRepository;
  final CreatePostScreenArgument createPostScreenArgument;

  CreatePostCubit({
    required this.areaRepository,
    required this.postRepository,
    required this.goalRepository,
    required this.createPostScreenArgument,
  }) : super(const CreatePostInitialState(selectedAreaType: AreaType.scope)) {
    if (createPostScreenArgument.preSelectedPost != null) {
      editPost(createPostScreenArgument.preSelectedPost!);
    } else if (createPostScreenArgument.preSelectedArea != null) {
      getAreas(
        createPostScreenArgument.preSelectedArea!.areaType,
        preSelectedAreaName: createPostScreenArgument.preSelectedArea!.areaName,
      );
    } else {
      getAreas(AreaType.scope);
    }
  }

  Future<void> editPost(Post post) async {
    final areaType = getAreaType(post.areaName);
    try {
      emit(CreatePostLoadingState(selectedAreaType: areaType));
      final areaList = await areaRepository.fetchAreasByType(areaType);
      final area = await areaRepository.fetchAreaByAreaName(post.areaName);
      emit(CreatePostLoadedState(
        areaList: areaList,
        areaRating: area.rating,
        selectedAreaType: areaType,
        selectedAreaName: post.areaName,
        draftPost: post,
      ));
    } on NetworkException {
      emit(CreatePostErrorState(
        errorMessage: 'Network error',
        selectedAreaType: areaType,
      ));
    }
  }

  Future<void> getAreas(AreaType areaType,
      {String? preSelectedAreaName}) async {
    try {
      emit(CreatePostLoadingState(selectedAreaType: areaType));
      final areaList = (await areaRepository.fetchAreasByType(areaType))
        ..sort((first, next) => first.areaName
            .substring(1)
            .padLeft(3, '0')
            .compareTo(next.areaName.substring(1).padLeft(3, '0')));
      final selectedAreaName = preSelectedAreaName ?? areaList[0].areaName;
      final area = await areaRepository.fetchAreaByAreaName(selectedAreaName);
      final draftPost =
          await postRepository.getDraftPostByAreaName(selectedAreaName);
      emit(CreatePostLoadedState(
        areaRating: area.rating,
        areaList: areaList,
        selectedAreaType: areaType,
        selectedAreaName: selectedAreaName,
        draftPost: createPostScreenArgument.isEditPost &&
                selectedAreaName ==
                    createPostScreenArgument.preSelectedPost!.areaName
            ? createPostScreenArgument.preSelectedPost
            : draftPost,
      ));
    } on NetworkException {
      emit(CreatePostErrorState(
        errorMessage: 'Network error',
        selectedAreaType: areaType,
      ));
    }
  }

  void onChangeAreaName(String areaName) async {
    final currentState = state as CreatePostLoadedState;
    final draftPost = await postRepository.getDraftPostByAreaName(areaName);
    final area = await areaRepository.fetchAreaByAreaName(areaName);
    emit(currentState.copyWith(
      selectedAreaName: areaName,
      areaRating: area.rating,
      draftPost: createPostScreenArgument.isEditPost &&
              areaName == createPostScreenArgument.preSelectedPost!.areaName
          ? createPostScreenArgument.preSelectedPost
          : draftPost,
    ));
  }

  void onChangeAreaRating(int areaRating) {
    final currentState = state as CreatePostLoadedState;
    areaRepository.rateArea(currentState.selectedAreaName, areaRating);
    emit(currentState.copyWith(
      areaRating: areaRating,
      draftPost: currentState.draftPost,
    ));
  }

  void onCreatePostModeChange(CreatePostMode createPostMode) {
    final currentState = state as CreatePostLoadedState;
    emit(currentState.copyWith(createPostMode: createPostMode));
  }

  void onNewGoalAdded(Goal goal) {
    final currentState = state as CreatePostLoadedState;
    emit(currentState.copyWith(
      newlyAddedGoals: List.from(currentState.newlyAddedGoals)..add(goal),
    ));
  }

  void onNewGoalDeleted(int index) {
    final currentState = state as CreatePostLoadedState;
    emit(currentState.copyWith(
      newlyAddedGoals: List.from(currentState.newlyAddedGoals)..removeAt(index),
    ));
  }

  Future<void> onPublishUpdate(String postDescription) async {
    final currentState = state as CreatePostLoadedState;
    if (postDescription.isEmpty) {
      return;
    }
    final currentTime = DateTime.now();
    final addedPost = Post(
      // If we in edit mode and editing post is not draft
      postId: createPostScreenArgument.isEditPost &&
              !createPostScreenArgument.preSelectedPost!.postId
                  .startsWith('draft')
          ? createPostScreenArgument.preSelectedPost!.postId
          : currentTime.toString(),
      areaName: currentState.selectedAreaName,
      postedTime: currentTime,
      description: postDescription,
      // TODO: tag a goal here
      taggedGoalIds: [],
    );
    await postRepository.savePost(addedPost);
    // delete draft post
    await postRepository.deletePost('draft_${currentState.selectedAreaName}');
    // update area
    await areaRepository
        .updateAreaWhenAddNewPost(currentState.selectedAreaName);
    await onAreaRated();
    emit(CreateUpdateSuccessState(selectedAreaType: state.selectedAreaType));
  }

  Future<void> onPublishGoals() async {
    final currentState = state as CreatePostLoadedState;
    if (currentState.newlyAddedGoals.isNotEmpty) {
      await goalRepository.setGoals(currentState.newlyAddedGoals.map(
        (goal) {
          final createdTime = DateTime.now();
          return Goal(
            goalId: createdTime.toString(),
            goalDescription: goal.goalDescription,
            areaName: currentState.selectedAreaName,
            createdTime: createdTime,
            achieved: false,
            isPrioritized: false,
          );
        },
      ).toList());
    }
    await onAreaRated();
    emit(CreateGoalSuccessState(selectedAreaType: state.selectedAreaType));
  }

  // TODO: rate an area here
  Future<void> onAreaRated() async {}

  Future<void> onUserWriteUpdate(String update) async {
    final currentState = state as CreatePostLoadedState;
    if (createPostScreenArgument.isEditPost) {
      final editedPost = createPostScreenArgument.preSelectedPost!;
      await postRepository.savePost(editedPost.copyWith(description: update));
    } else {
      final post = Post(
        postId: 'draft_${currentState.selectedAreaName}',
        areaName: currentState.selectedAreaName,
        postedTime: DateTime.now(),
        description: update,
        taggedGoalIds: [],
      );
      await postRepository.savePost(post);
    }
  }
}
