part of 'area_cubit.dart';

@immutable
abstract class AreaState {
  const AreaState();
}

class AreaInitial extends AreaState {
  const AreaInitial();
}

class AreaLoading extends AreaState {
  const AreaLoading();
}

class AreaLoaded extends AreaState {
  final List<Area> areaList;
  const AreaLoaded({required this.areaList});
}

class AreaError extends AreaState {
  final String errorMessage;
  const AreaError({required this.errorMessage});
}
