import 'package:stepper/data/model2/models2.dart';

abstract class PostRepository {
  Future<List<Post>> getAllPosts();

  Future<Post> getPostById({required String postId});

  Future<List<Post>> getPostsByAreaId({required String areaId});

  Future<void> createPost({required Post post});

  Future<void> updatePost({required String postId, required Post updatedPost});

  Stream<List<Post>> subscribePosts();
}
