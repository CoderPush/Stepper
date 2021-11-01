class Post {
  final DateTime postedTime;
  final String description;
  final String? imageUrl;
  final String areaName;
  final List<int> taggedGoalIds;

  const Post({
    required this.areaName,
    required this.postedTime,
    required this.description,
    this.imageUrl,
    required this.taggedGoalIds,
  });
}

enum CreatePostMode { writeUpdate, setGoal }
