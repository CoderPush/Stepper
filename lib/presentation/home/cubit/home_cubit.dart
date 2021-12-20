import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:stepper/data/datasources/remote/services.dart';
import 'package:stepper/data/model/models.dart';
import 'package:stepper/data/repositories/repositories_impl.dart';
import 'package:stepper/domain/repositories/repositories.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final AreaRepository areaRepository;
  final PostRepository postRepository;
  final SettingFirebaseService settingFirebaseService;
  StreamSubscription<List<Post>>? _postStreamSubscription;

  HomeCubit({
    required this.areaRepository,
    required this.postRepository,
    required this.settingFirebaseService,
  }) : super(HomeInitialState()) {
    loadHomeScreen();
  }

  Future<void> loadHomeScreen() async {
    try {
      emit(HomeLoadingState());
      final recentlyUpdatedAreas =
          await areaRepository.fetchRecentlyUpdatedAreas();
      _postStreamSubscription =
          postRepository.watchAllPosts().listen((postList) async {
        final areaNames =
            await settingFirebaseService.getParentAndChildrenAreaNames();
        final yourPost = postList
            .where((post) => areaNames.contains(post.areaName))
            .toList()
          ..sort((first, next) => next.postedTime.compareTo(first.postedTime));
        emit(HomeLoadedState(
          recentlyUpdatedAreas: recentlyUpdatedAreas,
          yourPosts: yourPost,
        ));
      }, cancelOnError: true);
    } on NetworkException {
      emit(const HomeErrorState(errorMessage: 'Network error'));
    }
  }

  @override
  Future<void> close() async {
    await _postStreamSubscription?.cancel();
    return super.close();
  }
}
