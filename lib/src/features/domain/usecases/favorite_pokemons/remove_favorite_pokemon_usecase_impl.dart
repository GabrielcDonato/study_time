import 'package:dartz/dartz.dart';
import 'package:study_time/src/core/errors/failures/export_failures.dart';
import 'package:study_time/src/features/domain/repositories/favorite_pokemons/favorite_pokemons_repository.dart';
import 'package:study_time/src/features/domain/usecases/favorite_pokemons/remove_favorite_pokemon_usecase.dart';

class RemoveFavoritePokemonUsecaseImpl implements RemoveFavoritePokemonUsecase {
  final FavoritePokemonsRepository _favoritePokemonsRepository;

  RemoveFavoritePokemonUsecaseImpl(
      {required FavoritePokemonsRepository favoritePokemonsRepository})
      : _favoritePokemonsRepository = favoritePokemonsRepository;

  @override
  Future<Either<Failure, bool>> call({
    required String userId,
    required String pokemonId,
  }) =>
      _favoritePokemonsRepository.remove(
        pokemonId: pokemonId,
        userId: userId,
      );
}
