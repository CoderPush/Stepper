import 'package:stepper/data/datasources/firebase_service/firebase_services.dart';
import 'package:stepper/data/models/models.dart';
import 'package:stepper/domain/repositories/repositories.dart';

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
  Future<List<Post>> getPostsByAreaId({required String areaId}) {
    return postFirebaseService.getPostsByAreaId(areaId: areaId);
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
