part of 'get_details_pokemon_cubit.dart';

sealed class GetDetailsPokemonState extends Equatable {
  const GetDetailsPokemonState();

  @override
  List<Object> get props => [];
}

final class GetDetailsPokemonInitial extends GetDetailsPokemonState {
  const GetDetailsPokemonInitial();
}

final class GetDetailsPokemonLoading extends GetDetailsPokemonState {
  const GetDetailsPokemonLoading();
}

final class GetDetailsPokemonError extends GetDetailsPokemonState {
  const GetDetailsPokemonError();
}

final class GetDetailsPokemonSuccess extends GetDetailsPokemonState {
  final DetailsPokemonEntity detailsPokemon;

  const GetDetailsPokemonSuccess({required this.detailsPokemon});

  @override
  List<Object> get props => [detailsPokemon];
}
