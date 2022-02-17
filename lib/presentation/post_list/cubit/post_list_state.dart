import 'package:equatable/equatable.dart';
import 'package:stepper/data/models/models.dart';
import 'package:stepper/enums/enums.dart';

class PostsListState extends Equatable {
  final List<Post> posts;
  final StateStatus fetchingStatus;
  final Area selectedArea;

  const PostsListState(
      {this.posts = const [],
      this.fetchingStatus = StateStatus.initial,
      required this.selectedArea});

  PostsListState copyWith(
          {List<Post>? posts,
          StateStatus? fetchingStatus,
          Area? selectedArea}) =>
      PostsListState(
          posts: posts ?? this.posts,
          fetchingStatus: fetchingStatus ?? this.fetchingStatus,
          selectedArea: selectedArea ?? this.selectedArea);

  @override
  List<Object?> get props => [posts, fetchingStatus];
}
