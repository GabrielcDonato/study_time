import 'package:flutter/foundation.dart';

import 'package:study_time/src/features/domain/entities/get_saved_favorite_pokemons/saved_favorite_pokemon_entity.dart';

class GetSavedFavoritePokemonsEntity {
  final List<SavedFavoritePokemonEntity> savedPokemons;

  GetSavedFavoritePokemonsEntity({
    required this.savedPokemons,
  });

  @override
  bool operator ==(covariant GetSavedFavoritePokemonsEntity other) {
    if (identical(this, other)) return true;

    return listEquals(other.savedPokemons, savedPokemons);
  }

  @override
  int get hashCode {
    return Object.hashAll(savedPokemons);
  }
}
