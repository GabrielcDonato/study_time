import 'package:dartz/dartz.dart';
import 'package:study_time/src/core/errors/exceptions/exceptions.dart';
import 'package:study_time/src/core/errors/failures/failures.dart';
import 'package:study_time/src/features/data/datasources/favorite_pokemons/favorite_pokemons_datasource.dart';
import 'package:study_time/src/features/data/models/favorite_pokemons/favorite_pokemons_model.dart';
import 'package:study_time/src/features/domain/entities/favorite_pokemons/favorite_pokemon_entity.dart';
import 'package:study_time/src/features/domain/repositories/favorite_pokemons/favorite_pokemons_repository.dart';

final class FavoritePokemonsRepositoryImpl
    implements FavoritePokemonsRepository {
  final FavoritePokemonsDatasource _favoritePokemonsDatasource;

  FavoritePokemonsRepositoryImpl(
      {required FavoritePokemonsDatasource favoritePokemonsDatasource})
      : _favoritePokemonsDatasource = favoritePokemonsDatasource;

  @override
  Future<Either<Failure, bool>> add({
    required FavoritePokemonEntity favoritePokemonEntity,
    required String userId,
  }) async {
    try {
      final result = await _favoritePokemonsDatasource.add(
        userId: userId,
        favoritePokemonsModel: FavoritePokemonsModel.fromEntity(
          favoritePokemonEntity: favoritePokemonEntity,
        ),
      );
      return Right(result);
    } on FavoritePokemonsExceptions catch (e) {
      return Left(
        FavoritePokemonsFailure(
          message: e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, bool>> remove({
    required String userId,
    required String pokemonId,
  }) async {
    try {
      final result = await _favoritePokemonsDatasource.remove(
        userId: userId,
        pokemonId: pokemonId,
      );
      return Right(result);
    } on FavoritePokemonsExceptions catch (e) {
      return Left(
        FavoritePokemonsFailure(
          message: e.toString(),
        ),
      );
    }
  }
}
