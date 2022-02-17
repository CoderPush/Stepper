import 'package:equatable/equatable.dart';
import 'package:stepper/data/models/models.dart';

enum CreatePostScreenMode { createNew, edit }

class CreatePostArgs {
  CreatePostScreenMode mode;
  Post? post;

  CreatePostArgs({this.mode = CreatePostScreenMode.createNew, this.post});
}

class CreatePostState extends Equatable {
  final Post? post;
  final Band selectedBand;
  final List<Band> bands;
  final AreaType selectedAreaType;
  final Area selectedArea;
  final List<Area> areas;
  final User user;
  final CreatePostScreenMode mode;
  final bool shouldCreateDraft;
  final bool ready;
  final bool isLoadingAreas;

  CreatePostState(
      {this.post,
      selectedBand,
      this.bands = const [],
      this.selectedAreaType = AreaType.scope,
      selectedArea,
      this.areas = const [],
      user,
      this.mode = CreatePostScreenMode.createNew,
      this.shouldCreateDraft = true,
      this.ready = false,
      this.isLoadingAreas = false})
      : selectedBand = selectedBand ?? Band.empty,
        selectedArea = selectedArea ?? Area.empty,
        user = user ?? User.empty;

  CreatePostState copyWith(
          {Post? post,
          Band? selectedBand,
          List<Band>? bands,
          AreaType? selectedAreaType,
          Area? selectedArea,
          List<Area>? areas,
          User? user,
          CreatePostScreenMode? mode,
          bool? shouldCreateDraft,
          bool? ready,
          bool? isLoadingAreas}) =>
      CreatePostState(
          post: post ?? this.post,
          selectedBand: selectedBand ?? this.selectedBand,
          bands: bands ?? this.bands,
          selectedAreaType: selectedAreaType ?? this.selectedAreaType,
          selectedArea: selectedArea ?? this.selectedArea,
          areas: areas ?? this.areas,
          user: user ?? this.user,
          mode: mode ?? this.mode,
          shouldCreateDraft: shouldCreateDraft ?? this.shouldCreateDraft,
          ready: ready ?? this.ready,
          isLoadingAreas: isLoadingAreas ?? this.isLoadingAreas);

  @override
  List<Object?> get props => [
        post,
        selectedBand,
        bands,
        selectedAreaType,
        selectedArea,
        areas,
        user,
        mode,
        shouldCreateDraft,
        ready,
        isLoadingAreas
      ];
}
