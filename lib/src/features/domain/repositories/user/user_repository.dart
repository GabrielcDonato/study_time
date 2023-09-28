import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:study_time/src/features/domain/entities/user/user_entity.dart';

import '../../../../core/errors/failures/failures.dart';

abstract interface class UserRepository {
  Future<Either<UserFailure, User?>> signUp({required UserEntity user});

  Future<Either<UserFailure, User?>> signIn({required UserEntity user});

  Future<Either<UserFailure, bool>> signOut();
}
