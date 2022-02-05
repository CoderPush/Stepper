import 'package:stepper/data/datasources/remote/firebase_services_2/user_firebase_service.dart';
import 'package:stepper/data/model2/user.dart';
import 'package:stepper/domain/repositories2/auth_repository.dart';
import 'package:stepper/domain/repositories2/band_repository.dart';
import 'package:stepper/domain/repositories2/profession_repository.dart';
import 'package:stepper/domain/repositories2/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final DEFAULT_PROFESSION_ID = 'engineer';
  final DEFAULT_BAND_ID = 'engineer_1';
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
        professionId: DEFAULT_PROFESSION_ID);
    final defaultBand =
        await bandRepository.getBandById(bandId: DEFAULT_BAND_ID);
    final initialUserData = User(
      id: email!,
      email: email,
      name: email,
      currentProfession: defaultProfession!,
      currentBand: defaultBand!,
    ).toJson();

    await userFirebaseService.createUser(initialUserData);
  }

  // @override
  // Future<void> updateUser(Map<String, dynamic> data) {}
}
