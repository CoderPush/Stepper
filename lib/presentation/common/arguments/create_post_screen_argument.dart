import 'package:stepper/data/model/models.dart';

class CreatePostScreenArgument {
  final Area? preSelectedArea;
  final Post? preSelectedPost;
  final bool isEditPost;

  CreatePostScreenArgument({
    this.preSelectedArea,
    this.preSelectedPost,
    this.isEditPost = false,
  });
}
