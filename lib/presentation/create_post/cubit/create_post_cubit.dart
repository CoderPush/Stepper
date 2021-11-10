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

part 'create_post_state.dart';

class CreatePostCubit extends Cubit<CreatePostState> {
  final AreaRepository areaRepository;
  final PostRepository postRepository;
  final GoalRepository goalRepository;

  CreatePostCubit({
    required this.areaRepository,
    required this.postRepository,
    required this.goalRepository,
    Area? preSelectedArea,
  }) : super(const CreatePostInitialState(selectedAreaType: AreaType.scope)) {
    if (preSelectedArea != null) {
      getAreas(
        preSelectedArea.areaType,
        preSelectedAreaName: preSelectedArea.areaName,
      );
    } else {
      getAreas(AreaType.scope);
    }
  }

  Future<void> getAreas(AreaType areaType,
      {String? preSelectedAreaName}) async {
    try {
      emit(CreatePostLoadingState(selectedAreaType: areaType));
      final areaList = await areaRepository.fetchAreasByType(areaType);
      final selectedAreaName = preSelectedAreaName ?? areaList[0].areaName;
      final draftPost =
          await postRepository.getDraftPostByAreaName(selectedAreaName);
      emit(CreatePostLoadedState(
        areaList: areaList,
        selectedAreaType: areaType,
        selectedAreaName: selectedAreaName,
        draftPost: draftPost,
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
    emit(currentState.copyWith(
      selectedAreaName: areaName,
      draftPost: draftPost,
    ));
  }

  void onChangeAreaRating(int areaRating) {
    final currentState = state as CreatePostLoadedState;
    emit(currentState.copyWith(areaRating: areaRating));
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
      postId: currentTime.toString(),
      areaName: currentState.selectedAreaName,
      postedTime: currentTime,
      description: postDescription,
      // TODO: tag a goal here
      taggedGoalIds: [],
    );
    await postRepository.savePost(addedPost);
    // delete draft post
    await postRepository.deletePost('draft_${currentState.selectedAreaName}');
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
