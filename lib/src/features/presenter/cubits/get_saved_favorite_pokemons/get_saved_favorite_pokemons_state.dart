part of 'get_saved_favorite_pokemons_cubit.dart';

sealed class GetSavedFavoritePokemonsState extends Equatable {
  const GetSavedFavoritePokemonsState();

  @override
  List<Object> get props => [];
}

final class GetSavedFavoritePokemonsInitial
    extends GetSavedFavoritePokemonsState {
  const GetSavedFavoritePokemonsInitial();
}

final class GetSavedFavoritePokemonsLoading
    extends GetSavedFavoritePokemonsState {
  const GetSavedFavoritePokemonsLoading();
}

final class GetSavedFavoritePokemonsError
    extends GetSavedFavoritePokemonsState {
  const GetSavedFavoritePokemonsError();
}

final class GetSavedFavoritePokemonsSuccess
    extends GetSavedFavoritePokemonsState {
  final GetSavedFavoritePokemonsEntity getSavedFavoritePokemonsEntity;

  const GetSavedFavoritePokemonsSuccess(
      {required this.getSavedFavoritePokemonsEntity});

  @override
  List<Object> get props => [
        getSavedFavoritePokemonsEntity,
      ];
}

final class GetSavedFavoritePokemonsSuccessEmpty
    extends GetSavedFavoritePokemonsSuccess {
  const GetSavedFavoritePokemonsSuccessEmpty({
    required super.getSavedFavoritePokemonsEntity,
  });
}
