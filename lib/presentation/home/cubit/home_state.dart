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
  final List<Post> yourPosts;
  const HomeLoadedState({
    required this.recentlyUpdatedAreas,
    required this.yourPosts,
  });

  @override
  List<Object> get props => [recentlyUpdatedAreas, yourPosts];
}

class HomeErrorState extends HomeState {
  final String errorMessage;
  const HomeErrorState({required this.errorMessage});
}
