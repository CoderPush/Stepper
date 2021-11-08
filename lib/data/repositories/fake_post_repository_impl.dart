import 'package:stepper/data/datasources/local/post_database.dart';
import 'package:stepper/data/model/models.dart';
import 'package:stepper/data/network/network_status.dart';
import 'package:stepper/domain/repositories/post_repository.dart';
import 'package:stepper/injection_container.dart';

class FakePostRepositoryImpl extends PostRepository {
  final PostDatabase postDatabase;

  FakePostRepositoryImpl({required this.postDatabase}) : super();

  @override
  Future<void> writeUpdate(Post post) async {
    NetworkStatus networkStatus = sl();
    final isConnected = await networkStatus.isConnected;
    // TODO: check network status and call post REST API here
    if (isConnected == true) {}
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
