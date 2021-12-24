import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:stepper/data/datasources/remote/services.dart';
import 'package:stepper/data/model/models.dart';
import 'package:stepper/domain/repositories/post_repository.dart';
import 'package:stepper/domain/repositories/repositories.dart';

class PostRepositoryImpl extends PostRepository {
  final PostFirebaseService postFirebaseService;

  PostRepositoryImpl({required this.postFirebaseService}) : super();

  @override
  Future<void> savePost(Post post) async {
    await postFirebaseService.savePost(post);
  }

  @override
  Future<List<Post>> getPostsByAreaName(String areaName) async {
    return await postFirebaseService.getPostsByAreaName(areaName);
  }

  @override
  Future<Post?> getDraftPostByAreaName(String areaName) async {
    return await postFirebaseService.getDraftPostByAreaName(areaName);
  }

  @override
  Future<void> deletePost(String postId) async {
    await postFirebaseService.deletePost(postId);
  }

  @override
  Future<Post?> getPostById(String? postId) async {
    if (postId == null) return null;
    return await postFirebaseService.getPostById(postId);
  }

  @override
  Stream<List<Post>> watchAllPosts() async* {
    yield* postFirebaseService.watchAllPost();
  }

  @override
  Future<UploadTask?> uploadImage(File file) async {
    return postFirebaseService.uploadFile(file);
  }
}
