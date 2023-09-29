import 'package:dartz/dartz.dart';
import 'package:study_time/src/core/errors/failures/failures.dart';
import 'package:study_time/src/features/domain/entities/favorite_pokemons/favorite_pokemon_entity.dart';

abstract interface class FavoritePokemonsRepository {
  Future<Either<FavoritePokemonsFailure, bool>> add({
    required FavoritePokemonEntity favoritePokemonEntity,
  });

  Future<Either<FavoritePokemonsFailure, bool>> remove({
    required FavoritePokemonEntity favoritePokemonEntity,
  });
}
