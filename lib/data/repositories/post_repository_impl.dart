import 'package:stepper/data/datasources/local/post_database.dart';
import 'package:stepper/data/datasources/remote/services.dart';
import 'package:stepper/data/model/models.dart';
import 'package:stepper/domain/repositories/post_repository.dart';
import 'package:stepper/domain/repositories/repositories.dart';

class PostRepositoryImpl extends PostRepository {
  final PostDatabase postDatabase;
  final PostService postService;

  PostRepositoryImpl({required this.postDatabase, required this.postService})
      : super();

  @override
  Future<void> savePost(Post post) async {
    await postService.savePost(post);
    await postDatabase.addPost(post);
  }

  @override
  Future<List<Post>> getPostsByAreaName(String areaName) async {
    return await postDatabase.getPostsByAreaName(areaName);
  }

  @override
  Future<Post?> getDraftPostByAreaName(String areaName) async {
    return await postDatabase.getDraftPostByAreaName(areaName);
  }

  @override
  Future<void> deletePost(String postId) async {
    await postService.deletePost(postId);
    await postDatabase.deletePost(postId);
  }

  @override
  Future<Post?> getPostById(String? postId) async {
    if (postId == null) return null;
    return await postDatabase.getPostById(postId);
  }
}
