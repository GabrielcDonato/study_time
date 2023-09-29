import 'package:dartz/dartz.dart';
import 'package:study_time/src/core/errors/exceptions/exceptions.dart';
import 'package:study_time/src/core/errors/failures/failures.dart';
import 'package:study_time/src/features/data/datasources/favorite_pokemons/favorite_pokemons_datasource.dart';
import 'package:study_time/src/features/data/models/favorite_pokemons/favorite_pokemons_model.dart';
import 'package:study_time/src/features/domain/entities/favorite_pokemons/favorite_pokemon_entity.dart';
import 'package:study_time/src/features/domain/repositories/favorite_pokemons/favorite_pokemons_repository.dart';

class FavoritePokemonsRepositoryImpl implements FavoritePokemonsRepository {
  final FavoritePokemonsDatasource _favoritePokemonsDatasource;

  FavoritePokemonsRepositoryImpl(
      {required FavoritePokemonsDatasource favoritePokemonsDatasource})
      : _favoritePokemonsDatasource = favoritePokemonsDatasource;

  @override
  Future<Either<FavoritePokemonsFailure, bool>> add(
      {required FavoritePokemonEntity favoritePokemonEntity}) async {
    try {
      final result = await _favoritePokemonsDatasource.add(
        favoritePokemonsModel: FavoritePokemonsModel.fromEntity(
          favoritePokemonEntity: favoritePokemonEntity,
        ),
      );
      return Right(result);
    } on FavoritePokemonsExceptions catch (e) {
      return Left(FavoritePokemonsFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<FavoritePokemonsFailure, bool>> remove(
      {required FavoritePokemonEntity favoritePokemonEntity}) async {
    try {
      final result = await _favoritePokemonsDatasource.remove(
        favoritePokemonsModel: FavoritePokemonsModel.fromEntity(
          favoritePokemonEntity: favoritePokemonEntity,
        ),
      );
      return Right(result);
    } on FavoritePokemonsExceptions catch (e) {
      return Left(FavoritePokemonsFailure(message: e.toString()));
    }
  }
}
