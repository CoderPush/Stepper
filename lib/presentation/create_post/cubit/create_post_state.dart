part of 'create_post_cubit.dart';

@immutable
abstract class CreatePostState {
  final AreaType selectedAreaType;
  final String areaName;
  final int areaRating;
  const CreatePostState({
    required this.selectedAreaType,
    required this.areaName,
    required this.areaRating,
  });
}

class CreatePostInitial extends CreatePostState {
  const CreatePostInitial()
      : super(
          areaName: defaultAreaName,
          areaRating: 0,
          selectedAreaType: AreaType.scope,
        );
}

class CreatePostChangeAreaType extends CreatePostState {
  const CreatePostChangeAreaType({
    required selectedAreaType,
    required areaName,
    required areaRating,
  }) : super(
          selectedAreaType: selectedAreaType,
          areaName: areaName,
          areaRating: areaRating,
        );
}

class CreatePostChangeAreaName extends CreatePostState {
  const CreatePostChangeAreaName({
    required selectedAreaType,
    required areaName,
    required areaRating,
  }) : super(
          selectedAreaType: selectedAreaType,
          areaName: areaName,
          areaRating: areaRating,
        );
}

class CreatePostChangeAreaRating extends CreatePostState {
  const CreatePostChangeAreaRating({
    required selectedAreaType,
    required areaName,
    required areaRating,
  }) : super(
          selectedAreaType: selectedAreaType,
          areaName: areaName,
          areaRating: areaRating,
        );
}
