import 'dart:io';

import 'package:stepper/data/model2/user.dart';

abstract class UserRepository {
  Future<User> getUser();

  Stream<User> subscribeUser();

  Future<void> createUser();

  Future<void> updateUser(User user);

  Future<String?> uploadFile({required File file});
}
