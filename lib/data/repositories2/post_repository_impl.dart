import 'package:stepper/data/datasources/remote/firebase_services_2/firebase_services.dart';
import 'package:stepper/data/model2/models2.dart';
import 'package:stepper/domain/repositories2/repositories2.dart';

class PostRepositoryImpl implements PostRepository {
  PostFirebaseService postFirebaseService;

  PostRepositoryImpl({required this.postFirebaseService});

  @override
  Future<List<Post>> getAllPosts() async {
    return postFirebaseService.getAllPosts();
  }

  @override
  Future<Post> getPostById({required String postId}) async {
    return postFirebaseService.getPostById(postId: postId);
  }

  @override
  Future<void> createPost({required Post post}) {
    final data = post.toJson();
    return postFirebaseService.createPost(data: data);
  }

  @override
  Future<void> updatePost({required String postId, required Post updatedPost}) {
    final data = updatedPost.toJson();
    return postFirebaseService.updatePost(postId: postId, data: data);
  }

  @override
  Stream<List<Post>> subscribePosts() {
    return postFirebaseService.subscribePosts();
  }
}
