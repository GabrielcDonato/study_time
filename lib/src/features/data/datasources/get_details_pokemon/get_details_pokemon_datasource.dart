import 'package:study_time/src/features/data/models/get_details_pokemon/details_pokemon_model.dart';

abstract class GetDetailsPokemonDatasource {
  Future<DetailsPokemonModel> call({required int pokemonId});
}
