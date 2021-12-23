import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:stepper/data/model/models.dart';

abstract class PostRepository {
  Future<void> savePost(Post post);

  Future<UploadTask?> uploadImage(File file);

  Future<List<Post>> getPostsByAreaName(String areaName);

  Future<Post?> getPostById(String? postId);

  Future<Post?> getDraftPostByAreaName(String areaName);

  Future<void> deletePost(String postId);

  Stream<List<Post>> watchAllPosts();
}
