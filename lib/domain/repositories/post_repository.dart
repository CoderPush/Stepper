import 'package:stepper/data/model/models.dart';

abstract class PostRepository{
  Future<void> writeUpdate(Post post);

  Future<List<Post>> getPostByAreaName(String areaName);
}
