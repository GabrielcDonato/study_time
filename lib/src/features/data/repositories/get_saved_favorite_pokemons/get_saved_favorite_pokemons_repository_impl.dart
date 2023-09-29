import 'package:dartz/dartz.dart';
import 'package:study_time/src/core/errors/exceptions/export_exceptions.dart';
import 'package:study_time/src/core/errors/failures/failures.dart';
import 'package:study_time/src/features/data/datasources/get_saved_favorite_pokemons/get_saved_favorite_pokemons_datasource.dart';
import 'package:study_time/src/features/domain/entities/get_saved_favorite_pokemons/get_saved_favorite_pokemons_entity.dart';
import 'package:study_time/src/features/domain/repositories/get_saved_favorite_pokemons/get_saved_favorite_pokemons_repository.dart';

class GetSavedFavoritePokemonsRepositoryImpl
    implements GetSavedFavoritePokemonsRepository {
  final GetSavedFavoritePokemonsDatasource _getSavedFavoritePokemonsDatasource;

  GetSavedFavoritePokemonsRepositoryImpl(
      {required GetSavedFavoritePokemonsDatasource
          getSavedFavoritePokemonsDatasource})
      : _getSavedFavoritePokemonsDatasource =
            getSavedFavoritePokemonsDatasource;

  @override
  Future<Either<Failure, GetSavedFavoritePokemonsEntity>>
      getAllFavoritesPokemons({required String userId}) async {
    try {
      final result = await _getSavedFavoritePokemonsDatasource(userId: userId);

      return Right(result);
    } on GetSavedFavoritePokemonsExceptions catch (e) {
      return Left(FavoritePokemonsFailure(message: e.toString()));
    }
  }
}
