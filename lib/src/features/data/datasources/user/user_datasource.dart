import 'package:firebase_auth/firebase_auth.dart';
import 'package:study_time/src/features/data/models/user/user_model.dart';

abstract interface class UserDatasource {
  Future<User?> signUp({required UserModel user});

  Future<bool> signOut();
}
