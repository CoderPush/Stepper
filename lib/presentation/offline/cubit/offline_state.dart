import 'package:equatable/equatable.dart';
import 'package:stepper/data/model2/models2.dart';

class OfflineState extends Equatable {
  final User user;
  final List<Profession> professions;
  final List<Band> bands;
  final List<Area> areas;
  final bool ready;
  OfflineState(
      {User? user,
      this.professions = const [],
      this.bands = const [],
      this.areas = const [],
      this.ready = false})
      : user = user ?? User.empty;

  OfflineState copyWith(
          {User? user,
          List<Profession>? professions,
          List<Band>? bands,
          List<Area>? areas,
          bool? ready}) =>
      OfflineState(
          user: user ?? this.user,
          professions: professions ?? this.professions,
          bands: bands ?? this.bands,
          areas: areas ?? this.areas,
          ready: ready ?? this.ready);

  @override
  List<Object?> get props => [user, professions, bands, areas, ready];
}
