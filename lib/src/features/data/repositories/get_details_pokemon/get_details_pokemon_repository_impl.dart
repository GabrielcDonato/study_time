import 'package:dartz/dartz.dart';
import 'package:study_time/src/core/errors/exceptions/export_exceptions.dart';
import 'package:study_time/src/core/errors/failures/export_failures.dart';
import 'package:study_time/src/features/data/datasources/get_details_pokemon/get_details_pokemon_datasource.dart';
import 'package:study_time/src/features/domain/entities/get_details_pokemon/details_pokemon_entity.dart';
import 'package:study_time/src/features/domain/repositories/get_details_pokemon/get_details_pokemon_repository.dart';

final class GetDetailsPokemonRepositoryImpl
    implements GetDetailsPokemonRepository {
  final GetDetailsPokemonDatasource _getDetailsPokemonDatasource;

  GetDetailsPokemonRepositoryImpl(
      {required GetDetailsPokemonDatasource getDetailsPokemonDatasource})
      : _getDetailsPokemonDatasource = getDetailsPokemonDatasource;

  @override
  Future<Either<Failure, DetailsPokemonEntity>> call(
      {required int pokemonId}) async {
    try {
      final result = await _getDetailsPokemonDatasource(pokemonId: pokemonId);
      return Right(result);
    } on GetDetailsPokemonExceptions catch (e) {
      return Left(
        GetDetailsPokemonsFailure(
          message: e.toString(),
        ),
      );
    }
  }
}
