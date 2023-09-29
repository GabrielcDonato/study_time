import 'package:dartz/dartz.dart';
import 'package:study_time/src/core/errors/failures/failures.dart';
import 'package:study_time/src/features/domain/entities/favorite_pokemons/favorite_pokemon_entity.dart';

abstract interface class FavoritePokemonsRepository {
  Future<Either<Failure, bool>> add({
    required FavoritePokemonEntity favoritePokemonEntity,
    required String userId,
  });

  Future<Either<Failure, bool>> remove({
    required String userId,
    required String pokemonId,
  });
}
