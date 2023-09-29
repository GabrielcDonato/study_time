import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures/failures.dart';
import '../../entities/get_all_pokemons/pokemon_entity.dart';

abstract class GetAllPokemonsRepository {
  Future<Either<Failure, List<PokemonEntity>>> call();
}
