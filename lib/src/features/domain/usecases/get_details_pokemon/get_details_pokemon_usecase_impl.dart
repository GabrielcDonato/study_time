import 'package:dartz/dartz.dart';
import 'package:study_time/src/core/errors/failures/export_failures.dart';
import 'package:study_time/src/features/domain/entities/get_details_pokemon/details_pokemon_entity.dart';
import 'package:study_time/src/features/domain/repositories/get_details_pokemon/get_details_pokemon_repository.dart';
import 'package:study_time/src/features/domain/usecases/get_details_pokemon/get_details_pokemon_usecase.dart';

class GetDetailsPokemonUsecaseImpl implements GetDetailsPokemonUsecase {
  final GetDetailsPokemonRepository _getDetailsPokemonRepository;

  GetDetailsPokemonUsecaseImpl(
      {required GetDetailsPokemonRepository getDetailsPokemonRepository})
      : _getDetailsPokemonRepository = getDetailsPokemonRepository;

  @override
  Future<Either<Failure, DetailsPokemonEntity>> call(
          {required int pokemonId}) async =>
      await _getDetailsPokemonRepository(pokemonId: pokemonId);
}
