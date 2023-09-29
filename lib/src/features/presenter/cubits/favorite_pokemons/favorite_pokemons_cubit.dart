import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:study_time/src/features/domain/entities/favorite_pokemons/favorite_pokemon_entity.dart';
import 'package:study_time/src/features/domain/usecases/favorite_pokemons/add_favorite_pokemon_usecase.dart';
import 'package:study_time/src/features/domain/usecases/favorite_pokemons/remove_favorite_pokemon_usecase.dart';

part 'favorite_pokemons_state.dart';

class FavoritePokemonsCubit extends Cubit<FavoritePokemonsState> {
  final AddFavoritePokemonUsecase _addFavoritePokemonUsecase;

  final RemoveFavoritePokemonUsecase _removeFavoritePokemonUsecase;

  FavoritePokemonsCubit(
      {required AddFavoritePokemonUsecase addFavoritePokemonUsecase,
      required RemoveFavoritePokemonUsecase removeFavoritePokemonUsecase})
      : _addFavoritePokemonUsecase = addFavoritePokemonUsecase,
        _removeFavoritePokemonUsecase = removeFavoritePokemonUsecase,
        super(
          const FavoritePokemonsInitial(),
        );

  void removeFromFavorite({
    required String idPokemon,
  }) async {
    emit(const FavoritePokemonsLoading());

    final result = await _removeFavoritePokemonUsecase(
      idPokemon: idPokemon,
    );

    result.fold(
      (l) => emit(const RemoveFavoritePokemonsError()),
      (r) => emit(
        const RemoveFavoritePokemonsSuccess(),
      ),
    );
  }

  void addToFavorite({
    required FavoritePokemonEntity favoritePokemonEntity,
  }) async {
    emit(const FavoritePokemonsLoading());

    final result = await _addFavoritePokemonUsecase(
      favoritePokemonEntity: favoritePokemonEntity,
    );

    result.fold(
        (l) => emit(FavoritePokemonsError(
            message: l.message ?? "Erro ao adicionar pokemon aos favoritos")),
        (r) {
      if (r == true) {
        emit(
          const FavoritePokemonsSuccess(),
        );
      } else if (r == false) {
        emit(const FavoritePokemonsError(
            message: "Este pokemon já está na lista de favoritos"));
      }
    });
  }
}
