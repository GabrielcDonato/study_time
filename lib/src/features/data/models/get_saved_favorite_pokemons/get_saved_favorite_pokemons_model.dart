import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:study_time/src/features/data/models/get_saved_favorite_pokemons/saved_favorite_pokemon_model.dart';
import 'package:study_time/src/features/domain/entities/get_saved_favorite_pokemons/get_saved_favorite_pokemons_entity.dart';

final class GetSavedFavoritePokemonsModel
    extends GetSavedFavoritePokemonsEntity {
  GetSavedFavoritePokemonsModel({required super.savedPokemons});

  factory GetSavedFavoritePokemonsModel.fromMap(
      QuerySnapshot<Map<String, dynamic>> snap) {
    var snapshot = snap as Map<String, dynamic>;

    final savedPokemons = (snapshot['pokemons'] as List? ?? [])
        .cast<Map<String, dynamic>>()
        .map(SavedFavoritePokemonModel.fromJson)
        .toList();

    return GetSavedFavoritePokemonsModel(
      savedPokemons: savedPokemons,
    );
  }
}
