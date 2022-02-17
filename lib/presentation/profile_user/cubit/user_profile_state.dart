import 'package:equatable/equatable.dart';
import 'package:stepper/data/models/models.dart';
import 'package:stepper/enums/enums.dart';

class UserProfileState extends Equatable {
  final User user;
  final StateStatus fetchingStatus;

  UserProfileState({User? user, this.fetchingStatus = StateStatus.initial})
      : user = user ?? User.empty;

  UserProfileState copyWith({User? user, StateStatus? fetchingStatus}) =>
      UserProfileState(
          user: user ?? this.user,
          fetchingStatus: fetchingStatus ?? this.fetchingStatus);

  @override
  List<Object?> get props => [user, fetchingStatus];
}
