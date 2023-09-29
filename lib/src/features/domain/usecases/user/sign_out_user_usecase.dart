import 'package:dartz/dartz.dart';
import 'package:study_time/src/core/errors/failures/export_failures.dart';

abstract interface class SignOutUserUsecase {
  Future<Either<Failure, bool>> call();
}
