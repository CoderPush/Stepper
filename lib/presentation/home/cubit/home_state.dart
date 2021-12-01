part of 'home_cubit.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitialState extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeLoadedState extends HomeState {
  final List<Area> recentlyUpdatedAreas;
  const HomeLoadedState({required this.recentlyUpdatedAreas});

  @override
  List<Object> get props => [recentlyUpdatedAreas];
}

class HomeErrorState extends HomeState {
  final String errorMessage;
  const HomeErrorState({required this.errorMessage});
}
