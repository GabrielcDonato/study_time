import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:study_time/src/core/errors/exceptions/exceptions.dart';
import 'package:study_time/src/core/errors/failures/failures.dart';
import 'package:study_time/src/features/data/datasources/user/user_datasource.dart';
import 'package:study_time/src/features/data/models/user/user_model.dart';
import 'package:study_time/src/features/domain/entities/user/user_entity.dart';
import 'package:study_time/src/features/domain/repositories/user/user_repository.dart';

final class UserRepositoryImpl implements UserRepository {
  final UserDatasource _userDatasource;

  UserRepositoryImpl({required UserDatasource userDatasource})
      : _userDatasource = userDatasource;

  @override
  Future<Either<UserFailure, bool>> signOut() async {
    try {
      await _userDatasource.signOut();
      return const Right(true);
    } on UserException catch (exception) {
      return Left(
        UserFailure(
          message: exception.message,
        ),
      );
    }
  }

  @override
  Future<Either<UserFailure, User?>> signUp({required UserEntity user}) async {
    try {
      final result = await _userDatasource.signUp(
        user: UserModel(email: user.email, password: user.password),
      );
      return Right(result);
    } on UserException catch (exception) {
      return Left(
        UserFailure(
          message: exception.message,
        ),
      );
    }
  }

  @override
  Future<Either<UserFailure, User?>> signIn({required UserEntity user}) async {
    try {
      final result = await _userDatasource.signIn(
        user: UserModel(email: user.email, password: user.password),
      );
      return Right(result);
    } on UserException catch (exception) {
      return Left(
        UserFailure(
          message: exception.message,
        ),
      );
    }
  }
}
