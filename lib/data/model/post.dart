import 'package:stepper/presentation/utils.dart';

class Post {
  final String postId;
  final DateTime? postedTime;
  final String description;
  final String areaName;
  final String? imageUrl;
  final String createdBy;

  const Post({
    required this.postId,
    required this.areaName,
    required this.postedTime,
    required this.description,
    required this.createdBy,
    this.imageUrl,
  });

  Post copyWith({
    String? postId,
    DateTime? postedTime,
    String? description,
    String? areaName,
    String? imageUrl,
    String? createdBy,
  }) {
    return Post(
      areaName: areaName ?? this.areaName,
      description: description ?? this.description,
      postId: postId ?? this.postId,
      postedTime: postedTime ?? this.postedTime,
      imageUrl: imageUrl ?? imageUrl,
      createdBy: createdBy ?? this.createdBy,
    );
  }

  Map<String, dynamic> toJson() => _postToJson(this);

  Map<String, dynamic> _postToJson(Post post) => <String, dynamic>{
        'areaName': post.areaName,
        'postedTime': post.postedTime,
        'description': post.description,
        'postId': post.postId,
        'imageUrl': post.imageUrl,
        'createdBy': post.createdBy,
      };

  factory Post.fromJson(Map<String, dynamic> json) => Post(
        areaName: json['areaName'],
        description: json['description'],
        postId: json['postId'],
        postedTime:
            json['postedTime'] != null ? parseTime(json['postedTime']) : null,
        imageUrl: json['imageUrl'],
        createdBy: json['createdBy'] ?? '',
      );
}

enum CreatePostMode { writeUpdate, setGoal }
