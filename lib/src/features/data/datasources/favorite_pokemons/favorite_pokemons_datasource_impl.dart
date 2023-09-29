import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:study_time/src/core/errors/exceptions/export_exceptions.dart';
import 'package:study_time/src/features/data/datasources/favorite_pokemons/favorite_pokemons_datasource.dart';
import 'package:study_time/src/features/data/models/favorite_pokemons/favorite_pokemons_model.dart';
import 'package:collection/collection.dart';

class FavoritePokemonsDatasourceImpl implements FavoritePokemonsDatasource {
  final FirebaseFirestore _firebaseFirestore;

  FavoritePokemonsDatasourceImpl({required FirebaseFirestore firebaseFirestore})
      : _firebaseFirestore = firebaseFirestore;

  @override
  Future<bool> add({
    required FavoritePokemonsModel favoritePokemonsModel,
    required String userId,
  }) async {
    try {
      final favorites = _firebaseFirestore.collection("pokemon_favoritos");

      final docRef = favorites.doc(userId);

      final documentSnapshot = await docRef.get();

      if (documentSnapshot.exists) {
        final data = documentSnapshot.data() as Map<String, dynamic>;

        if (data.containsKey('pokemons')) {
          List<Map<String, dynamic>> pokemonsList = List.from(data["pokemons"]);

          final duplicatedPokemon = pokemonsList.firstWhereOrNull((element) =>
              element['pokemon']['idPokemon'] ==
              favoritePokemonsModel.idPokemon);

          if (duplicatedPokemon == null) {
            pokemonsList.add({
              "pokemon": favoritePokemonsModel.toJson(),
            });
            data["pokemons"] = pokemonsList;
            docRef.update(data);
          } else {
            return false;
          }
        } else {
          data["pokemons"] = [
            {
              "pokemon": favoritePokemonsModel.toJson(),
            }
          ];
          docRef.set(data);
        }
      } else {
        await docRef.set({
          "pokemons": [
            {
              "pokemon": favoritePokemonsModel.toJson(),
            }
          ]
        });
      }

      return true;
    } catch (e, s) {
      throw FavoritePokemonsExceptions(
        message: 'Erro ao adicionar aos favoritos',
        stackTrace: s,
      );
    }
  }

  @override
  Future<bool> remove({
    required String userId,
    required String pokemonId,
  }) async {
    try {
      final favorites = _firebaseFirestore.collection("pokemon_favoritos");
      final docRef = favorites.doc(userId);

      final documentSnapshot = await docRef.get();

      // if (documentSnapshot.exists) {
      final data = documentSnapshot.data() as Map<String, dynamic>;

      if (data.containsKey('pokemons')) {
        List<Map<String, dynamic>> pokemonsList = List.from(data["pokemons"]);

        // Encontre o índice do Pokémon com o pokemonId fornecido
        int indexToRemove = pokemonsList.indexWhere(
            (pokemon) => pokemon['pokemon']['idPokemon'] == pokemonId);

        if (indexToRemove != -1) {
          // Remova o Pokémon da lista
          pokemonsList.removeAt(indexToRemove);

          // Atualize a lista no Firebase Firestore
          data["pokemons"] = pokemonsList;
          await docRef.update(data);

          // O Pokémon foi removido da lista
          return true;
        }
      }
      // }

      // O documento não existe, não há lista de pokemons ou o Pokémon não foi encontrado, retorne false
      return false;
    } catch (e, s) {
      throw FavoritePokemonsExceptions(
        message: 'Erro ao remover dos favoritos',
        stackTrace: s,
      );
    }
  }
}
