part of 'favorite_pokemons_cubit.dart';

sealed class FavoritePokemonsState extends Equatable {
  const FavoritePokemonsState();

  @override
  List<Object> get props => [];
}

final class FavoritePokemonsInitial extends FavoritePokemonsState {
  const FavoritePokemonsInitial();
}

final class FavoritePokemonsError extends FavoritePokemonsState {
  final String message;

  const FavoritePokemonsError({required this.message});
}

final class FavoritePokemonsLoading extends FavoritePokemonsState {
  const FavoritePokemonsLoading();
}

final class FavoritePokemonsSuccess extends FavoritePokemonsState {
  const FavoritePokemonsSuccess();
}
