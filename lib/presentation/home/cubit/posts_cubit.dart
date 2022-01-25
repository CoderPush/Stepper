import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stepper/data/datasources/remote/services.dart';
import 'package:stepper/data/model/post.dart';
import 'package:stepper/domain/repositories/post_repository.dart';
import 'package:stepper/enums/enums.dart';
import 'package:stepper/presentation/home/cubit/posts_state.dart';

class PostsCubit extends Cubit<PostsState> {
  final PostRepository postRepository;
  final SettingFirebaseService settingFirebaseService;
  StreamSubscription<List<Post>>? _postStreamSubscription;

  PostsCubit(
      {required this.postRepository, required this.settingFirebaseService})
      : super(const PostsState()) {
    getPosts();
  }

  Future<void> getPosts() async {
    try {
      emit(state.copyWith(status: CubitStateStatus.loading));

      _postStreamSubscription =
          postRepository.watchAllPosts().listen((postList) async {
        final areaNames =
            await settingFirebaseService.getParentAndChildrenAreaNames();
        final posts =
            postList.where((post) => areaNames.contains(post.areaName)).toList()
              ..sort((first, next) => first.postedTime == null
                  ? next.postedTime == null
                      ? 0
                      : 1
                  : next.postedTime == null
                      ? 0
                      : next.postedTime!.compareTo(first.postedTime!));
        emit(state.copyWith(status: CubitStateStatus.success, posts: posts));
      });
    } on Exception {
      emit(state.copyWith(status: CubitStateStatus.failure));
    }
  }

  @override
  Future<void> close() {
    _postStreamSubscription?.cancel();
    return super.close();
  }
}
