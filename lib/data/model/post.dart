class Post {
  final DateTime postedTime;
  final String description;
  final String? imageUrl;
  final String areaName;

  const Post({
    required this.areaName,
    required this.postedTime,
    required this.description,
    this.imageUrl,
  });
}
