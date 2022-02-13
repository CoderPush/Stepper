import 'dart:async';
import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stepper/domain/repositories2/repositories2.dart';
import 'package:stepper/presentation/offline/cubit/offline_state.dart';

class OfflineCubit extends Cubit<OfflineState> {
  AuthRepository authRepository;
  UserRepository userRepository;
  ProfessionRepository professionRepository;
  BandRepository bandRepository;
  AreaRepository areaRepository;
  StreamSubscription? _authenticatedUserSubscription;

  OfflineCubit(
      {required this.authRepository,
      required this.userRepository,
      required this.professionRepository,
      required this.bandRepository,
      required this.areaRepository})
      : super(OfflineState()) {
    _init();
  }

  _init() async {
    _authenticatedUserSubscription = authRepository
        .subscribeAuthenticatedUser()
        .listen((auththenticatedUser) {
      final isSignedIn = auththenticatedUser != null;
      if (isSignedIn) {
        _getDataForOffline();
      }
    });
  }

  _getDataForOffline() async {
    final user = await userRepository.getUser();
    final professions = await professionRepository.getAllProfessions();
    final bands = await bandRepository.getAllBands();
    final areas = await areaRepository.getAllAreas();
    log("Cached db for offline mode fetched");
    emit(state.copyWith(
        user: user,
        professions: professions,
        bands: bands,
        areas: areas,
        ready: true));
  }

  @override
  Future<void> close() {
    _authenticatedUserSubscription?.cancel();
    return super.close();
  }
}
