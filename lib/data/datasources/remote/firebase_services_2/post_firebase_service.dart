import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:stepper/data/model2/models2.dart';
import 'package:stepper/data/helpers/firestore_helpers.dart';

class PostFirebaseService {
  FirebaseFirestore firestore;
  PostFirebaseService({required this.firestore});

  Future<List<Post>> getAllPosts() async {
    final userDocSnap = await firestore.userDocument();
    final postsSnap = await userDocSnap.postCollection.get();
    return postsSnap.docs
        .map((doc) => Post.fromJson(doc.data() as Map<String, dynamic>))
        .toList();
  }

  Future<Post> getPostById({required String postId}) async {
    final userDocSnap = await firestore.userDocument();
    final postSnap = await userDocSnap.postCollection.doc(postId).get();
    return Post.fromJson(postSnap.data() as Map<String, dynamic>);
  }

  Future<List<Post>> getPostsByAreaId({required String areaId}) async {
    final userDocSnap = await firestore.userDocument();
    final postsSnap = await userDocSnap.postCollection
        .where("area.id", isEqualTo: areaId)
        .get();
    return postsSnap.docs
        .map((doc) => Post.fromJson(doc.data() as Map<String, dynamic>))
        .toList();
  }

  Stream<List<Post>> subscribePosts() async* {
    final userDocSnap = await firestore.userDocument();
    final postsStream = userDocSnap.postCollection
        .orderBy("updated_at", descending: true)
        .snapshots();
    yield* postsStream.map((snapshot) => snapshot.docs
        .map((doc) => Post.fromJson(doc.data() as Map<String, dynamic>))
        .toList());
  }

  Future<void> createPost({required Map<String, dynamic> data}) async {
    final userDocSnap = await firestore.userDocument();
    final newPostRef = userDocSnap.postCollection.doc();
    await newPostRef.set({
      ...data,
      // Auto set id for post
      "id": newPostRef.id,
      "created_at": FieldValue.serverTimestamp(),
      "updated_at": FieldValue.serverTimestamp()
    });
  }

  Future<void> updatePost(
      {required String postId, required Map<String, dynamic> data}) async {
    final userDocSnap = await firestore.userDocument();
    final postRef = userDocSnap.postCollection.doc(postId);
    await postRef.set({
      ...data,
      "updated_at": FieldValue.serverTimestamp(),
    }, SetOptions(merge: true));
  }
}
