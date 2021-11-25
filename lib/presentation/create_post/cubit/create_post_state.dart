part of 'create_post_cubit.dart';

@immutable
abstract class CreatePostState extends Equatable {
  final AreaType selectedAreaType;
  const CreatePostState({required this.selectedAreaType});
  @override
  List<Object?> get props => [selectedAreaType];
}

class CreatePostInitialState extends CreatePostState {
  const CreatePostInitialState({required AreaType selectedAreaType})
      : super(selectedAreaType: selectedAreaType);
}

class CreatePostLoadingState extends CreatePostState {
  const CreatePostLoadingState({required AreaType selectedAreaType})
      : super(selectedAreaType: selectedAreaType);
}

class CreatePostLoadedState extends CreatePostState {
  final List<Area> areaList;
  final String selectedAreaName;
  final int areaRating;
  final CreatePostMode createPostMode;
  final List<Goal> newlyAddedGoals;
  final Post? draftPost;
  final List<String> bandList;
  final String selectedBandName;

  const CreatePostLoadedState({
    required this.areaList,
    required selectedAreaType,
    required this.selectedAreaName,
    this.areaRating = 0,
    this.createPostMode = CreatePostMode.writeUpdate,
    this.newlyAddedGoals = const [],
    this.draftPost,
    required this.bandList,
    required this.selectedBandName,
  }) : super(selectedAreaType: selectedAreaType);

  CreatePostLoadedState copyWith({
    List<Area>? areaList,
    AreaType? selectedAreaType,
    String? selectedAreaName,
    int? areaRating,
    CreatePostMode? createPostMode,
    List<Goal>? newlyAddedGoals,
    Post? draftPost,
    List<String>? bandList,
    String? selectedBandName,
  }) {
    return CreatePostLoadedState(
      areaList: areaList ?? this.areaList,
      selectedAreaType: selectedAreaType ?? this.selectedAreaType,
      selectedAreaName: selectedAreaName ?? this.selectedAreaName,
      areaRating: areaRating ?? this.areaRating,
      createPostMode: createPostMode ?? this.createPostMode,
      newlyAddedGoals: newlyAddedGoals ?? this.newlyAddedGoals,
      draftPost: draftPost,
      bandList: bandList ?? this.bandList,
      selectedBandName: selectedBandName ?? this.selectedBandName,
    );
  }

  @override
  List<Object?> get props => [
        areaList,
        selectedAreaType,
        selectedAreaName,
        areaRating,
        createPostMode,
        newlyAddedGoals,
        draftPost,
        selectedBandName,
      ];
}

class CreatePostErrorState extends CreatePostState {
  final String errorMessage;
  const CreatePostErrorState(
      {required this.errorMessage, required selectedAreaType})
      : super(selectedAreaType: selectedAreaType);
}

class CreateUpdateSuccessState extends CreatePostState {
  const CreateUpdateSuccessState({required selectedAreaType})
      : super(selectedAreaType: selectedAreaType);
}

class CreateGoalSuccessState extends CreatePostState {
  const CreateGoalSuccessState({required selectedAreaType})
      : super(selectedAreaType: selectedAreaType);
}
