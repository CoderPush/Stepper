import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stepper/data/models/models.dart';
import 'package:stepper/domain/repositories/repositories.dart';
import 'package:stepper/enums/enums.dart';
import 'package:stepper/presentation/home/cubit/posts_state.dart';

class PostsCubit extends Cubit<PostsState> {
  final PostRepository postRepository;
  late StreamSubscription<List<Post>> _postStreamSubscription;

  PostsCubit({required this.postRepository}) : super(const PostsState()) {
    getPosts();
  }

  Future<void> getPosts() async {
    try {
      emit(state.copyWith(status: StateStatus.loading));
      // TODO: have to fetch posts that relate to user current band
      _postStreamSubscription = postRepository.subscribePosts().listen((posts) {
        emit(state.copyWith(status: StateStatus.success, posts: posts));
      });
    } on Exception {
      emit(state.copyWith(status: StateStatus.failure));
    }
  }

  @override
  Future<void> close() {
    _postStreamSubscription.cancel();
    return super.close();
  }
}
