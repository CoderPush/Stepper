import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stepper/data/models/models.dart';
import 'package:stepper/domain/repositories/repositories.dart';
import 'package:stepper/enums/enums.dart';
import 'package:stepper/presentation/post_list/cubit/post_list_state.dart';

class PostsListCubit extends Cubit<PostsListState> {
  PostRepository postRepository;
  Area selectedArea;

  PostsListCubit({required this.postRepository, required this.selectedArea})
      : super(PostsListState(selectedArea: selectedArea)) {
    _init();
  }

  _init() {
    _getPosts();
  }

  _getPosts() async {
    try {
      emit(state.copyWith(fetchingStatus: StateStatus.loading));
      final posts =
          await postRepository.getPostsByAreaId(areaId: state.selectedArea.id);
      emit(state.copyWith(posts: posts, fetchingStatus: StateStatus.success));
    } catch (error) {
      emit(state.copyWith(fetchingStatus: StateStatus.failure));
    }
  }
}
