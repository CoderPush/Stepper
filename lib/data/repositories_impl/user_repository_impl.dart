import 'dart:io';

import 'package:stepper/data/datasources/firebase_services/user_firebase_service.dart';
import 'package:stepper/data/models/user.dart';
import 'package:stepper/domain/repositories/auth_repository.dart';
import 'package:stepper/domain/repositories/band_repository.dart';
import 'package:stepper/domain/repositories/profession_repository.dart';
import 'package:stepper/domain/repositories/user_repository.dart';

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
  Future<User> getUser() async {
    final user = await userFirebaseService.getUser();
    if (user == null) {
      await createUser();
      return await getUser();
    }
    return user;
  }

  @override
  Stream<User> subscribeUser() {
    return userFirebaseService.subscribeUser();
  }

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
  Future<String?> uploadFile({required File file}) async {
    return await userFirebaseService.uploadFile(file: file);
  }
}
