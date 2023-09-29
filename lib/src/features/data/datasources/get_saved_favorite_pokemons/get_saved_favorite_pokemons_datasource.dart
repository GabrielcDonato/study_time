import 'package:study_time/src/features/data/models/get_saved_favorite_pokemons/get_saved_favorite_pokemons_model.dart';

abstract interface class GetSavedFavoritePokemonsDatasource {
  Future<GetSavedFavoritePokemonsModel> call();
}
