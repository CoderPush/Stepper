import 'package:hive/hive.dart';

part 'post.g.dart';

@HiveType(typeId: 0)
class Post {
  @HiveField(0)
  final String postId;
  @HiveField(1)
  final DateTime postedTime;
  @HiveField(2)
  final String description;
  @HiveField(3)
  final String? imageUrl;
  @HiveField(4)
  final String areaName;
  @HiveField(5)
  final List<String> taggedGoalIds;

  const Post({
    required this.postId,
    required this.areaName,
    required this.postedTime,
    required this.description,
    this.imageUrl,
    required this.taggedGoalIds,
  });

  Post copyWith({
    String? postId,
    DateTime? postedTime,
    String? description,
    String? imageUrl,
    String? areaName,
    List<String>? taggedGoalIds,
  }) {
    return Post(
      areaName: areaName ?? this.areaName,
      description: description ?? this.description,
      postId: postId ?? this.postId,
      postedTime: postedTime ?? this.postedTime,
      taggedGoalIds: taggedGoalIds ?? this.taggedGoalIds,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }
}

enum CreatePostMode { writeUpdate, setGoal }
