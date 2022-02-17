import 'package:equatable/equatable.dart';
import 'package:stepper/data/models/models.dart';
import 'package:stepper/enums/enums.dart';

class AreasState extends Equatable {
  final List<Area> areas;
  final AreaType selectedAreaType;
  final Band userCurrentBand;
  final StateStatus fetchingStatus;

  AreasState(
      {this.areas = const [],
      this.selectedAreaType = AreaType.scope,
      this.fetchingStatus = StateStatus.initial,
      userCurrentBand})
      : userCurrentBand = userCurrentBand ?? Band.empty;

  copyWith(
          {List<Area>? areas,
          AreaType? selectedAreaType,
          StateStatus? fetchingStatus,
          Band? userCurrentBand}) =>
      AreasState(
          areas: areas ?? this.areas,
          selectedAreaType: selectedAreaType ?? this.selectedAreaType,
          fetchingStatus: fetchingStatus ?? this.fetchingStatus,
          userCurrentBand: userCurrentBand ?? this.userCurrentBand);

  @override
  List<Object?> get props =>
      [areas, selectedAreaType, fetchingStatus, userCurrentBand];
}
