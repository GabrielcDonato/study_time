import 'package:dartz/dartz.dart';
import 'package:study_time/src/core/errors/failures/failures.dart';
import 'package:study_time/src/features/domain/repositories/user/user_repository.dart';
import 'package:study_time/src/features/domain/usecases/user/sign_out_user_usecase.dart';

final class SignOutUserUsecaseImpl implements SignOutUserUsecase {
  final UserRepository _userRepository;

  SignOutUserUsecaseImpl({required UserRepository userRepository})
      : _userRepository = userRepository;

  @override
  Future<Either<UserFailure, bool>> call() => _userRepository.signOut();
}
