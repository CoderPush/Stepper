import 'package:equatable/equatable.dart';
import 'package:stepper/data/model/post.dart';
import 'package:stepper/enums/enums.dart';

class PostsState extends Equatable {
  final List<Post> posts;
  final CubitStateStatus status;

  const PostsState({
    this.status = CubitStateStatus.initial,
    this.posts = const [],
  });

  PostsState copyWith({List<Post>? posts, CubitStateStatus? status}) =>
      PostsState(posts: posts ?? this.posts, status: status ?? this.status);

  @override
  get props => [
        posts,
        status,
      ];
}
