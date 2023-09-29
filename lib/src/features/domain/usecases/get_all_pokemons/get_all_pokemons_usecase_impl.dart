import 'package:dartz/dartz.dart';
import 'package:study_time/src/core/errors/failures/export_failures.dart';
import 'package:study_time/src/features/domain/entities/get_all_pokemons/pokemon_entity.dart';
import 'package:study_time/src/features/domain/repositories/get_all_pokemons/get_all_pokemons_repository.dart';
import 'package:study_time/src/features/domain/usecases/get_all_pokemons/get_all_pokemons_usecase.dart';

class GetAllPokemonsUsecaseImpl implements GetAllPokemonsUsecase {
  final GetAllPokemonsRepository _getAllPokemonsRepository;

  GetAllPokemonsUsecaseImpl({
    required GetAllPokemonsRepository getAllPokemonsRepository,
  }) : _getAllPokemonsRepository = getAllPokemonsRepository;

  @override
  Future<Either<Failure, List<PokemonEntity>>> call() async =>
      await _getAllPokemonsRepository();
}
