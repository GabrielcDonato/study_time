import 'package:dartz/dartz.dart';
import 'package:study_time/src/features/domain/entities/user/user_entity.dart';
import '../../../../core/errors/failures/failures.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract interface class SignUpUserUsecase {
  Future<Either<UserFailure, User?>> call({
    required UserEntity user,
  });
}
