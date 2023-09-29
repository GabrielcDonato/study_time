import 'package:study_time/src/features/data/models/get_all_pokemons/get_all_pokemons_model.dart';

abstract interface class GetAllPokemonsDatasource {
  Future<List<PokemonsModel>> call();
}
