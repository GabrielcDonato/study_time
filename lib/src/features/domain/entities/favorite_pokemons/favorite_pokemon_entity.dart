class FavoritePokemonEntity {
  final String idPokemon;
  final String namePokemon;
  final String imagePokemon;

  FavoritePokemonEntity({
    required this.idPokemon,
    required this.namePokemon,
    required this.imagePokemon,
  });

  @override
  bool operator ==(covariant FavoritePokemonEntity other) {
    if (identical(this, other)) return true;

    return other.idPokemon == idPokemon &&
        other.namePokemon == namePokemon &&
        other.imagePokemon == imagePokemon;
  }

  @override
  int get hashCode =>
      idPokemon.hashCode ^ namePokemon.hashCode ^ imagePokemon.hashCode;
}
