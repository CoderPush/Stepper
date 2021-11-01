import 'package:stepper/data/model/models.dart';
import 'package:stepper/data/repositories/abstract/post_repository.dart';
import 'package:stepper/dummy_data.dart';

class FakePostRepositoryImpl extends PostRepository {
  @override
  Future<void> writeUpdate(Post post) async {
    // TODO: call post REST API here
    Future.delayed(
      const Duration(seconds: 1),
      () {
        postList.add(post);
      },
    );
  }
}