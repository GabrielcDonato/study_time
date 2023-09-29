import 'package:study_time/src/features/domain/entities/get_saved_favorite_pokemons/saved_favorite_pokemon_entity.dart';

class SavedFavoritePokemonModel extends SavedFavoritePokemonEntity {
  SavedFavoritePokemonModel({
    required super.idPokemon,
    required super.namePokemon,
    required super.imagePokemon,
  });

  factory SavedFavoritePokemonModel.fromJson(Map<String, dynamic> json) {
    return SavedFavoritePokemonModel(
      idPokemon: json['pokemon']['idPokemon'],
      imagePokemon: json['pokemon']['imagePokemon'],
      namePokemon: json['pokemon']['namePokemon'],
    );
  }
}
