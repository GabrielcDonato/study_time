import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures/export_failures.dart';

abstract interface class RemoveFavoritePokemonUsecase {
  Future<Either<Failure, bool>> call({
    required String idPokemon,
  });
}
