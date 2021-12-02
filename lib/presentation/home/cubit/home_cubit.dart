import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:stepper/data/model/models.dart';
import 'package:stepper/data/repositories/repositories_impl.dart';
import 'package:stepper/domain/repositories/repositories.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final AreaRepository areaRepository;

  HomeCubit({required this.areaRepository}) : super(HomeInitialState()) {
    loadHomeScreen();
  }

  Future<void> loadHomeScreen() async {
    try {
      emit(HomeLoadingState());
      final recentlyUpdatedAreas =
          await areaRepository.fetchRecentlyUpdatedAreas();
      emit(HomeLoadedState(recentlyUpdatedAreas: recentlyUpdatedAreas));
    } on NetworkException {
      emit(const HomeErrorState(errorMessage: 'Network error'));
    }
  }
}
