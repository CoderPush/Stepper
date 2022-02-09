import 'dart:io';

import 'package:stepper/data/model2/user.dart';

abstract class UserRepository {
  Future<void> createUser();
  Future<User> getUser();
  Future<String?> uploadFile({required File file});
}
