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
  final String areaName;
  @HiveField(4)
  final DateTime? updatedTime;

  const Post({
    required this.postId,
    required this.areaName,
    required this.postedTime,
    required this.description,
    this.updatedTime,
  });

  Post copyWith({
    String? postId,
    DateTime? postedTime,
    String? description,
    String? areaName,
    DateTime? updatedTime,
  }) {
    return Post(
        areaName: areaName ?? this.areaName,
        description: description ?? this.description,
        postId: postId ?? this.postId,
        postedTime: postedTime ?? this.postedTime,
        updatedTime: updatedTime);
  }

  Map<String, dynamic> toJson() => _postToJson(this);

  Map<String, dynamic> _postToJson(Post post) => <String, dynamic>{
        'areaName': post.areaName,
        'postedTime': post.postedTime,
        'description': post.description,
        'updatedTime': post.updatedTime,
      };
}

enum CreatePostMode { writeUpdate, setGoal }
