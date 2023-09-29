import 'package:dartz/dartz.dart';
import 'package:study_time/src/core/errors/failures/export_failures.dart';
import 'package:study_time/src/features/domain/entities/get_saved_favorite_pokemons/get_saved_favorite_pokemons_entity.dart';

abstract interface class GetSavedFavoritePokemonsRepository {
  Future<Either<Failure, GetSavedFavoritePokemonsEntity>>
      getAllFavoritesPokemons({required String userId});
}
