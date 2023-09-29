import 'package:dartz/dartz.dart';
import 'package:study_time/src/core/errors/exceptions/export_exceptions.dart';
import 'package:study_time/src/core/errors/failures/export_failures.dart';
import 'package:study_time/src/features/data/datasources/get_all_pokemons/get_all_pokemons_datasource.dart';
import 'package:study_time/src/features/domain/entities/get_all_pokemons/pokemon_entity.dart';
import 'package:study_time/src/features/domain/repositories/get_all_pokemons/get_all_pokemons_repository.dart';

class GetAllPokemonsRepositoryImpl implements GetAllPokemonsRepository {
  final GetAllPokemonsDatasource _getAllPokemonsDatasource;

  GetAllPokemonsRepositoryImpl(
      {required GetAllPokemonsDatasource getAllPokemonsDatasource})
      : _getAllPokemonsDatasource = getAllPokemonsDatasource;

  @override
  Future<Either<Failure, List<PokemonEntity>>> call() async {
    try {
      final result = await _getAllPokemonsDatasource();
      return Right(result);
    } on PokedexExceptions catch (e) {
      return Left(GetAllPokemonsFailure(message: e.toString()));
    }
  }
}
