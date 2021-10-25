part of 'area_cubit.dart';

@immutable
abstract class AreaState {
  final AreaType areaType;
  const AreaState({required this.areaType});
}

class AreaInitial extends AreaState {
  const AreaInitial() : super(areaType: AreaType.scope);
}

class AreaLoading extends AreaState {
  const AreaLoading({required areaType}) : super(areaType: areaType);
}

class AreaLoaded extends AreaState {
  final List<Area> areaList;
  const AreaLoaded({
    required this.areaList,
    required areaType,
  }) : super(areaType: areaType);
}

class AreaError extends AreaState {
  final String errorMessage;
  const AreaError({
    required this.errorMessage,
    required areaType,
  }) : super(areaType: areaType);
}
