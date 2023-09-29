import 'package:dartz/dartz.dart';
import 'package:study_time/src/core/errors/failures/failures.dart';
import 'package:study_time/src/features/domain/entities/get_saved_favorite_pokemons/get_saved_favorite_pokemons_entity.dart';

abstract interface class GetSavedFavoritePokemonsUsecase {
  Future<Either<Failure, GetSavedFavoritePokemonsEntity>> call();
}
