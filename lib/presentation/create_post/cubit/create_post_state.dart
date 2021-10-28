part of 'create_post_cubit.dart';

@immutable
abstract class CreatePostState {
  final AreaType selectedAreaType;
  const CreatePostState({required this.selectedAreaType});
}

class CreatePostInitial extends CreatePostState {
  const CreatePostInitial({required selectedAreaType})
      : super(selectedAreaType: selectedAreaType);
}
