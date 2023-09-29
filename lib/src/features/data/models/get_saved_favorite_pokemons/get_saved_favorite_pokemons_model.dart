import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:study_time/src/features/data/models/get_saved_favorite_pokemons/saved_favorite_pokemon_model.dart';
import 'package:study_time/src/features/domain/entities/get_saved_favorite_pokemons/get_saved_favorite_pokemons_entity.dart';

final class GetSavedFavoritePokemonsModel
    extends GetSavedFavoritePokemonsEntity {
  GetSavedFavoritePokemonsModel({required super.savedPokemons});

  factory GetSavedFavoritePokemonsModel.fromSnapshot(
      QuerySnapshot<Map<String, dynamic>> snapshot) {
    final savedPokemons = snapshot.docs.map(
      (DocumentSnapshot document) {
        Map<String, dynamic> data = document.data() as Map<String, dynamic>;
        return SavedFavoritePokemonModel.fromJson(data);
      },
    ).toList();
    return GetSavedFavoritePokemonsModel(
      savedPokemons: savedPokemons,
    );
  }
}
