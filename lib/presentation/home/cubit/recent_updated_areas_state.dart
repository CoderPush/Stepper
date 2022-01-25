import 'package:equatable/equatable.dart';
import 'package:stepper/data/model/area.dart';
import 'package:stepper/enums/enums.dart';

class RecentUpdatedAreasState extends Equatable {
  final List<Area> recentUpdatedAreas;
  final StateStatus? status;

  const RecentUpdatedAreasState(
      {this.recentUpdatedAreas = const [], this.status = StateStatus.initial});

  RecentUpdatedAreasState copyWith(
          {List<Area>? recentUpdatedAreas, StateStatus? status}) =>
      RecentUpdatedAreasState(
          recentUpdatedAreas: recentUpdatedAreas ?? this.recentUpdatedAreas,
          status: status ?? this.status);

  @override
  List<Object?> get props => [recentUpdatedAreas, status];
}
