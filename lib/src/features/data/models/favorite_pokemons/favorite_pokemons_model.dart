import 'package:study_time/src/features/domain/entities/favorite_pokemons/favorite_pokemon_entity.dart';

class FavoritePokemonsModel extends FavoritePokemonEntity {
  FavoritePokemonsModel({
    required super.idPokemon,
    required super.namePokemon,
    required super.imagePokemon,
  });

  Map<String, dynamic> toJson() => {
        "idPokemon": idPokemon,
        "namePokemon": namePokemon,
        "imagePokemon": imagePokemon,
      };

  factory FavoritePokemonsModel.fromEntity(
      {required FavoritePokemonEntity favoritePokemonEntity}) {
    return FavoritePokemonsModel(
      idPokemon: favoritePokemonEntity.idPokemon,
      namePokemon: favoritePokemonEntity.namePokemon,
      imagePokemon: favoritePokemonEntity.imagePokemon,
    );
  }
}
