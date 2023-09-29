import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:study_time/src/core/errors/exceptions/export_exceptions.dart';
import 'package:study_time/src/features/data/datasources/favorite_pokemons/favorite_pokemons_datasource.dart';
import 'package:study_time/src/features/data/models/favorite_pokemons/favorite_pokemons_model.dart';

class FavoritePokemonsDatasourceImpl implements FavoritePokemonsDatasource {
  final FirebaseFirestore _firebaseFirestore;

  FavoritePokemonsDatasourceImpl({required FirebaseFirestore firebaseFirestore})
      : _firebaseFirestore = firebaseFirestore;

  @override
  Future<bool> add(
      {required FavoritePokemonsModel favoritePokemonsModel}) async {
    try {
      final favorites = _firebaseFirestore.collection("pokemon_favoritos");

      final docRef = favorites.doc(favoritePokemonsModel.idPokemon);

      final documentSnapshot = await docRef.get();

      if (documentSnapshot.exists) {
        return false;
      }

      await docRef.set({
        "pokemon": favoritePokemonsModel.toJson(),
      });

      return true;
    } catch (e, s) {
      throw FavoritePokemonsExceptions(
        message: 'Erro ao adicionar aos favoritos',
        stackTrace: s,
      );
    }
  }

  @override
  Future<bool> remove(
      {required FavoritePokemonsModel favoritePokemonsModel}) async {
    try {
      final favorites = _firebaseFirestore.collection("pokemon_favoritos");

      final docRef = favorites.doc(favoritePokemonsModel.idPokemon);

      await docRef.delete();

      return true;
    } catch (e, s) {
      throw FavoritePokemonsExceptions(
        message: 'n removeu dos favoritos',
        stackTrace: s,
      );
    }
  }
}
