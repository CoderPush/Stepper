import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:stepper/data/model/models.dart';
import 'package:stepper/data/repositories/repositories_impl.dart';
import 'package:stepper/domain/repositories/repositories.dart';

part 'post_list_state.dart';

class PostListCubit extends Cubit<PostListState> {
  final PostRepository postRepository;
  final Area area;
  StreamSubscription<List<Post>>? _postStreamSubscription;

  PostListCubit({required this.postRepository, required this.area})
      : super(PostListInitialState(area: area)) {
    loadPostListScreen();
  }

  Future<void> loadPostListScreen() async {
    try {
      emit(PostListLoadingState(area: area));
      _postStreamSubscription =
          postRepository.watchAllPosts().listen((postList) {
        final postListByArea =
            postList.where((post) => post.areaName == area.areaName).toList();
        emit(PostListLoadedState(postList: postListByArea, area: area));
      }, cancelOnError: true);
    } on NetworkException {
      emit(PostListErrorState(errorMessage: 'Network error', area: area));
    }
  }

  @override
  Future<void> close() async {
    await _postStreamSubscription?.cancel();
    return super.close();
  }
}
