import 'dart:io';

import 'package:stepper/data/datasources/remote/firebase_services_2/user_firebase_service.dart';
import 'package:stepper/data/model2/user.dart';
import 'package:stepper/domain/repositories2/auth_repository.dart';
import 'package:stepper/domain/repositories2/band_repository.dart';
import 'package:stepper/domain/repositories2/profession_repository.dart';
import 'package:stepper/domain/repositories2/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final defaultProfessionId = 'engineer';
  final defaultBandId = 'engineer_1';
  UserFirebaseService userFirebaseService;
  AuthRepository authRepository;
  ProfessionRepository professionRepository;
  BandRepository bandRepository;

  UserRepositoryImpl(
      {required this.userFirebaseService,
      required this.authRepository,
      required this.professionRepository,
      required this.bandRepository});

  @override
  Future<void> createUser() async {
    final email = authRepository.authUser?.email;

    final defaultProfession = await professionRepository.getProfessionById(
        professionId: defaultProfessionId);
    final defaultBand = await bandRepository.getBandById(bandId: defaultBandId);
    final initialUserData = User(
      id: email!,
      email: email,
      name: email,
      currentProfession: defaultProfession!,
      currentBand: defaultBand!,
    ).toJson();

    await userFirebaseService.createUser(initialUserData);
  }

  @override
  Future<void> updateUser(User user) async {
    await userFirebaseService.updateUser(user.toJson());
  }

  @override
  Future<User> getUser() async {
    return await userFirebaseService.getUser();
  }

  @override
  Future<String?> uploadFile({required File file}) async {
    return await userFirebaseService.uploadFile(file: file);
  }
}
