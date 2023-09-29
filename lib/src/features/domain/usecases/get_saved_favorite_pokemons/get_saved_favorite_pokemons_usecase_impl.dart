import 'package:dartz/dartz.dart';
import 'package:study_time/src/core/errors/failures/failures.dart';
import 'package:study_time/src/features/domain/entities/get_saved_favorite_pokemons/get_saved_favorite_pokemons_entity.dart';
import 'package:study_time/src/features/domain/repositories/get_saved_favorite_pokemons/get_saved_favorite_pokemons_repository.dart';
import 'package:study_time/src/features/domain/usecases/get_saved_favorite_pokemons/get_saved_favorite_pokemons_usecase.dart';

final class GetSavedFavoritePokemonsUsecaseImpl
    implements GetSavedFavoritePokemonsUsecase {
  final GetSavedFavoritePokemonsRepository _getSavedFavoritePokemonsRepository;

  GetSavedFavoritePokemonsUsecaseImpl({
    required GetSavedFavoritePokemonsRepository
        getSavedFavoritePokemonsRepository,
  }) : _getSavedFavoritePokemonsRepository = getSavedFavoritePokemonsRepository;

  @override
  Future<Either<Failure, GetSavedFavoritePokemonsEntity>> call(
          {required String userId}) =>
      _getSavedFavoritePokemonsRepository.getAllFavoritesPokemons(
          userId: userId);
}
