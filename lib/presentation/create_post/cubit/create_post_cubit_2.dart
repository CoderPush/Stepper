import 'dart:async';
import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stepper/data/model2/models2.dart';
import 'package:stepper/domain/repositories2/repositories2.dart';
import 'package:stepper/presentation/create_post/cubit/create_post_state_2.dart';
import 'package:stepper/presentation/utils.dart';

class CreatePostCubit2 extends Cubit<CreatePostState2> {
  UserRepository userRepository;
  PostRepository postRepository;
  AreaRepository areaRepository;
  BandRepository bandRepository;
  CreatePostArgs args;

  CreatePostCubit2(
      {required this.userRepository,
      required this.areaRepository,
      required this.postRepository,
      required this.bandRepository,
      required this.args})
      : super(CreatePostState2()) {
    _init();
  }

  // Load all prepared data
  // for create post mode
  _init() async {
    if (args.mode == CreatePostScreenMode.edit) {
      _initForEditMode();
    } else if (args.mode == CreatePostScreenMode.createNew) {
      _initForCreateNewMode();
    }
  }

  _initForCreateNewMode() async {
// For create mode
    User user = await userRepository.getUser();
    List<Band> bands = await bandRepository.getBandsByProfessionType(
        professionType: user.currentProfession.type);

    final areas =
        await _getAreas(areaType: AreaType.scope, band: user.currentBand);

    final selectedArea = areas[0];
    emit(state.copyWith(
        selectedBand: user.currentBand,
        bands: bands,
        selectedAreaType: selectedArea.type,
        selectedArea: selectedArea,
        areas: areas,
        user: user,
        mode: args.mode,
        ready: true,
        isLoadingAreas: false,
        shouldCreateDraft: true));
  }

  _initForEditMode() async {
    final post = args.post;
    final selectedArea = post!.area;

    User user = await userRepository.getUser();
    List<Band> bands = await bandRepository.getBandsByProfessionType(
        professionType: user.currentProfession.type);

    final selectedBand = getItemByName<Band>(
        list: bands, name: selectedArea.bandId, getter: (band) => band.id);

    final areas =
        await _getAreas(areaType: selectedArea.type, band: selectedBand);

    emit(state.copyWith(
        post: args.post,
        selectedBand: selectedBand, // depend on post.area
        bands: bands,
        selectedAreaType: selectedArea.type,
        selectedArea: selectedArea,
        areas: areas, //depend on post.ara
        user: user,
        mode: args.mode,
        ready: true,
        isLoadingAreas: false,
        shouldCreateDraft: false));
  }

  Future<List<Area>> _getAreas({AreaType? areaType, Band? band}) async {
    emit(state.copyWith(isLoadingAreas: true));
    final selectedAreaType = areaType ?? state.selectedAreaType;
    final selectedBand = band ?? state.selectedBand;

    final userAreas = await areaRepository.getUserAreasByAreaTypeAndBandId(
        bandId: selectedBand.id, areaType: selectedAreaType);

    emit(state.copyWith(isLoadingAreas: false));

    return userAreas;
  }

  onAreaTypeChanged(AreaType areaType) async {
    emit(state.copyWith(selectedAreaType: areaType));
    final areas = await _getAreas();
    emit(state.copyWith(areas: areas, selectedArea: areas[0]));
  }

  onAreaChanged(String areaName) {
    final selectedArea = getItemByName<Area>(
        list: state.areas, name: areaName, getter: (item) => item.name);
    emit(state.copyWith(selectedArea: selectedArea));
  }

  onBandChanged(String bandName) async {
    final selectedBand = getItemByName<Band>(
        list: state.bands, name: bandName, getter: (item) => item.name);
    emit(state.copyWith(selectedBand: selectedBand));
    final areas = await _getAreas();
    emit(state.copyWith(areas: areas, selectedArea: areas[0]));
  }

  onAreaRatingChanged(int rating) async {
    final selectedArea = state.selectedArea;
    final mode = state.mode;
    final area = selectedArea.copyWith(rating: rating);
    emit(state.copyWith(selectedArea: area));
    if (mode == CreatePostScreenMode.edit) {
      // auto update area should be called only edit mode
      _updateAreaOfPost();
    }
  }

  _updateAreaOfPost() async {
    final updatedArea = await areaRepository.updateUserArea(
        areaId: state.selectedArea.id, area: state.selectedArea);
    Post currentPost = state.post!;
    Post post = currentPost.copyWith(
      area: updatedArea,
    );

    postRepository.updatePost(postId: post.id!, updatedPost: post);
  }

  onCreateNewPublishPost({required String postContent, File? imgFile}) {
    emit(state.copyWith(shouldCreateDraft: false));
    _createPost(
        postContent: postContent,
        postStatus: PostStatus.published,
        imgFile: imgFile);
  }

  onUpdatePublishPost({required String postContent, File? imgFile}) {
    _updatePost(
        postId: state.post!.id!,
        postStatus: PostStatus.published,
        postContent: postContent,
        imgFile: imgFile);
  }

  onCreateNewDraftPost({required String postContent, File? imgFile}) {
    _createPost(
        postContent: postContent,
        postStatus: PostStatus.draft,
        imgFile: imgFile);
  }

  onUpdateDraftPost({required String postContent, File? imgFile}) {
    _updatePost(
        postId: state.post!.id!,
        postStatus: PostStatus.draft,
        postContent: postContent,
        imgFile: imgFile);
  }

  onAutoUpdatePost({required String postContent}) {
    // Auto save should be called on Edit mode only
    if (state.mode != CreatePostScreenMode.edit) return;

    final post = state.post;
    if (post!.status == PostStatus.published) {
      onUpdatePublishPost(postContent: postContent);
    } else if (post.status == PostStatus.draft) {
      onUpdateDraftPost(postContent: postContent);
    }
  }

  _createPost(
      {required String postContent,
      required PostStatus postStatus,
      File? imgFile}) async {
    String? imgUrl;
    if (imgFile != null) {
      imgUrl = await _uploadImage(file: imgFile);
    }

    final updatedArea = await areaRepository.updateUserArea(
        areaId: state.selectedArea.id, area: state.selectedArea);

    final post = Post(
        status: postStatus,
        area: updatedArea,
        description: postContent,
        imgUrl: imgUrl);

    postRepository.createPost(post: post);
  }

  _updatePost(
      {required String postId,
      required String postContent,
      required postStatus,
      File? imgFile}) async {
    String? imgUrl;
    if (imgFile != null) {
      imgUrl = await _uploadImage(file: imgFile);
    }
    final updatedArea = await areaRepository.updateUserArea(
        areaId: state.selectedArea.id, area: state.selectedArea);
    Post currentPost = state.post!;
    Post post = currentPost.copyWith(
        status: postStatus,
        area: updatedArea,
        description: postContent,
        imgUrl: imgUrl);

    postRepository.updatePost(postId: postId, updatedPost: post);
  }

  Future<String?> _uploadImage({required File file}) async {
    final url = await userRepository.uploadFile(file: file);
    return url;
  }
}
