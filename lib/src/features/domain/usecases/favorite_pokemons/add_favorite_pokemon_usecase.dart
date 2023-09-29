import 'package:dartz/dartz.dart';
import 'package:study_time/src/core/errors/failures/export_failures.dart';
import 'package:study_time/src/features/domain/entities/favorite_pokemons/favorite_pokemon_entity.dart';

abstract interface class AddFavoritePokemonUsecase {
  Future<Either<Failure, bool>> call(
      {required FavoritePokemonEntity favoritePokemonEntity,
      required String userId});
}
