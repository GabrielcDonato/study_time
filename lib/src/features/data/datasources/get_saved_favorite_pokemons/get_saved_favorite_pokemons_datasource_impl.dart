import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:study_time/src/core/errors/exceptions/export_exceptions.dart';
import 'package:study_time/src/features/data/datasources/get_saved_favorite_pokemons/get_saved_favorite_pokemons_datasource.dart';
import 'package:study_time/src/features/data/models/get_saved_favorite_pokemons/get_saved_favorite_pokemons_model.dart';

final class GetSavedFavoritePokemonsDatasourceImpl
    implements GetSavedFavoritePokemonsDatasource {
  final FirebaseFirestore _firebaseFirestore;

  GetSavedFavoritePokemonsDatasourceImpl(
      {required FirebaseFirestore firebaseFirestore})
      : _firebaseFirestore = firebaseFirestore;

  @override
  Future<GetSavedFavoritePokemonsModel> call({required String userId}) async {
    try {
      final favorites =
          _firebaseFirestore.collection('pokemon_favoritos').doc(userId);

      final getFavorites = await favorites.get();

      return GetSavedFavoritePokemonsModel.fromSnapshot(
        getFavorites,
      );
    } catch (e, s) {
      throw GetSavedFavoritePokemonsExceptions(
        message: 'Erro ao adicionar aos favoritos',
        stackTrace: s,
      );
    }
  }
}
