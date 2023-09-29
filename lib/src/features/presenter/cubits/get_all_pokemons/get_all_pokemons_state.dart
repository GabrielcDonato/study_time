part of 'get_all_pokemons_cubit.dart';

sealed class GetAllPokemonsState extends Equatable {
  const GetAllPokemonsState();

  @override
  List<Object?> get props => [];
}

final class GetAllPokemonsInitial extends GetAllPokemonsState {
  const GetAllPokemonsInitial();
}

final class GetAllPokemonsLoading extends GetAllPokemonsState {
  const GetAllPokemonsLoading();
}

final class GetAllPokemonsError extends GetAllPokemonsState {
  const GetAllPokemonsError();
}

class GetAllPokemonsSuccess extends GetAllPokemonsState {
  final List<PokemonEntity> pokemons;
  final String? filter;
  final TypeSearch? typeSearch;
  const GetAllPokemonsSuccess({
    required this.pokemons,
    this.filter,
    this.typeSearch = TypeSearch.name,
  });

  GetAllPokemonsSuccess copyWith({
    List<PokemonEntity>? pokemons,
    final String? filter,
    final TypeSearch? typeSearch,
  }) {
    return GetAllPokemonsSuccess(
      pokemons: pokemons ?? this.pokemons,
      filter: filter ?? this.filter,
      typeSearch: typeSearch ?? this.typeSearch,
    );
  }

  @override
  List<Object?> get props => [pokemons, filter, typeSearch];
}
