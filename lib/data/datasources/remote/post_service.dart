import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:stepper/data/helpers/firestore_helpers.dart';
import 'package:stepper/data/model/models.dart';

class PostService {
  final FirebaseFirestore firestore;

  PostService({required this.firestore});

  Future<void> savePost(Post post) async {
    final userDoc = await firestore.userDocument();
    await userDoc.postCollection.doc(post.postId).set(post.toJson());
  }

  Future<void> deletePost(String postId) async {
    final userDoc = await firestore.userDocument();
    await userDoc.postCollection.doc(postId).delete();
  }

  Future<bool> checkPostExist(String postId) async {
    final userDoc = await firestore.userDocument();
    final postSnapshot = await userDoc.postCollection.doc(postId).get();
    return postSnapshot.exists;
  }
}
