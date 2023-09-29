import 'package:dartz/dartz.dart';
import 'package:study_time/src/features/domain/entities/favorite_pokemons/favorite_pokemon_entity.dart';

import '../../../../core/errors/failures/export_failures.dart';

abstract interface class RemoveFavoritePokemonUsecase {
  Future<Either<Failure, bool>> call({
    required FavoritePokemonEntity favoritePokemonEntity,
  });
}
