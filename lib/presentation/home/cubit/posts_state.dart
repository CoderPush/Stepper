import 'package:equatable/equatable.dart';
import 'package:stepper/data/models/models.dart';
import 'package:stepper/enums/enums.dart';

class PostsState extends Equatable {
  final List<Post> posts;
  final StateStatus status;

  const PostsState({
    this.status = StateStatus.initial,
    this.posts = const [],
  });

  PostsState copyWith({List<Post>? posts, StateStatus? status}) =>
      PostsState(posts: posts ?? this.posts, status: status ?? this.status);

  @override
  get props => [
        posts,
        status,
      ];
}
