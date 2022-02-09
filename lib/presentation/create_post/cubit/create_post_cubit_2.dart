import 'dart:async';
import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stepper/data/model2/models2.dart';
import 'package:stepper/domain/repositories2/repositories2.dart';
import 'package:stepper/presentation/create_post/cubit/create_post_state_2.dart';

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

    final selectedBand = _getItemByName<Band>(
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

    final areas = await areaRepository.getAreasByAreaTypeAndBandId(
        bandId: selectedBand.id, areaType: selectedAreaType);
    final userAreas = await areaRepository.getUserAreasByTypeAndBandId(
        bandId: selectedBand.id, areaType: selectedAreaType);

    final result = areas.map((area) {
      try {
        final userArea = _getItemByName<Area>(
            list: userAreas, name: area.name, getter: (item) => item.name);
        return Area.fromJson(userArea.toJson());
      } catch (error) {
        return area;
      }
    }).toList();
    emit(state.copyWith(isLoadingAreas: false));

    return result;
  }

  _getItemByName<T>(
      {required List<T> list,
      required String name,
      required String Function(T) getter}) {
    return list.firstWhere(
      (item) => getter(item) == name,
    );
  }

