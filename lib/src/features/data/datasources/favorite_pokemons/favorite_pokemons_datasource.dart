import 'package:study_time/src/features/data/models/favorite_pokemons/favorite_pokemons_model.dart';

abstract class FavoritePokemonsDatasource {
  Future<bool> add({
    required FavoritePokemonsModel favoritePokemonsModel,
    required String userId,
  });

  Future<bool> remove({
    required String userId,
    required String pokemonId,
  });
}
