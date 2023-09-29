import 'package:dartz/dartz.dart';
import 'package:study_time/src/core/errors/failures/export_failures.dart';
import 'package:study_time/src/features/domain/entities/get_all_pokemons/pokemon_entity.dart';

abstract interface class GetAllPokemonsRepository {
  Future<Either<Failure, List<PokemonEntity>>> call();
}
