import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures/failures.dart';

abstract interface class SignOutUserUsecase {
  Future<Either<UserFailure, bool>> call();
}
