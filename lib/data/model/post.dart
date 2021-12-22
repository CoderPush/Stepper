import 'package:hive/hive.dart';
import 'package:stepper/presentation/utils.dart';

part 'post.g.dart';

@HiveType(typeId: 0)
class Post {
  @HiveField(0)
  final String postId;
  @HiveField(1)
  final DateTime? postedTime;
  @HiveField(2)
  final String description;
  @HiveField(3)
  final String areaName;

  const Post({
    required this.postId,
    required this.areaName,
    required this.postedTime,
    required this.description,
  });

  Post copyWith({
    String? postId,
    DateTime? postedTime,
    String? description,
    String? areaName,
  }) {
    return Post(
      areaName: areaName ?? this.areaName,
      description: description ?? this.description,
      postId: postId ?? this.postId,
      postedTime: postedTime ?? this.postedTime,
    );
  }

  Map<String, dynamic> toJson() => _postToJson(this);

  Map<String, dynamic> _postToJson(Post post) => <String, dynamic>{
        'areaName': post.areaName,
        'postedTime': post.postedTime,
        'description': post.description,
        'postId': post.postId,
      };

  factory Post.fromJson(Map<String, dynamic> json) => Post(
        areaName: json['areaName'],
        description: json['description'],
        postId: json['postId'],
        postedTime:
            json['postedTime'] != null ? parseTime(json['postedTime']) : null,
      );
}

enum CreatePostMode { writeUpdate, setGoal }
