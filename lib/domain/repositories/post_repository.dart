import 'package:stepper/data/model/models.dart';

abstract class PostRepository {
  Future<void> savePost(Post post);

  Future<List<Post>> getPostsByAreaName(String areaName);

  Future<Post?> getPostById(String? postId);

  Future<Post?> getDraftPostByAreaName(String areaName);

  Future<void> deletePost(String postId);

  Stream<List<Post>> watchAllPosts();
}
