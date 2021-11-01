import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:stepper/data/model/area.dart';
import 'package:stepper/data/model/models.dart';
import 'package:stepper/data/repositories/abstract/area_repository.dart';
import 'package:stepper/data/repositories/abstract/post_repository.dart';
import 'package:stepper/data/repositories/fake_repos/fake_repos.dart';

part 'create_post_state.dart';

class CreatePostCubit extends Cubit<CreatePostState> {
  final AreaRepository areaRepository;
  final PostRepository postRepository;
  final TextEditingController writeUpdateController;

  CreatePostCubit({
    required this.areaRepository,
    required this.postRepository,
    required this.writeUpdateController,
  }) : super(const CreatePostInitialState(selectedAreaType: AreaType.scope)) {
    getAreas(AreaType.scope);
  }

  Future<void> getAreas(AreaType areaType) async {
    try {
      emit(CreatePostLoadingState(selectedAreaType: areaType));
      final areaList = await areaRepository.fetchAreas(areaType);
      final firstSelectedAreaName = areaList[0].areaName;
      emit(CreatePostLoadedState(
        areaList: areaList,
        selectedAreaType: areaType,
        selectedAreaName: firstSelectedAreaName,
      ));
    } on NetworkException {
      emit(CreatePostErrorState(
        errorMessage: 'Network error',
        selectedAreaType: areaType,
      ));
    }
  }

  void onChangeAreaName(String areaName) {
    final currentState = state as CreatePostLoadedState;
    emit(currentState.copyWith(selectedAreaName: areaName));
  }

  void onChangeAreaRating(int areaRating) {
    final currentState = state as CreatePostLoadedState;
    emit(currentState.copyWith(areaRating: areaRating));
  }

  void onCreatePostModeChange(CreatePostMode createPostMode) {
    final currentState = state as CreatePostLoadedState;
    emit(currentState.copyWith(createPostMode: createPostMode));
  }

  Future<void> onWriteUpdate() async {
    final currentState = state as CreatePostLoadedState;
    final addedPost = Post(
      areaName: currentState.selectedAreaName,
      postedTime: DateTime.now(),
      description: writeUpdateController.text,
      taggedGoalIds: [1, 2],
    );
    await postRepository.writeUpdate(addedPost);
  }
}
