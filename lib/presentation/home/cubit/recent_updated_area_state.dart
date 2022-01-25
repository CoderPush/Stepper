import 'package:equatable/equatable.dart';
import 'package:stepper/data/model/area.dart';
import 'package:stepper/enums/enums.dart';

class RecentUpdatedAreasState extends Equatable {
  final List<Area>? recentUpdatedAreas;
  final CubitStateStatus? status;

  const RecentUpdatedAreasState(
      {this.recentUpdatedAreas = const [],
      this.status = CubitStateStatus.initial});

  RecentUpdatedAreasState copyWith(
          {List<Area>? recentUpdatedAreas, CubitStateStatus? status}) =>
      RecentUpdatedAreasState(
          recentUpdatedAreas: recentUpdatedAreas ?? this.recentUpdatedAreas,
          status: status ?? this.status);

  @override
  List<Object?> get props => [recentUpdatedAreas, status];
}
