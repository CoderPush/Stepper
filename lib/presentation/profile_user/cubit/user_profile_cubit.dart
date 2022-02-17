import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stepper/domain/repositories/repositories.dart';
import 'package:stepper/enums/enums.dart';
import 'package:stepper/presentation/profile_user/cubit/user_profile_state.dart';

class UserProfileCubit extends Cubit<UserProfileState> {
  UserRepository userRepository;
  late StreamSubscription userSubscription;

  UserProfileCubit({required this.userRepository}) : super(UserProfileState()) {
    _subscribeUser();
  }

  _subscribeUser() async {
    emit(state.copyWith(fetchingStatus: StateStatus.loading));
    userSubscription = userRepository.subscribeUser().listen((user) {
      emit(state.copyWith(user: user, fetchingStatus: StateStatus.success));
    });
  }

  @override
  Future<void> close() {
    userSubscription.cancel();
    return super.close();
  }
}
