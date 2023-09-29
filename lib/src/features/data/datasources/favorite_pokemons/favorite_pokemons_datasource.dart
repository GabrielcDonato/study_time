import 'package:study_time/src/features/data/models/favorite_pokemons/favorite_pokemons_model.dart';

abstract class FavoritePokemonsDatasource {
  Future<bool> add({required FavoritePokemonsModel favoritePokemonsModel});

  Future<bool> remove({required FavoritePokemonsModel favoritePokemonsModel});
}
