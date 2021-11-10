import 'package:stepper/data/datasources/local/post_database.dart';
import 'package:stepper/data/model/models.dart';
import 'package:stepper/domain/repositories/post_repository.dart';

class FakePostRepositoryImpl extends PostRepository {
  final PostDatabase postDatabase;

  FakePostRepositoryImpl({required this.postDatabase}) : super();

  @override
  Future<void> savePost(Post post) async {
    await postDatabase.addPost(post);
  }

  @override
  Future<List<Post>> getPostsByAreaName(String areaName) async {
    // TODO: check network status and call post REST API here
    return await postDatabase.getPostsByAreaName(areaName);
  }

  @override
  Future<Post?> getDraftPostByAreaName(String areaName) async {
    return await postDatabase.getDraftPostByAreaName(areaName);
  }

  @override
  Future<void> deletePost(String postId) async {
    await postDatabase.deletePost(postId);
  }
}
