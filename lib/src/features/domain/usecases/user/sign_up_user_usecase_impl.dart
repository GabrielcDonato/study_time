import 'package:dartz/dartz.dart';
import 'package:study_time/src/core/errors/failures/failures.dart';
import 'package:study_time/src/features/domain/entities/user/user_entity.dart';
import 'package:study_time/src/features/domain/repositories/user/user_repository.dart';
import 'package:study_time/src/features/domain/usecases/user/sign_up_user_usecase.dart';
import 'package:firebase_auth/firebase_auth.dart';

final class SignUpUserUsecaseImpl implements SignUpUserUsecase {
  final UserRepository _userRepository;

  SignUpUserUsecaseImpl({required UserRepository userRepository})
      : _userRepository = userRepository;

  @override
  Future<Either<UserFailure, User?>> call({required UserEntity user}) =>
      _userRepository.signUp(user: user);
}
