import 'package:dartz/dartz.dart';
import 'package:study_time/src/features/domain/entities/user/user_entity.dart';
import 'package:study_time/src/core/errors/failures/export_failures.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract interface class SignInUserUsecase {
  Future<Either<Failure, User?>> call({
    required UserEntity user,
  });
}
