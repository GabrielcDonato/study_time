import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:study_time/src/core/errors/failures/export_failures.dart';
import 'package:study_time/src/features/domain/entities/user/user_entity.dart';

abstract interface class UserRepository {
  Future<Either<Failure, User?>> signUp({
    required UserEntity user,
  });

  Future<Either<Failure, User?>> signIn({
    required UserEntity user,
  });

  Future<Either<Failure, bool>> signOut();
}
