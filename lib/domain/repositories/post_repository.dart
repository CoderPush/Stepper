import 'package:stepper/data/model/models.dart';

abstract class PostRepository {
  Future<void> savePost(Post post);

  Future<List<Post>> getPostsByAreaName(String areaName);

  Future<Post?> getDraftPostByAreaName(String areaName);

  Future<void> deletePost(String postId);
}
