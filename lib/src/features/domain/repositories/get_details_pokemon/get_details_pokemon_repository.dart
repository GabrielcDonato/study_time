import 'package:dartz/dartz.dart';
import 'package:study_time/src/core/errors/failures/export_failures.dart';
import 'package:study_time/src/features/domain/entities/get_details_pokemon/details_pokemon_entity.dart';

abstract class GetDetailsPokemonRepository {
  Future<Either<Failure, DetailsPokemonEntity>> call({required int pokemonId});
}
