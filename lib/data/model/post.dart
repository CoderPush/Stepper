import 'package:hive/hive.dart';

part 'post.g.dart';

@HiveType(typeId: 0)
class Post {
  @HiveField(0)
  final DateTime postedTime;
  @HiveField(1)
  final String description;
  @HiveField(2)
  final String? imageUrl;
  @HiveField(3)
  final String areaName;
  @HiveField(4)
  final List<String> taggedGoalIds;

  const Post({
    required this.areaName,
    required this.postedTime,
    required this.description,
    this.imageUrl,
    required this.taggedGoalIds,
  });
}

enum CreatePostMode { writeUpdate, setGoal }
