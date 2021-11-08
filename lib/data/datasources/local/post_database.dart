import 'package:hive/hive.dart';
import 'package:stepper/data/model/models.dart';

class PostDatabase {
  final _boxName = "Post";

  // open a box
  Future<Box<Post>> postBox() async {
    var box = await Hive.openBox<Post>(_boxName);
    return box;
  }

  // get post by area name
  Future<List<Post>> getPostByAreaName(String areaName) async {
    final box = await postBox();
    return box.values
        .toList()
        .where((post) => post.areaName == areaName)
        .toList();
  }

  // to add post in box
  Future<void> addPost(Post post) async {
    final box = await postBox();

    await box.put(post.postedTime.toString(), post);
  }

  // delete post from box
  Future<void> deletePost(String postId) async {
    final box = await postBox();
    await box.delete(postId);
  }

  // delete all posts from box
  Future<void> deleteAllPosts() async {
    final box = await postBox();
    await box.clear();
  }

  // update post
  Future<void> updatePost(Post post) async {
    final box = await postBox();
    await box.put(post.postedTime.toString(), post);
  }
}
