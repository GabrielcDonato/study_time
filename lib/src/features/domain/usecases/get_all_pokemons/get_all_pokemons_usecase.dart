import 'package:dartz/dartz.dart';
import 'package:study_time/src/core/errors/failures/failures.dart';
import 'package:study_time/src/features/domain/entities/get_all_pokemons/pokemon_entity.dart';

abstract class GetAllPokemonsUsecase {
  Future<Either<Failure, List<PokemonEntity>>> call();
}
