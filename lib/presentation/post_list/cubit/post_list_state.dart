part of 'post_list_cubit.dart';

abstract class PostListState extends Equatable {
  final Area area;
  const PostListState({required this.area});

  @override
  List<Object> get props => [];
}

class PostListInitialState extends PostListState {
  const PostListInitialState({required Area area}) : super(area: area);
}

class PostListLoadingState extends PostListState {
  const PostListLoadingState({required Area area}) : super(area: area);
}

class PostListLoadedState extends PostListState {
  final List<Post> postList;

  const PostListLoadedState({required this.postList, required Area area})
      : super(area: area);

  @override
  List<Object> get props => [postList];
}

class PostListErrorState extends PostListState {
  final String errorMessage;
  const PostListErrorState({required this.errorMessage, required Area area})
      : super(area: area);
}
