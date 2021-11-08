import 'package:stepper/data/datasources/local/post_database.dart';
import 'package:stepper/data/model/models.dart';
import 'package:stepper/domain/repositories/post_repository.dart';

class FakePostRepositoryImpl extends PostRepository {
  final PostDatabase postDatabase;

  FakePostRepositoryImpl({required this.postDatabase}) : super();

  @override
  Future<void> writeUpdate(Post post) async {
    // TODO: check network status and call post REST API here
    Future.delayed(
      const Duration(seconds: 1),
      () async {
        await postDatabase.addPost(post);
      },
    );
  }

  @override
  Future<List<Post>> getPostByAreaName(String areaName) async {
    // TODO: check network status and call post REST API here
    return await postDatabase.getPostByAreaName(areaName);
  }
}
