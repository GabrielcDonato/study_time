import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:study_time/src/features/data/models/get_saved_favorite_pokemons/saved_favorite_pokemon_model.dart';
import 'package:study_time/src/features/domain/entities/get_saved_favorite_pokemons/get_saved_favorite_pokemons_entity.dart';

final class GetSavedFavoritePokemonsModel
    extends GetSavedFavoritePokemonsEntity {
  GetSavedFavoritePokemonsModel({required super.savedPokemons});

  factory GetSavedFavoritePokemonsModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> snapshot) {
    return GetSavedFavoritePokemonsModel(
      savedPokemons: List<SavedFavoritePokemonModel>.from(
        (snapshot['pokemons'] as List<dynamic>).map<SavedFavoritePokemonModel>(
          (pokemon) => SavedFavoritePokemonModel.fromJson(
              pokemon as Map<String, dynamic>),
        ),
      ),
    );
  }
}
