part of 'create_post_cubit.dart';

@immutable
abstract class CreatePostState extends Equatable {
  final AreaType selectedAreaType;
  const CreatePostState({required this.selectedAreaType});
  @override
  List<Object?> get props => [];
}

class CreatePostInitialState extends CreatePostState {
  const CreatePostInitialState({required selectedAreaType})
      : super(selectedAreaType: selectedAreaType);
}

class CreatePostLoadingState extends CreatePostState {
  const CreatePostLoadingState({required selectedAreaType})
      : super(selectedAreaType: selectedAreaType);
}

class CreatePostLoadedState extends CreatePostState {
  final List<Area> areaList;
  final String selectedAreaName;
  final int areaRating;

  const CreatePostLoadedState({
    required this.areaList,
    required selectedAreaType,
    required this.selectedAreaName,
    this.areaRating = 0,
  }) : super(selectedAreaType: selectedAreaType);

  CreatePostLoadedState copyWith({
    List<Area>? areaList,
    AreaType? selectedAreaType,
    String? selectedAreaName,
    int? areaRating,
  }) {
    return CreatePostLoadedState(
      areaList: areaList ?? this.areaList,
      selectedAreaType: selectedAreaType ?? this.selectedAreaType,
      selectedAreaName: selectedAreaName ?? this.selectedAreaName,
      areaRating: areaRating ?? this.areaRating,
    );
  }

  @override
  List<Object?> get props =>
      [areaList, selectedAreaType, selectedAreaName, areaRating];
}

class CreatePostErrorState extends CreatePostState {
  final String errorMessage;
  const CreatePostErrorState(
      {required this.errorMessage, required selectedAreaType})
      : super(selectedAreaType: selectedAreaType);
}
